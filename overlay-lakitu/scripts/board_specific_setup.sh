# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# This will add console=ttyS0 kernel cmdline flag, thus rerouting
# dmesg output to ttyS0 (serial port).
FLAGS_enable_serial=ttyS0

# Don't install upstart files.
INSTALL_MASK+=" /etc/init"

# Don't install symbol table for kdump kernel.
INSTALL_MASK+=" /boot/kdump/System.map-*"

# build_image script calls board_setup on the pristine base image.
board_make_image_bootable() {
  local -r image="$1"
  local -r script_root="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")"
  . "${script_root}/bootloader_install.sh" || exit 1
  if ! bootloader_install "${image}"; then
    error "Could not install bootloaders on ${image}"
    return 1
  fi
}

write_toolchain_path() {
  local -r cros_overlay="/mnt/host/source/src/third_party/chromiumos-overlay"
  local -r sdk_ver_file="${cros_overlay}/chromeos/binhost/host/sdk_version.conf"
  local -r ctarget="$(portageq-"${BOARD}" envvar CHOST)"
  . "${sdk_ver_file}"
  local -r toolchain_path="${TC_PATH/\%\(target\)s/${ctarget}}"
  # Write toolchain path to image.
  echo "${toolchain_path}" | \
      sudo tee "${root_fs_dir}/etc/toolchain-path" > /dev/null
  # Write toolchain path to build dir so it can be exported as an artifact.
  echo "${toolchain_path}" | \
      sudo tee "${BUILD_DIR}/toolchain_path" > /dev/null
}

# Moves the given rootfs_file to the given artifact location. The directory
# containing the rootfs_file is deleted if it becomes empty after this move.
# If the rootfs_file doesn't exist, put an empty file at the given artifact
# location.
export_image_artifact() {
  local rootfs_file="$1"
  local artifact="$2"
  if [[ ! -f "${rootfs_file}" ]]; then
    touch "${artifact}"
    return
  fi
  cp "${rootfs_file}" "${artifact}"
  sudo rm "${rootfs_file}"
  if [[ -z "$(ls -A "$(dirname "${rootfs_file}")")" ]]; then
    sudo rmdir "$(dirname "${rootfs_file}")"
  fi
}

write_toolchain_env() {
  # Create toolchain_env file in BUILD_DIR so that it can be exported
  # as an artifact.
  local artifact="${BUILD_DIR}/toolchain_env"

  # File from which kernel compiler information will be copied
  # This file is deleted after copying content to artifact
  local toolchain_env_file="${root_fs_dir}/etc/toolchain_env"

  # Copy kernel compiler info to BUILD artifact
  if [[ -f "${toolchain_env_file}" ]]; then
    cp "${toolchain_env_file}" "${artifact}"
    # Remove toolchain_env from image
    sudo rm "${toolchain_env_file}"
  else
    touch "${artifact}"
  fi
}

write_kernel_info() {
  # Create kernel_info file in BUILD_DIR so that it can be exported
  # as an artifact.
  local build_artifact="${BUILD_DIR}/kernel_info"

  # File from which kernel information will be copied.
  # This file is deleted after copying content to artifact.
  local kernel_info_file="${root_fs_dir}/etc/kernel_info"

  # Copy kernel_info to BUILD artifact.
  if [[ -f "${kernel_info_file}" ]]; then
    cp "${kernel_info_file}" "${build_artifact}"
    # Remove kernel_info file from image.
    sudo rm "${kernel_info_file}"
  else
    touch "${build_artifact}"
  fi
}

write_kernel_commit() {
  # Create kernel_commit file in BUILD_DIR so that it can be exported
  # as an artifact.
  local build_artifact="${BUILD_DIR}/kernel_commit"

  # File from which kernel commit will be copied.
  # This file is deleted after copying content to artifact.
  local kernel_commit_file="${root_fs_dir}/etc/kernel_commit"

  # Copy kernel_commit to BUILD artifact.
  if [[ -f "${kernel_commit_file}" ]]; then
    cp "${kernel_commit_file}" "${build_artifact}"
    # Remove kernel_commit file from image.
    sudo rm "${kernel_commit_file}"
  else
    touch "${build_artifact}"
  fi
}

# Export default GPU driver version file as an artifact.
export_gpu_default_version() {
  local -r script_root="$1"
  local -r default_driver_file="${script_root}/gpu_default_version"
  local -r default_driver_artifact="${BUILD_DIR}/gpu_default_version"

  # Copy scripts/gpu_default_version to BUILD artifact
  cp "${default_driver_file}" "${default_driver_artifact}"
}

# board_finalize_base_image() gets invoked by the build scripts at the
# end of building base image.
board_finalize_base_image() {
  local -r script_root="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")"
  write_toolchain_path
  export_image_artifact \
    "${root_fs_dir}/opt/google/src/kernel-src.tar.gz" \
    "${BUILD_DIR}/kernel-src.tar.gz"
  export_image_artifact \
    "${root_fs_dir}/opt/google/src/kernel-headers.tgz" \
    "${BUILD_DIR}/kernel-headers.tgz"
  write_toolchain_env
  write_kernel_info
  write_kernel_commit
  cp "${BOARD_ROOT}/usr/lib/debug/boot/vmlinux" "${BUILD_DIR}/vmlinux"
  export_gpu_default_version "${script_root}"

  # /etc/machine-id gets installed by sys-apps/dbus and is a symlink.
  # This conflicts with systemd's machine-id generation mechanism,
  # so we remove the symlink and recreate it as an empty file.
  sudo rm "${root_fs_dir}"/etc/machine-id
  sudo touch "${root_fs_dir}"/etc/machine-id

  info "Copying shim to bootx64.efi"
  sudo cp \
    "${root_fs_dir}"/boot/efi/boot/shimx64.efi \
    "${root_fs_dir}"/boot/efi/boot/bootx64.efi
  info "Successfully copied shim to bootx64.efi"

  info "Deleting legacy EFI bootloaders"
  # Don't delete bootx64.efi here, since the shim is now there
  sudo rm -f "${root_fs_dir}"/boot/efi/boot/bootia32.efi
  info "Successfully deleted legacy EFI bootloaders"

  info "Populating dbx"
  sudo mkdir -p "${esp_fs_dir}"/efi/Google/GSetup/dbx
  sudo cp "${script_root}"/dbx/* "${esp_fs_dir}"/efi/Google/GSetup/dbx
  sudo chmod -R 755 "${esp_fs_dir}"/efi/Google/GSetup/dbx
  info "Successfully populated dbx"
}
