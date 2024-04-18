# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Topology binary files used to support/configure LPE Audio"
LICENSE="LICENCE.adsp_sst"
SLOT="0"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-soraka-${PV}.tbz2"
KEYWORDS="-* x86 amd64"

RDEPEND="
	media-libs/kbl-tuning-support
	media-libs/kbl-dsm-param
	media-libs/kbl-hotword-support
"

S="${WORKDIR}/${P}"


src_install() {
	insinto /
	doins -r ./*
}
