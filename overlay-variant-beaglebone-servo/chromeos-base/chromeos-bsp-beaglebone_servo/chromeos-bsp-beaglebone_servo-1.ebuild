# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid

DESCRIPTION="Servo bsp (meta package to pull in driver/tool dependencies)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""

# Mission critical dependencies; these are included because
# they're basic requirements for operation in the Chrome OS
# test lab:
#     chromeos-base/openssh-server-init - upstart job to start
#       sshd at boot time.
#     chromeos-base/chromeos-test-testauthkeys - install Chromium OS
#       test key to /root/.ssh/authorized_keys.
#     chromeos-base/chromeos-ec - Install flash_ec tool for firmware update.
#     chromeos-base/vboot_reference - Install gbb_utility used in
#                                     firmware_programmer.
#     dev-embedded/openocd - Used for EC programming on x86 device.
#     dev-util/hdctools - servod support.
#     net-misc/openssh - ssh client, sshd server, and related tools.
#     net-misc/ser2net - allow remote connection to various console output
RDEPEND="
	chromeos-base/chromeos-test-testauthkeys
	chromeos-base/ec-devutils
	chromeos-base/ec-utils
	chromeos-base/openssh-server-init
	chromeos-base/update-utils
	chromeos-base/vboot_reference
	dev-embedded/openocd
	dev-util/hdctools
	net-misc/openssh
	net-misc/ser2net
	sys-apps/flashrom
"

# These packages are meant to provide a basic environment for
# developers that need to log in to a device for purposes of
# debugging and/or resolving problems.
#
# You should be generous with this list:  We're not (currently)
# space constrained, so if you think it might be useful, include it.
RDEPEND="${RDEPEND}
	app-arch/gzip
	app-arch/tar
	app-editors/vim
	app-misc/screen
	app-mobilephone/dfu-util
	app-shells/bash
	dev-embedded/dfu-programmer
	dev-util/strace
	net-analyzer/tcpdump
	net-dialup/minicom
	net-misc/iputils
	net-misc/rsync
	net-misc/wget
	sys-apps/diffutils
	sys-apps/file
	sys-apps/i2c-tools
	sys-apps/less
	sys-apps/usbutils
	sys-process/procps
	sys-process/psmisc
	sys-process/time
"

S="${WORKDIR}"

src_install() {
	insinto /etc/init
	doins "${FILESDIR}"/init/*.conf

	doappid "{1BB651DD-C762-3FCF-2A66-CEB4C1096BB1}" "OTHER"
}
