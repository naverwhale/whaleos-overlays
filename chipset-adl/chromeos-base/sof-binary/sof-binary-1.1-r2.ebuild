# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=6

DESCRIPTION="Alder Lake SOF firmware binary"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-adl-${PV}.tar.bz2"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	media-libs/adl-max98390-dsm-param-brya
"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}-adl-${PV}

src_install() {
	insinto /lib/firmware/intel/sof/community
	doins sof-adl.ri
	doins sof-adl.ldc
	dodoc README
}
