# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit arc-build-constants

DESCRIPTION="Install codec configuration on ARCVM"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}"

RDEPEND="!chromeos-base/arcvm-codec-software"

src_install() {
	arc-build-constants-configure
	insinto "${ARC_VM_VENDOR_DIR}/etc/"
	doins "${FILESDIR}"/*
}
