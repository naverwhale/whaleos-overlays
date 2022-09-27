# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=5

DESCRIPTION="Comet Lake SOF firmware binary"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-cml-${PV}.tar.xz"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"
IUSE="hatch-kernelnext"

S=${WORKDIR}/${PN}-cml-${PV}

src_install() {
	if use hatch-kernelnext; then
		insinto /lib/firmware/intel/sof/community
	else
		insinto /lib/firmware/intel/sof
	fi

	doins sof-cnl.ri
	dodoc README
}
