# Copyright 2022 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="367af8e464dd35ec930c8823cc42fd7825eb1d62"
CROS_WORKON_TREE="26e945425c41f5477695054d52284c456a53920b"
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"passionfruit"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "passionfruit/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( passionfruit )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for passionfruit"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="*"
RDEPEND="!chromeos-base/chromeos-config-bsp-passionfruit"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
