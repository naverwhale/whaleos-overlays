# Copyright 2022 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Chromeos SCP firmware payload for Geralt."

RESTRICT="strip"
LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm arm64"

SRC_URI="gs://chromeos-localmirror/distfiles/${P}.tbz2"

S="${WORKDIR}"
src_install() {
	insinto /lib/firmware/mediatek/mt8188/
	doins scp.img
	doins scp-dual.img
}
