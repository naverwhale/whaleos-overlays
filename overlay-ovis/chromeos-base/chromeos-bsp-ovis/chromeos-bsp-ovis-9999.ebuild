# Copyright 2023 The ChromiumOS Authors
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
IUSE="vpu_driver nnapi vendor-nnhal nnapi_custom_ops"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/sof-binary:=
	vpu_driver? (
		chromeos-base/intel-vpu-umd:=
	)
	nnapi? (
		vendor-nnhal? (
			chromeos-base/intel-nnhal:=
		)
	)
	nnapi_custom_ops? (
		sci-libs/tensorflow:=
	)
"
DEPEND="
	${RDEPEND}
"

src_install() {
	doappid "{C87544AB-83EA-4A58-8AE2-9F349D290BEB}" "CHROMEBOX"

	# Install audio config files
	unibuild_install_files audio-files
}
