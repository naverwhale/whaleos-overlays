# Copyright 2016 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-audio-configs udev cros-workon


DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* ~arm64 ~arm"
IUSE="hana-arc64 hana-kernelnext kernel-5_15"

# Add dependencies on other ebuilds from within this board overlay
DEPEND=""
RDEPEND="${DEPEND}
	chromeos-base/chromeos-bsp-baseboard-oak:=
	sys-apps/ethtool
"

src_install() {
	if use hana-arc64; then
		doappid "{D9CAAC5F-ABC7-401B-96B5-54F449368ABE}" "CHROMEBOOK"
	elif use hana-kernelnext; then
		doappid "{3C72E98C-09C7-11EA-801F-3B16A88ADBE8}" "CHROMEBOOK"
	else
		doappid "{AAE972E1-A913-C860-B7AB-BF7F267F199B}" "CHROMEBOOK"
	fi

	# Install audio config files.
	local audio_config_dir="${FILESDIR}/audio-config"
	if use kernel-5_15; then
		audio_config_dir="${FILESDIR}/5_15-audio-config"
	fi
	install_audio_configs hana "${audio_config_dir}"

	# Install rules to enable WoWLAN on startup.
	udev_dorules "${FILESDIR}/99-mwifiex-wowlan.rules"

	# Install rules to detect when DRM HDMI driver is loaded
	udev_dorules "${FILESDIR}/99-mtk_drm_hdmi_load.rules"

	# Install script called by 99-mtk_drm_hdmi_load.rules
	dosbin "${FILESDIR}"/hdcp_pass_key.sh
}
