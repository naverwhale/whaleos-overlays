# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid udev cros-audio-configs

DESCRIPTION="Mighty bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm"

DEPEND="!<chromeos-base/chromeos-bsp-mighty-private-0.0.2"
RDEPEND="${DEPEND}
	!<media-sound/adhd-0.0.6"

S=${WORKDIR}

src_install() {
	doappid "{53EF63C4-236D-75A0-D9AE-A6BBB686AC98}" "CHROMEBOOK" # veyron-mighty

	# Install audio-config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs veyron_mighty "${audio_config_dir}"
}
