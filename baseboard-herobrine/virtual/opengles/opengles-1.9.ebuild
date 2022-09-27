# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Virtual for OpenGLES implementations"

LICENSE="metapackage"

SLOT="0"
KEYWORDS="-* arm64 arm"

DEPEND="media-libs/mesa-freedreno"
RDEPEND="${DEPEND}"
