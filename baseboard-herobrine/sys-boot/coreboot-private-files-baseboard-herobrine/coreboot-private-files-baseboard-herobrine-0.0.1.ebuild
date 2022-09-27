# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Coreboot private files for Herobrine baseboard (public)"
SLOT="0"
KEYWORDS="*"
LICENSE="BSD-Google"

DEPEND="
	sys-boot/coreboot-private-files-chipset-sc7280
	sys-firmware/parade-ps8805a2-firmware
	sys-firmware/parade-ps8805a3-firmware
	"
RDEPEND="${DEPEND}"
