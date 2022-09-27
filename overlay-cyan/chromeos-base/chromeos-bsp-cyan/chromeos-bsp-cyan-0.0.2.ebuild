# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="cyan-cheets cyan-kernelnext"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-strago
	!<media-sound/adhd-0.0.5
"
DEPEND="${RDEPEND}"

src_install() {
	if use cyan-cheets; then
		doappid "{EB589AF1-65F1-8B8B-8BBB-80450CA30620}" "CHROMEBOOK"
	elif use cyan-kernelnext; then
		doappid "{687C05C2-CF93-11E9-B871-CF217F7B16BF}" "CHROMEBOOK"
	else
		doappid "{11130F0B-738A-C024-7A78-CF72D93B77AF}" "CHROMEBOOK"
	fi

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	# Install audio configs.
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs cyan "${audio_config_dir}"
}
