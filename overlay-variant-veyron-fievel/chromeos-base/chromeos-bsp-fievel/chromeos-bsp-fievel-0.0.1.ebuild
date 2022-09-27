# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid udev cros-audio-configs

DESCRIPTION="Fievel bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm"

RDEPEND="!<media-sound/adhd-0.0.6"
DEPEND=""

S=${WORKDIR}

src_install() {
	doappid "{8DE953B3-4BBC-455D-9626-62A55CC9727C}" "CHROMEBOX" # veyron-fievel

	# Install audio configs.
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs veyron_fievel "${audio_config_dir}"
}
