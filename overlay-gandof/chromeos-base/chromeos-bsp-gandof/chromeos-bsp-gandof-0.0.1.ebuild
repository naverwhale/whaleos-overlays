# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-auron
	!<media-sound/adhd-0.0.3
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{17E83440-0027-4D60-A6D3-D7F2BA99720B}" "CHROMEBOOK"

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	#Install audio config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs gandof "${audio_config_dir}"
}
