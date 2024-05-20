# Copyright 2019-2020 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

inherit appid cros-unibuild cros-workon udev

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

DESCRIPTION="dedede board-specific ebuild that pulls in necessary ebuilds as
dependencies or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* ~amd64 ~x86"
IUSE="dedede-pvs dedede-kernelnext"

RDEPEND="
	!<chromeos-base/gestures-conf-0.0.2
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	chromeos-base/touch_updater
"
DEPEND="${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	insinto "/etc/gesture"
	doins "${FILESDIR}"/gesture/*

	if use dedede-pvs; then
		doappid "{586A71A9-4C1D-4D12-9484-2DF0451A8867}" "CHROMEBOOK"
	elif use dedede-kernelnext; then
		doappid "{C5BCE4DA-9E2D-4BEB-9F36-DA70CFD0CEEA}" "CHROMEBOOK"
	else
		doappid "{E0DD1258-E890-493E-ADA3-0C755240B89C}" "CHROMEBOOK"
	fi
	# Install audio config files
	unibuild_install_files audio-files

	# Install the WP script for older revs that can't take a RO FW update.
	insinto /etc/init
	doins "${FILESDIR}/common/dedede-force-wp.conf"

	udev_dorules "${FILESDIR}"/boten/udev/*.rules
	udev_dorules "${FILESDIR}"/storo/udev/*.rules
	udev_dorules "${FILESDIR}"/bugzzy/udev/*.rules
}
