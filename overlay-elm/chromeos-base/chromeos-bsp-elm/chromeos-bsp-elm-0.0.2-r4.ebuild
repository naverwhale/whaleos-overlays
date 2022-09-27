# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="3a01873e59ec25ecb10d1b07ff9816e69f3bbfee"
CROS_WORKON_TREE="8ce164efd78fcb4a68e898d8c92c7579657a49b1"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-audio-configs udev cros-workon


DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* arm64 arm"
IUSE="elm-arc64 elm-cheets elm-kernelnext"

# Add dependencies on other ebuilds from within this board overlay
DEPEND=""
RDEPEND="${DEPEND}
	chromeos-base/chromeos-bsp-baseboard-oak:=
	sys-apps/ethtool
"

src_install() {
	if use elm-arc64; then
		doappid "{AB7C8669-9930-4EE3-BC66-46C7F27CC8FA}" "CHROMEBOOK"
	elif use elm-cheets; then
		doappid "{3DFF3394-F97E-4971-83C6-2C5C06A9953D}" "CHROMEBOOK"
	elif use elm-kernelnext; then
		doappid "{5C030156-1D45-11EA-871D-230545999E89}" "CHROMEBOOK"
	else
		doappid "{5BF597B2-ADE3-52C9-1DDA-95719C914AFF}" "CHROMEBOOK"
	fi

	# Install audio config files.
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs elm "${audio_config_dir}"

	# Install rules to enable WoWLAN on startup.
	udev_dorules "${FILESDIR}/99-mwifiex-wowlan.rules"

	# Install rules to detect when DRM HDMI driver is loaded
	udev_dorules "${FILESDIR}/99-mtk_drm_hdmi_load.rules"

	# Install script called by 99-mtk_drm_hdmi_load.rules
	dosbin "${FILESDIR}"/hdcp_pass_key.sh
}
