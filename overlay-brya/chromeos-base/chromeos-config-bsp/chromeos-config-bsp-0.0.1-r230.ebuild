# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="dd0856776c40db867695d000e79a8d48d3b5d6d7"
CROS_WORKON_TREE=("90b4e8ffd71a1a4764628409dcb65a3a0a331f96" "172aec92e6380b265bc32fe751ea21ce2c263ebd" "ae8e9f42a85e8d39f9eda82b276bd94c95c85c47" "5959009db50730e792a89db90691ae0ebb53063d" "395bfcb7eee9777b9d2418a835b5be5a9571e338" "c41a11c8bbc59b0a2c7274fbb95a0d33d652cacb" "171d32aa3ada8a1ea2d34e0fc27a85dd7a91c4a0" "0ca3d5b206b01b406d305beb6edce9161bc311b6" "1d88b85c945ecf0b9488e5bd647ec4af5636c4a7" "8647a9990ea327aee754e0aa35328364cdef6a12" "9667ade0288315dbc0944aa670314b3981d7cc1e" "688d713f12061fd96bf9441855e4bce4b0c20316" "13e939f686ebfaea1198f43f8a7966885148f9a0" "fa3aaa33d608827736a0bbc4538eaf1b2bc44019" "742af4b8c09e5c111fcb4a7f33c89050ad9c8f36" "389206b83bd3ec975c9fd0ce9f088ace6d923d8d" "ca5c0257b3ad05b0b8c87ce4475a96e8eac1aadf" "1df667df5904fe69da795c104ab239fa56470eb1" "ff1b87e9b2339749842ebad6825337b3f4a4ead9" "fdb7b5b5669056768897b283cc1a64b432f1cc85")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"adlrvp"
	"anahera"
	"banshee"
	"brya"
	"crota"
	"felwinter"
	"gimble"
	"kano"
	"marasov"
	"mithrax"
	"omnigul"
	"osiris"
	"primus"
	"redrix"
	"skolas"
	"taeko"
	"taniks"
	"vell"
	"volmar"
	"vyhar"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "brya/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( brya )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for brya"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="* amd64 x86"

RDEPEND="!chromeos-base/chromeos-config-bsp-brya"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
