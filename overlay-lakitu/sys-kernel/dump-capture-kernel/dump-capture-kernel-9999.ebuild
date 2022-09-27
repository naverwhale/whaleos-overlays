# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

# Any changes submitted in the current ebuild needs to be duplicated in
# `non-9999` ebuild as well.

EAPI=7
CROS_WORKON_REPO="https://cos.googlesource.com"
CROS_WORKON_EGIT_BRANCH="cos-4.19"
CROS_WORKON_PROJECT="third_party/kernel"
CROS_WORKON_COMMIT="581c6c9a83365f176084aea3ba7fad3124bcc205"
CROS_WORKON_LOCALNAME="cos-kernel"
CROS_WORKON_MANUAL_UPREV="1"

CHROMEOS_KERNEL_CONFIG="${FILESDIR}/base.config"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

STRIP_MASK+=" /usr/src/${P}/build/vmlinux"
STRIP_MASK+=" *.ko"

DESCRIPTION="A dump capture kernel for kdump functionality"
HOMEPAGE="https://cloud.google.com/container-optimized-os"
KEYWORDS="~*"


src_install() {
	dodir /boot/kdump
	kmake INSTALL_PATH="${D}/boot/kdump" INSTALL_MOD_PATH="${D}" \
		INSTALL_MOD_STRIP=1 install
	local version
	version=$(kmake -s --no-print-directory kernelrelease)
	ln -sf "vmlinuz-${version}" "${D}/boot/kdump/vmlinuz" || die

	# We also strips the symbol table /boot/kdump/System.map-* at:
	# overlay-lakitu/scripts/board_specific_setup.sh
}
