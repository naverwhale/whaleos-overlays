# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI="7"

DESCRIPTION="Virtual package for environment specific network initialization."

LICENSE="metapackage"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	chromeos-base/cloud-network-init
"
