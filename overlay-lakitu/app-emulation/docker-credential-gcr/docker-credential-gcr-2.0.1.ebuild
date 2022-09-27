# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=7

MY_PN="github.com/GoogleCloudPlatform/${PN}"

EGIT_REPO_URI="https://chromium.googlesource.com/external/${MY_PN}.git"
EGIT_COMMIT="v${PV}"
EGIT_SOURCEDIR="${S}/src/${MY_PN}"

CROS_GO_BINARIES="${MY_PN}"

DESCRIPTION="Google Container Registry's Docker credential helper"
HOMEPAGE="https://github.com/GoogleCloudPlatform/docker-credential-gcr"

inherit cros-go eutils git-2

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE=""

# Note that docker-credential-gcr depends on the head of dev-go/go-subcommands.
# Please update dev-go/go-subcommands when upgrading docker-credential-gcr.
DEPEND="app-emulation/docker
	~app-emulation/docker-credential-helpers-0.6.3
	>=dev-lang/go-1.13:=
	>=dev-go/errors-0.8.1
	dev-go/subcommands
	dev-go/net
	dev-go/oauth2
"
RDEPEND="${DEPEND}"
