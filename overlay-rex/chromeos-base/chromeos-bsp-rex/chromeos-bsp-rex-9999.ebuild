# Copyright 2021 The Chromium OS Authors. All rights reserved.
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
KEYWORDS="-* ~amd64 ~x86"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
"
DEPEND="
	${RDEPEND}
"

src_install() {
	doappid "{2B8D1068-48CF-4256-A2D5-335849F11718}" "REFERENCE"

	# Install audio config files
	unibuild_install_files audio-files
}
