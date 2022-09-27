# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="2aaab46769644ed992a24d7390798608254e1e8a"
CROS_WORKON_TREE=("54a2dc47dbc7e96f10885a85e63e6fda034bf83e" "7b538bd42b5e7b34f3508ae9353deeb6404f7c2e" "bdd741cb2c13971a45930e82dcfc4e826aa4d7d9" "78ca24fee91d29460aa8b059560fb1ae7cd0709d" "bb6c9132e6c364968de0230f11402dfc8a918278" "9df8d913fbbe5856cd830a8bb11a72825fc29d93" "0ec4eb5733f0f3eb96255525e32ee6bf7aada35c")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"dooly"
    "duffy"
    "faffy"
    "kaisa"
    "noibat"
    "puff"
    "wyvern"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "puff/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( puff )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for puff"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-puff"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
