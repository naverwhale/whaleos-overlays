# Copyright 2023 The Chromium OS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit dlc cros-binary

DESCRIPTION="DLC containing the modem firmware for rex."
HOMEPAGE="http://src.chromium.org"
MIRROR_PATH="gs://chromeos-localmirror/distfiles"
SRC_URI="
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-19500.0000.00.01.02.80.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-A90.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-DEV_OTA_6000.0001.0002.0000_00.01.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-download_agent_rex_fm101-19500.0000.00.01.02.80-A90.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-OEM_OTA_6000.0000.004.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-OP_OTA_000.075.tar.xz"


SLOT="0"
KEYWORDS="*"
LICENSE="GPL-2 LGPL-2.1 BSD-Fibocom Apache-2.0 openssl"

S="${WORKDIR}"

# For modem FWs, this value should never change, since there
# is no guarantee that the user will have enough space left to accommodate the
# increase in size.
# Each block is 4KB. We reserve enough space to fit:
# 2 Main FWs = ~110MB * 2
# Total = ~220 MB => 300MB to be safe
# 300MB/4KB = 75000
# Reserved space
DLC_PREALLOC_BLOCKS="75000"

# Installs the DLC during FSI.
DLC_FACTORY_INSTALL=true

#Preload on test images
DLC_PRELOAD=true

# Always update with the OS
DLC_CRITICAL_UPDATE=true

src_install() {
	insinto "$(dlc_add_path /fm101)"
	for f in cellular-firmware-fibocom-fm101-*; do
		doins -r "${f}"/*
	done
	dlc_src_install
}
