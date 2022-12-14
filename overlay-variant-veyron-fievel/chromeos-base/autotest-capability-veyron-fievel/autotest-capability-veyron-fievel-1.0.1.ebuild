# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Install autotest capabilities for veyron-fievel"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}"

RDEPEND="chromeos-base/autotest-capability-veyron"
DEPEND="${RDEPEND}"

src_install() {
	insinto /etc/autotest-capability/
	doins "${FILESDIR}"/*
}
