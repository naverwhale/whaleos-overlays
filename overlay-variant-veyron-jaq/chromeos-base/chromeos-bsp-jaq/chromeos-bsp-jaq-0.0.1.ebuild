# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid cros-audio-configs

DESCRIPTION="Jaq bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm"

DEPEND="!<chromeos-base/chromeos-bsp-jaq-private-0.0.1"
RDEPEND="!<media-sound/adhd-0.0.6"

S=${WORKDIR}

src_install() {
	doappid "{6D2E4D56-A22C-2F8F-7127-DA90A65F85E1}" "CHROMEBOOK" # veyron-jaq

	# Install audio-config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs veyron_jaq "${audio_config_dir}"
}
