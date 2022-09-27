# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Install autotest capabilities for strongbad"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}"

RDEPEND="chromeos-base/autotest-capability-chipset-qc7180"
DEPEND="${RDEPEND}"

src_install() {
	insinto /etc/autotest-capability/
	doins "${FILESDIR}"/*
}
