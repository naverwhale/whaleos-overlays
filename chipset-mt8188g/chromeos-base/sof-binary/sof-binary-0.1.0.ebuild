# Copyright 2023 The ChromiumOS Authors.
# Distributed under the terms of the GNU General Public License v2.

EAPI=7

DESCRIPTION="MT8188 SOF firmware binary"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-mt8188-${PV}.tar.gz"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${PN}-mt8188-${PV}

src_install() {
	insinto /lib/firmware/mediatek/sof
	doins sof-mt8188.ri
}
