# Copyright 2023 The Chromium OS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cros-cellular udev user

DESCRIPTION="Chrome OS Modem Update Helpers (rex)"
HOMEPAGE="http://src.chromium.org"
MIRROR_PATH="gs://chromeos-localmirror/distfiles"
SRC_URI="
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-81600.0000.00.29.19.16.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-FM350.C82.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-DEV_OTA_5001.0001.0000_Default_001.000.000.015.img.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-OP_OTA_000.037.img.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-OEM_OTA_6001.0000.001.img.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-19500.0000.00.01.02.80.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-A90.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-DEV_OTA_6000.0001.0002.0000_00.01.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-download_agent_rex_fm101-19500.0000.00.01.02.80-A90.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-OEM_OTA_6000.0000.004.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-OP_OTA_000.075.tar.xz
	"

RESTRICT="mirror"
LICENSE="GPL-2 LGPL-2.1 BSD-Fibocom Apache-2.0 openssl"
SLOT="0"
KEYWORDS="*"

S="${WORKDIR}"

RDEPEND="
	chromeos-base/modem-fw-dlc-rex-fm350
	chromeos-base/modem-fw-dlc-rex-fm101
	net-misc/qdl
"
src_install() {
	cellular_domanifest "${FILESDIR}/helper_manifest.textproto"

	insinto /etc/init/
	doins "${FILESDIR}/modemfwd-helpers.conf"

	udev_dorules "${FILESDIR}/94-usb-modem-gpio.rules"

	cellular_dofirmware "${FILESDIR}/firmware_manifest.textproto"
	insinto "$(_cellular_get_firmwaredir)/fm350"
	doins -r cellular-firmware-fibocom-fm350-*/*

	insinto "$(_cellular_get_firmwaredir)/fm101"
	doins -r cellular-firmware-fibocom-fm101-*/*

	# Create symbolic link to allow FM350 firmware to be accessible with
	# /lib/firmware as root directory. This is required for devlink to be able
	# to flash firmware to the modem.
	dosym "$(_cellular_get_firmwaredir)/fm350" "/lib/firmware/fm350"
}

pkg_preinst() {
	enewgroup gpio
}
