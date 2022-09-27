# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid udev cros-audio-configs

DESCRIPTION="Speedy bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm"
IUSE="bluetooth"

DEPEND="!<chromeos-base/chromeos-bsp-speedy-private-0.0.2"
RDEPEND="
	${DEPEND}
	!<media-sound/adhd-0.0.6
"

S=${WORKDIR}

src_install() {
	doappid "{81C04B02-A863-BFBB-F77C-7707347DC958}" "CHROMEBOOK" # veyron-speedy

	# Install audio-config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs veyron_speedy "${audio_config_dir}"
}
