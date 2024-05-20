# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="d2d95e8af89939f893b1443135497c1f5572aebc"
CROS_WORKON_TREE="776139a53bc86333de8672a51ed7879e75909ac9"
inherit appid cros-unibuild cros-workon cros-audio-configs

inherit appid cros-unibuild cros-workon

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE="trogdor-kernelnext trogdor-userdebug zephyr_ec trogdor-connectivitynext"


RDEPEND="
	!<chromeos-base/gestures-conf-0.0.2
	chromeos-base/chromeos-bsp-baseboard-trogdor
"
DEPEND="${RDEPEND}"

src_install() {
	insinto "/etc/gesture"
	doins "${FILESDIR}"/gesture/*

	if use zephyr_ec; then
		doappid "{486D6593-708E-4878-8CC9-A7E9AF2F5811}" "CHROMEBOOK"
	elif use trogdor-userdebug; then
		doappid "{5FA67FD4-FEA5-971E-8DB9-D40672EF4F0D}" "CHROMEBOOK"
	elif use trogdor-connectivitynext; then
		doappid "{7DCFEAA2-E592-49FE-81C3-C27C828CE218}" "CHROMEBOOK"
	elif use trogdor-kernelnext; then
		doappid "{9F765BCD-AC24-C22B-B39A-467B190B7FEF}" "CHROMEBOOK"
	else
		doappid "{9023C063-08D6-4A4F-908C-BCF97DE8BA69}" "CHROMEBOOK"
	fi

	# Install audio config
	unibuild_install_files audio-files

	# Install semtech configuration files
	unibuild_install_files proximity-sensor-files
        # Install audio config files
        local audio_config_dir="${FILESDIR}/audio-config"
        install_audio_configs trogdor "${audio_config_dir}"
}
