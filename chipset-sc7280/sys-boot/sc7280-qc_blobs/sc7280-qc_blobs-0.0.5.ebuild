# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Ebuild to mirror Qualcomm SC7280 firmware blobs hosted on coreboot.org"

# HOW TO UPDATE:
#
# 1. Bump ebuild version (not revision!), e.g. from 0.0.1 to 0.0.2.
# 2. Download new upstream tarball from
#    https://review.coreboot.org/plugins/gitiles/qc_blobs/+archive/HEAD.tar.gz
# 3. Recompress with xz and rename:
#    `gunzip HEAD.tar.gz`
#    `xz HEAD.tar`
#    `mv HEAD.tar.xz sc7280-qc_blobs-<new ebuild version>.tar.xz`
# 4. Upload file to
#    https://pantheon.corp.google.com/storage/browser/chromeos-localmirror/distfiles/
# 5. Click three dots next to file, choose Edit Permissions, Add Entry, make the
#    new entry Public, allUsers, Reader.
# 6. Run `ebuild-herobrine <path to this file> manifest`.
# 7. Commit ebuild changes and upload to Gerrit.
SRC_URI="http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/${P}.tar.xz"

LICENSE="Qualcomm-FW-Blob"

S="${WORKDIR}/sc7280"
SLOT="0"
KEYWORDS="*"
IUSE="internal"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	# Internal builds install QcLib and qtiseclib via the private chipset
	# overlay's sys-boot/qclib and sys-boot/qtiseclib, respectively.

	# NOTE: We don't have source code for qclib yet, so using the
	#       blobs from chromeos-localmirror for now.  Will
	#       uncomment when figure out source code (b/190120222).
	if use internal; then
	#	rm "${S}/boot/QcLib.elf"
		rm "${S}/qtiseclib/libqtisec.a"
	fi

	insinto /firmware/coreboot-private/3rdparty/qc_blobs
	doins -r "${S}"
}
