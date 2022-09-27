# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit appid cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="brya-manatee adlrvp"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-brya
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	chromeos-base/touch_updater
	media-sound/sound_card_init
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	if use brya-manatee; then
		doappid "{8C4F1DCA-AC34-11EB-8FD3-7B09B37DFAB3}" "REFERENCE"
	elif use adlrvp; then
		doappid "{CA89482B-8F28-4ED4-B4E0-14C3FB7FCDF3}" "REFERENCE"
	else
		doappid "{DEB6CEFD-4EEE-462F-AC21-52DF1E17B52F}" "REFERENCE"
	fi

	# Install audio config files
	unibuild_install_files audio-files
}
