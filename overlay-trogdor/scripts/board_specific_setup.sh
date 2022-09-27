# Copyright 2022 The NAVER Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

SCRIPT_ROOT="$(dirname "$(readlink -f "$0")")"

# Referred to overlay-lakitu.
board_finalize_base_image() {
  info "Copying Qualcomm 7c device FW"
  sudo cp -R \
    "${SCRIPT_ROOT}"/../overlays/overlay-trogdor/files/qcom \
    "${root_fs_dir}"/lib/firmware/.

  sudo cp -R \
    "${SCRIPT_ROOT}"/../overlays/overlay-trogdor/files/ath10k \
    "${root_fs_dir}"/lib/firmware/.
  info "Successfully copied Qualcomm 7c device FW"
}
