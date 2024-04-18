# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Libcamera mtkcam shared libraries for mtkisp7"
SRC_URI="gs://chromeos-localmirror/distfiles/${P}.tar.bz2"

LICENSE="LICENCE.mediatek"
SLOT="0"
KEYWORDS="-* arm64"

S="${WORKDIR}"

src_install() {
	dolib.so lib64/*.so
	dolib.a lib64/*.a
}
