# Copyright 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="lulu-cheets"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-auron
	!<media-sound/adhd-0.0.4
"
DEPEND="${RDEPEND}"

src_install() {
	if use lulu-cheets; then
		doappid "{55C5C498-838E-E1DE-7A14-21352C635C72}" "CHROMEBOOK"
	else
		doappid "{40C6BCAB-B8D4-466F-9C3C-069B8CAC36D7}" "CHROMEBOOK"
	fi

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	# Install audio config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs lulu "${audio_config_dir}"
}
