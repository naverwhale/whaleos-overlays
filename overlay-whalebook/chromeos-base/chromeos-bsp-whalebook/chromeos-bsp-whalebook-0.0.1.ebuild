# Copyright 2021 NAVER Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=5

inherit appid

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
DEPEND="${RDEPEND}"

src_install() {
	doappid "{D6090F06-70BA-4D31-9350-3B1DBCD140EC}" "CHROMEBOOK"
}
