# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit appid cros-unibuild cros-workon

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* ~arm64 ~arm"
IUSE="trogdor64 trogdor-arc-r trogdor-kernelnext zephyr_ec"


RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-trogdor
"
DEPEND="${RDEPEND}"

src_install() {
	if use zephyr_ec; then
		doappid "{486D6593-708E-4878-8CC9-A7E9AF2F5811}" "CHROMEBOOK"
	elif use trogdor64; then
		doappid "{A0568F5E-BA81-4BB8-9BDE-81DFF8E050AE}" "CHROMEBOOK"
	elif use trogdor-arc-r; then
		doappid "{E2560CEE-5423-4B7D-A6A0-764BBC237C05}" "CHROMEBOOK"
	elif use trogdor-kernelnext; then
		doappid "{9F765BCD-AC24-C22B-B39A-467B190B7FEF}" "CHROMEBOOK"
	else
		doappid "{9023C063-08D6-4A4F-908C-BCF97DE8BA69}" "CHROMEBOOK"
	fi

	# Install audio config
	unibuild_install_files audio-files
}
