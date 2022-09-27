# Copyright 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid cros-audio-configs

DESCRIPTION="Jerry bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm"

DEPEND="!<chromeos-base/chromeos-bsp-jerry-private-0.0.1"
RDEPEND="!<media-sound/adhd-0.0.6"

S=${WORKDIR}

src_install() {
	doappid "{87C6D674-9385-6143-BE67-8B5E3064E89D}" "CHROMEBOOK" # veyron-jerry

	# Install audio-config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs veyron_jerry "${audio_config_dir}"
}
