# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon

DESCRIPTION="Install upstart file to load ISH drivers"
LICENSE="BSD-Google"
KEYWORDS="~*"

src_install() {
	insinto /etc/init
	doins "${FILESDIR}"/init/cros-ec-driver.conf
}
