# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="cheets"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-glados
	!<media-sound/adhd-0.0.6
"
DEPEND="${RDEPEND}"

src_install() {
	if use cheets; then
		doappid "{422EC195-4A60-5A56-668A-50E8E6A1D2D5}" "REFERENCE"
	else
		doappid "{1553F3C0-F06D-CB2C-4755-9936D7B651C0}" "REFERENCE"
	fi

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	# Install audio-config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs glados "${audio_config_dir}"
}
