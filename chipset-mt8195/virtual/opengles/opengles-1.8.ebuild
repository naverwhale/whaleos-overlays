# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for OpenGLES implementations"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="-* arm arm64"
IUSE="video_cards_panfrost"

DEPEND="
	video_cards_panfrost? ( media-libs/mesa-panfrost )
	!video_cards_panfrost? (
		media-libs/mali-drivers-valhall-bin
		x11-drivers/opengles-headers
	)
"
RDEPEND="${DEPEND}"
