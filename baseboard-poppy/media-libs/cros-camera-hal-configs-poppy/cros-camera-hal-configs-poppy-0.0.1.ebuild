# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KEYWORDS="-* amd64"

DESCRIPTION="Chrome OS camera HAL config files for Poppy and friends"

LICENSE="Apache-2.0 BSD-Intel+patent-grant"
SLOT="0"

RDEPEND="!media-libs/arc-camera3-hal-configs-poppy"

S="${WORKDIR}"

src_install() {
	insinto /etc/camera
	doins "${FILESDIR}"/camera3_profiles.xml
	doins "${FILESDIR}"/gcss/*.xml
	doins "${FILESDIR}"/setup-hooks.sh

	insinto /etc/camera/ipu3
	doins "${FILESDIR}"/tuning_files/*.aiqb
}

