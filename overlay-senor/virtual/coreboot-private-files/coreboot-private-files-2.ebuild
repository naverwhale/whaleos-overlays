# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="Coreboot private files virtual package"

LICENSE=metapackage

SLOT="0"
KEYWORDS="*"

# Pull in the baseboard as well as the board-specific coreboot private
# files.
# Portage requires both DEPEND and RDEPEND to correctly assess dependencies
# in the face of binary packages
DEPEND="sys-boot/coreboot-private-files-baseboard-herobrine"
RDEPEND="${DEPEND}"
