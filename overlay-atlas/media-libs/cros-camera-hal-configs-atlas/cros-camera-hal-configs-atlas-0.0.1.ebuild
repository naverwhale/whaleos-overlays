# Copyright 2018 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

KEYWORDS="-* amd64"

DESCRIPTION="Chrome OS camera HAL config files for Atlas"

LICENSE="Apache-2.0 BSD-Intel+patent-grant"
SLOT="0"

RDEPEND="!media-libs/arc-camera3-hal-configs-atlas"

S="${WORKDIR}"

src_install() {
	insinto /etc/camera
	doins "${FILESDIR}"/camera3_profiles.xml
	doins "${FILESDIR}"/gcss/*.xml
	doins "${FILESDIR}"/setup-hooks.sh

	insinto /etc/camera/ipu3
	doins "${FILESDIR}"/tuning_files/*.aiqb
}
