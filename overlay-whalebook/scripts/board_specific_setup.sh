# Copyright 2021 The NAVER Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

SCRIPT_ROOT="$(dirname "$(readlink -f "$0")")"

# Referred to overlay-lakitu.
board_finalize_base_image() {
  info "Copying fw_upd"
  info ${SCRIPT_ROOT}
  info ${root_fs_dir}
  if [ -e "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/fw_upd/fw/*.cap ] ; then
    sudo cp -rf \
        "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/fw_upd \
        "${root_fs_dir}"/boot/syslinux
    ls ${root_fs_dir}
    sudo cp -rf \
        "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/fw_upd/fw_upd_setup \
        "${root_fs_dir}"/usr/sbin/
    info "Successfully copied fw_upd"
  else
    info "There are no fw_upd, skip copying"
  fi

  info "Updating vmlinuz.minios"
  info ${SCRIPT_ROOT}
  info ${root_fs_dir}
  if [[ "${UPDATE_VMLINUZ:-0}" == "1" ]]; then
    sudo cp \
      "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/vmlinuz.minios.signed \
        "${root_fs_dir}"/boot/syslinux/vmlinuz.minios
    info "Successfully updated signed vmlinuz.minios"
  elif [ -f "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/vmlinuz.minios ] ; then
    sudo cp \
        "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/vmlinuz.minios \
        "${root_fs_dir}"/boot/syslinux/vmlinuz.minios
    info "Successfully updated vmlinuz.minios"
  else
    info "There are no vmlinuz.minios, skip copying"
  fi

  info "Updating vmlinuz"
  if [[ "${UPDATE_VMLINUZ:-0}" == "1" ]]; then
    sudo cp \
      "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/vmlinuz.bin \
      "${root_fs_dir}"/boot/vmlinuz
    info "Successfully updated vmlinuz"
  fi

  info "Updating bootx64.efi"
  sudo cp \
    "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/bootx64.efi \
    "${root_fs_dir}"/boot/efi/boot/bootx64.efi
  info "Successfully updated bootx64.efi"

  info "Updating grubx64.efi"
  sudo cp \
    "${SCRIPT_ROOT}"/../overlays/overlay-whalebook/files/grubx64.efi \
    "${root_fs_dir}"/boot/efi/boot/grubx64.efi
  info "Successfully updated grubx64.efi"
}
