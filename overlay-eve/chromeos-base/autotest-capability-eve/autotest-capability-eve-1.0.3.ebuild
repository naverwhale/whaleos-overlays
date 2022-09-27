# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Install autotest capabilities for eve"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}"

RDEPEND="chromeos-base/autotest-capability-chipset-kbl"
DEPEND="${RDEPEND}"

src_install() {
	insinto /etc/autotest-capability/
	doins "${FILESDIR}"/*
}
