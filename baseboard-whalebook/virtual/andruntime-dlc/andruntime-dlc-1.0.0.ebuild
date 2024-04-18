# Copyright 2024 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit dlc cros-workon

# This ebuild is upreved via PuPR, so disable the normal uprev process for
# cros-workon ebuilds.
CROS_WORKON_MANUAL_UPREV="1"

# "cros_workon info" expects these variables to be set, but we don't have a git
# repo, so use the standard empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="../platform/empty-project"

DESCRIPTION="DLC android runtime package for WhaleOS."
SRC_URI=""

RESTRICT="mirror"
LICENSE="BSD-Goggle"
SLOT="0"
KEYWORDS="~*"
S="${WORKDIR}"

IUSE="dlc amd64 arm"
REQUIRED_USE="
	dlc
	^^ ( amd64 arm arm64 )
"

# Termina now contains 2 copies of LXD, pulling the image size up to
# ~185 MiB. Test builds need extra space for test utilities.
#
# To check the current size, run "file" on a deployed DLC image. The
# output will tell you the size of the squashfs filesystem.
#
# 1MiB = 256 x 4KiB blocks
DLC_PREALLOC_BLOCKS="$((600 * 256))"
DLC_PRELOAD=false

# We need to inherit from cros-workon so people can do "cros-workon-${BOARD}
# start termina-dlc", but we don't want to actually run any of the cros-workon
# steps, so we override pkg_setup and src_unpack with the default
# implementations.
pkg_setup() {
	return
}

src_unpack() {
  return
}

doins_if_exist() {
  local f
  for f in "$@"; do
    if [[ -r "${f}" ]]; then
      doins "${f}"
    fi
  done
}

IMAGES="${FILESDIR}/*"

src_install() {
	# This is the subpath underneath the location that dlc mounts the image,
	# so we dont need additional directories.
	local install_dir="/"
	into "$(dlc_add_path ${install_dir})"
	insinto "$(dlc_add_path ${install_dir})"
	exeinto "$(dlc_add_path ${install_dir})"
	doins_if_exist ${IMAGES}
	dlc_src_install
}
