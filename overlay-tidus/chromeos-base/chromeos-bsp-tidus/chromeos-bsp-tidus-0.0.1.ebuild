# Copyright 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-jecht
	!<media-sound/adhd-0.0.6
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{4A52D805-8FA6-43A1-9F71-C1A59FD918E8}" "CHROMEBOX"

	# Install audio-config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs tidus "${audio_config_dir}"
}
