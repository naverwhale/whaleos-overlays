# Copyright 2018 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Install autotest capabilities for baseboard-whalebook"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}"

RDEPEND="chromeos-base/autotest-capability-default"
DEPEND="${RDEPEND}"

src_install() {
	insinto /etc/autotest-capability/
	doins "${FILESDIR}"/*
}
