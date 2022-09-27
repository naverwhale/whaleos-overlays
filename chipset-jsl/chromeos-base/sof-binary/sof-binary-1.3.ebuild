# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

DESCRIPTION="Jasper Lake SOF firmware binary"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-jsl-${PV}.tar.xz"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"

S=${WORKDIR}/${PN}-jsl-${PV}

src_install() {
	insinto /lib/firmware/intel/sof/community
	doins sof-jsl.ri
	doins sof-jsl.ldc
	dodoc README
}
