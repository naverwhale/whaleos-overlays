# Copyright 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Virtual for OpenGLES implementations"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="-* arm"
IUSE=""

DEPEND="
	media-libs/mali-drivers-bin
	x11-drivers/opengles-headers
"
RDEPEND="${DEPEND}"
