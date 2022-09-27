# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="Manage COS extensions"

inherit systemd

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
"

S="${WORKDIR}"

src_install() {
	newbin "${FILESDIR}"/cos-extensions.sh cos-extensions
}
