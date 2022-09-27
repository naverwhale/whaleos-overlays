#!/bin/bash
#
# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

set -e

HELP_TEXT=$(cat <<END
This script repacks the kernel squash and updates the ebuild automatically
according to the given patchset url or the patch id.
If the patchset number is unspecified, this script will use the latest
patchset to generate the kernel squash.

Examples:
    sh repack.sh https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2206575/12
    sh repack.sh https://crrev.com/c/2206575/
    sh repack.sh CL:2206575/12
    sh repack.sh 2206575
END
)

# Variables that customize the script for a board.
BOARD=cherry
MAJOR_VER=5
MINOR_VER=10
BUG_ID=185092438

script="$(realpath "${BASH_SOURCE[0]}")"
kernel_dir="${script%overlays*}third_party/kernel/v${MAJOR_VER}.${MINOR_VER}"
ebuild_dir="$(dirname "${script}")/.."

patch_id=""
patchset=""
base=""
tree=""

info() {
  echo -e "\e[1;32m$*\e[0m"
}

generate_new_squash() {
  info "Running \`git fetch cros\` in ${kernel_dir}..."

  pushd "${kernel_dir}"
  git fetch cros

  local patch_info

  patch_info="$(sed -E 's/[^0-9]*(.*[0-9]+).*/\1/' <<< "$1")"
  patch_id="${patch_info%/*}"
  patchset="${patch_info#*/}"


  if [[ "${patch_info}" == "${patchset}" ]]; then
    info "Getting the latest patchset number of CL:${patch_id}..."
    patchset="$(git ls-remote cros "refs/changes/${patch_id: -2}/${patch_id}*" \
      | awk -F/ '{print $5}' | sort -n | tail -n1)"
  fi

  info "Fetching CL:${patch_id}/${patchset}..."
  git fetch "https://chromium.googlesource.com/chromiumos/third_party/kernel" \
    refs/changes/"${patch_id: -2}"/"${patch_id}"/"${patchset}"

  base="$(git merge-base "cros/chromeos-${MAJOR_VER}.${MINOR_VER}" FETCH_HEAD)"
  tree="$(git cat-file -p "${base}" | sed -n 's/^tree //p' | head -n 1)"

  info "Generating new squash..."
  git diff --full-index "${base}" FETCH_HEAD > \
    "${ebuild_dir}/files/${BOARD}-tot.patch"

  popd
}

update_ebuild() {
  info "Updating and upreving ebuild..."

  local ebuild
  local symlink
  local old_base
  local old_tree
  local ver
  local rev

  pushd "${ebuild_dir}"

  ebuild="$(find ./*.ebuild -type f)"
  symlink="$(find ./*-r*.ebuild -type l)"
  old_base="$(grep CROS_WORKON_COMMIT "${ebuild}" | cut -d \" -f 2)"
  old_tree="$(grep CROS_WORKON_TREE "${ebuild}" | cut -d \" -f 2)"
  ver="$(echo "${symlink}" | sed -Ee 's/.*\.([0-9]+)-r([0-9]+).ebuild/\1/')"
  rev="$(echo "${symlink}" | sed -Ee 's/.*\.([0-9]+)-r([0-9]+).ebuild/\2/')"

  sed -i s/"${old_base}"/"${base}"/g "${ebuild}"
  sed -i s/"${old_tree}"/"${tree}"/g "${ebuild}"
  git add "${ebuild}"
  # Uprev ebuild symlink to make pre-upload checks happy.
  git mv "${symlink}" \
    "chromeos-kernel-${MAJOR_VER}_${MINOR_VER}-0.0.${ver}-r$((rev + 1)).ebuild"

  popd
}

update_scmversion() {
  info "Updating .scmversion..."

  local old="-CL[0-9]*-v[0-9]*$"
  local new="-CL${patch_id}-v${patchset}"

  sed -i "s/${old}/${new}/g" "${ebuild_dir}"/files/scmversion.patch
}

commit_change() {
  info "Committing change..."

  local tot_commit_id
  local tot_name

  pushd "${kernel_dir}"

  tot_commit_id="$(git log FETCH_HEAD -n 1 --pretty=format:"%h")"
  tot_name="$(git log FETCH_HEAD -n 1 --pretty=format:"%s" | \
    sed -E 's/DO-NOT-SUBMIT: (.*[^\.]).*/\1/' | tr -d '"')"

  popd

  pushd "${ebuild_dir}"

  local commit_msg
  read -r -d \" commit_msg <<END
${BOARD}: update ebuild with private patch for kernel ${MAJOR_VER}.${MINOR_VER}

Apply ${tot_name} #${patchset} (CL:${patch_id}/${patchset}, ${tot_commit_id}) on commit ${base:0:13}.

The squash is created by running \`bash repack.sh $1\` which does the following:

git fetch cros

git merge-base cros/chromeos-${MAJOR_VER}.${MINOR_VER} ${tot_commit_id}
> ${base}

git cat-file -p ${base} | sed -n 's/^tree //p' | head -n 1
> ${tree}

diff generated with
git diff --full-index ${base} ${tot_commit_id} > ${BOARD}-tot.patch


BUG=b:${BUG_ID}
TEST=cros-workon-${BOARD} stop chromeos-kernel-${MAJOR_VER}_${MINOR_VER}
     emerge-${BOARD} chromeos-kernel-${MAJOR_VER}_${MINOR_VER}
"
END

  git add files/"${BOARD}"-tot.patch
  git add files/scmversion.patch
  git commit -m "${commit_msg}"
  git commit --amend

  popd
}

main() {
  if [[ $# != 1 ]]; then
    echo "${HELP_TEXT}"
    exit 0
  fi

  generate_new_squash "$1"
  update_ebuild
  update_scmversion
  commit_change "$1"

  info "Please run \`cros-workon-${BOARD} stop chromeos-kernel-${MAJOR_VER}_${MINOR_VER} &&"\
    "emerge-${BOARD} chromeos-kernel-${MAJOR_VER}_${MINOR_VER}\` in chroot to verify the result."
}

main "$@"
