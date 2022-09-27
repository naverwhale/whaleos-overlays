# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Install configuration data for Atmel chips"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

TOUCH_CONFIG_PATH="/opt/google/touch/config"
TP_CONFIG_FILE="337t.raw"
TP_CONFIG_LINK="/lib/firmware/maxtouch-tp.cfg"

S=${WORKDIR}

DEPEND=""

RDEPEND="${DEPEND}
	 chromeos-base/touch_updater"

src_install() {
	insinto "${TOUCH_CONFIG_PATH}"
	doins "${FILESDIR}/${TP_CONFIG_FILE}"
	dosym "${TOUCH_CONFIG_PATH}/${TP_CONFIG_FILE}" "${TP_CONFIG_LINK}"
}
