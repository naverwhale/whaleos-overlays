# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE="cheets kernel-4_4"
S="${WORKDIR}"

RDEPEND="
	x11-drivers/mali-rules
	media-libs/vpd-hdcpkey-install
	!media-libs/media-rules
	!<chromeos-base/chromeos-bsp-kevin-0.0.3
"
DEPEND="${RDEPEND}"

src_install() {
	# Override default CPU clock speed governor.
	insinto "/etc"
	if use kernel-4_4; then
		doins "${FILESDIR}/4.4/cpufreq.conf"
	else
		doins "${FILESDIR}/5.10/cpufreq.conf"
	fi

	# Install cpuset adjustments.
	if use cheets; then
		insinto "/opt/google/containers/android/vendor/etc/init/"
		doins "${FILESDIR}/init.cpusets.rc"
	fi

	# Install platform specific triggers and udev rules for codecs.
	insinto "/etc/init"
	doins "${FILESDIR}/udev-trigger-codec.conf"
	udev_dorules "${FILESDIR}/50-media.rules"
}
