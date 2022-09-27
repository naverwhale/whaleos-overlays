# Copyright 2019-2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="3a01873e59ec25ecb10d1b07ff9816e69f3bbfee"
CROS_WORKON_TREE="8ce164efd78fcb4a68e898d8c92c7579657a49b1"
inherit appid cros-unibuild cros-workon udev

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

DESCRIPTION="dedede board-specific ebuild that pulls in necessary ebuilds as
dependencies or portage actions."

LICENSE="BSD-Google"
KEYWORDS="-* amd64 x86"
IUSE=""

RDEPEND="
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	chromeos-base/touch_updater
"
DEPEND="${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	doappid "{E0DD1258-E890-493E-ADA3-0C755240B89C}" "CHROMEBOOK"

	# Install audio config files
	unibuild_install_files audio-files

	# Install the WP script for older revs that can't take a RO FW update.
	insinto /etc/init
	doins "${FILESDIR}/common/dedede-force-wp.conf"

	udev_dorules "${FILESDIR}"/boten/udev/*.rules
	udev_dorules "${FILESDIR}"/storo/udev/*.rules
}
