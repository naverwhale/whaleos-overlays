# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cros-workon udev

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* ~arm64 ~arm"
IUSE="cheets"

RDEPEND="
	net-misc/rmtfs
	net-misc/qc-netmgr
"
DEPEND="${RDEPEND}"

src_install() {
	insinto "/etc"
	# Override default CPU clock speed governor.
	doins "${FILESDIR}/cpufreq.conf"
	# Use 'step_wise' governor for GPU thermal zones.
	doins "${FILESDIR}/thermal_zone.conf"

	# Install cpuset adjustments.
	if use cheets; then
		insinto "/opt/google/containers/android/vendor/etc/init/"
		doins "${FILESDIR}/init.cpusets.rc"
		# See b/161399876:
		doins "${FILESDIR}/arc-sf-config.rc"
	fi

	# udev rules for codecs
	insinto /etc/init
	doins "${FILESDIR}/udev-trigger-codec.conf"
	udev_dorules "${FILESDIR}/50-media.rules"

	# udev rules to enable USB wakeup
	udev_dorules "${FILESDIR}/99-usb-wakeup.rules"

	# udev rules for HP USB-C/A Universal Dock G2 Adicora-D
	udev_dorules "${FILESDIR}/99-hp-usb-c-dock.rules"

	# Install modem FSG verification init script
	insinto "/etc/init"
	doins "${FILESDIR}/verify_fsg.conf"
	exeinto /usr/share/cros/init
	doexe "${FILESDIR}/verify_fsg.sh"
}
