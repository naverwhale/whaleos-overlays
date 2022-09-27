#!/bin/bash
# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# use:
# enable-manatee-board.sh ${BOARD}


BOARD=$1
SELF=$(realpath "$0")
SOURCES=${SELF%/*/*/*}

if [[ -z "${BOARD}" ]]; then
  echo "Usage:"
  echo "  $0 board-name"
  exit 1
fi

if [[ -d "${SOURCES}/private-overlays/overlay-${BOARD}-private" ]]; then
  OVERLAY="${SOURCES}/private-overlays/overlay-${BOARD}-private"
elif [[ -d "${SOURCES}/overlays/overlay-${BOARD}" ]]; then
  OVERLAY="${SOURCES}/overlays/overlay-${BOARD}"
else
  echo "Can't find overlay directory for ${BOARD} in ${SOURCES}"
  exit 1
fi

LAYOUT="${OVERLAY}/metadata/layout.conf"
PARENT="${OVERLAY}/profiles/base/parent"
CHROMEOS_BSP=$(find "${OVERLAY}/virtual/chromeos-bsp" \
                    -type f -name 'chromeos-bsp-[0-9].ebuild')

if [[ ! -f "${LAYOUT}" ]]; then
  echo "missing file: ${LAYOUT}"
elif [[ ! -f "${PARENT}" ]]; then
  echo "missing file: ${PARENT}"
elif [[ ! -f "${CHROMEOS_BSP}" ]]; then
  echo "missing file: ${CHROMEOS_BSP}"
else
  echo "Changing ${OVERLAY}"
  echo "Run 'setup_board --board ${BOARD}' to reset board environment."
  # Ensure 'manatee' is added to the end of overlay masters.
  sed -i -e 's/^masters\(.*\)\( manatee\)\(.*\)$/masters\1\3/g' \
         -e 's/^masters\(.*\)$/masters\1 manatee/g' "${LAYOUT}"
  # Ensure manatee:base is added to the overlay parents.
  grep -q -e '^manatee:base$' "${PARENT}" || echo "manatee:base" >> "${PARENT}"
  # Add runtime dependency to chromeos-bps-manatee if not added already.
  grep -q -e "chromeos-base/chromeos-bsp-manatee" "${CHROMEOS_BSP}" || \
    echo "RDEPEND=\"\${RDEPEND} chromeos-base/chromeos-bsp-manatee\"" >> \
    "${CHROMEOS_BSP}"
fi

