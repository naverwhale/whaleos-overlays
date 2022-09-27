# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-unibuild cros-workon udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* ~amd64 ~x86"
IUSE="iioservice puff-borealis"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/sof-binary:=
	chromeos-base/sof-topology:=
	chromeos-base/touch_updater:=
	!iioservice? ( chromeos-base/chromeos-accelerometer-init )
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	if use puff-borealis; then
		doappid "{95056F9C-22C7-11EB-91D7-FFB4065ABAAB}" "CHROMEBOX"
	else
		doappid "{2514829E-8550-4E24-91F2-331AB7A12B03}" "CHROMEBOX"
	fi

	# Monitor udev event for USB ports to control power of re-driver.
	dosbin "${FILESDIR}"/control_usb_runtime_suspend.sh
	udev_dorules "${FILESDIR}/99-chromeos-puff-usb-runtime-suspend.rules"

	unibuild_install_files audio-files
}
