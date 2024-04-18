# Copyright 2020 The ChromiumOS Authors
# Distributed under the terms of the BSD license.

EAPI="7"

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="d2d95e8af89939f893b1443135497c1f5572aebc"
CROS_WORKON_TREE="776139a53bc86333de8672a51ed7879e75909ac9"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon

DESCRIPTION="TCON firmware updater entry point for Atlas."

LICENSE="BSD-Google"
SLOT="0/0"
KEYWORDS="*"

RDEPEND="
	chromeos-base/chromeos-nvt-tcon-updater
	chromeos-base/chromeos-tcon-updater-configs-atlas
	sys-firmware/chromeos-tcon-firmware-atlas-fhd
	sys-firmware/chromeos-tcon-firmware-atlas-uhd
"

src_install() {
	exeinto /opt/google/tcon/scripts
	doexe "${FILESDIR}/chromeos-tcon-update.sh"
}
