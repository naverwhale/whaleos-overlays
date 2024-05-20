# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="kbl default RDC Param"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-atlas-${PV}.tbz2"

LICENSE="LICENSE.dsm"
SLOT="0"
KEYWORDS="-* x86 amd64"

S=${WORKDIR}

src_install() {
	insinto /
	doins -r ./*
}
