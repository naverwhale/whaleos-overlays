# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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
	chromeos-base/chromeos-bsp-baseboard-strago
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{F9EDD237-F274-4467-A4DE-04061F6D319A}" "CHROMEBOOK"

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	# Install audio configs.
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs ultima "${audio_config_dir}"
}
