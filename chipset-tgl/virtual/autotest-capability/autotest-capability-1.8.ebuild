# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Chrome OS autotest capability virtual package"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	!chromeos-base/autotest-capability-volteer
	chromeos-base/autotest-capability-chipset-tgl
"
