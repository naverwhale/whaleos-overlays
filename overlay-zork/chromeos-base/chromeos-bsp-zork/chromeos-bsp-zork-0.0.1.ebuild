# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit appid
inherit cros-unibuild
inherit udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="zork-arc-r zork-borealis zork-kernelnext zork-minios"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/rmi4utils
	chromeos-base/touch_updater
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	if use zork-arc-r; then
		doappid "{63ADFE60-D637-416A-A595-E5BA72D185FF}" "CHROMEBOOK"
	elif use zork-borealis; then
		doappid "{06A95C4E-E191-11EA-A4BD-770DFD0DD974}" "CHROMEBOOK"
	elif use zork-kernelnext; then
		doappid "{D694EA84-A2C3-11EA-98E4-DFA8D65B1A07}" "CHROMEBOOK"
	elif use zork-minios; then
		doappid "{0456DB64-6AE0-4806-8D2E-96D57FE411F3}" "CHROMEBOOK"
	else
		doappid "{0BE68F68-A2F2-46B7-A7B4-B51B63F64FBA}" "CHROMEBOOK"
	fi

	unibuild_install_files audio-files

	# Install LTE modem quirks
	exeinto /usr/sbin
	doexe "${FILESDIR}/modem_startup"
	doexe "${FILESDIR}/modem_shutdown"

	# Install USB quirks
	udev_dorules "${FILESDIR}/20-usb-quirks.rules"
	udev_dorules "${FILESDIR}/90-xhci-quirks.rules"

	# Install Proximity sensor rules
	udev_dorules "${FILESDIR}"/vilboz/udev/*.rules

	exeinto "$(get_udevdir)"
	doexe "${FILESDIR}/xhci-restart.sh"
}
