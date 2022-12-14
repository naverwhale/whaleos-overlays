# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="Common packages that make up the lakitu image"
HOMEPAGE="http://dev.chromium.org/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE="bootchart +crash_reporting +pam readahead systemd watchdog apparmor criu uefi_bootloaders stackdriver_alpha module_sign lockdown lakitu_kdump"

LAKITU_RDEPEND="
	bootchart? ( app-benchmarks/bootchart )
	crash_reporting? ( chromeos-base/crash-reporter )
	pam? (
		virtual/chromeos-auth-config
		sys-auth/pam_pwdfile
	)
	watchdog? ( sys-apps/daisydog )
	app-admin/node-problem-detector
	stackdriver_alpha? ( app-admin/stackdriver )
	app-admin/google-osconfig-agent
	app-admin/sosreport
	app-admin/sudo
	app-admin/toolbox
	app-arch/tar
	app-editors/vim
	app-emulation/cloud-init
	app-emulation/docker
	app-emulation/docker-credential-gcr
	app-emulation/kubernetes
	app-shells/bash
	chromeos-base/chromeos-init-systemd
	chromeos-base/chromeos-installer
	chromeos-base/cloud-filesystem-init
	chromeos-base/cloud-udev-config
	chromeos-base/openssh-server-init
	chromeos-base/tty
	chromeos-base/update_engine
	dev-lang/python
	dev-util/perf
	lakitu_kdump? (
		app-admin/kdump-helper
		sys-apps/makedumpfile
		sys-apps/kexec-tools
		sys-kernel/dump-capture-kernel
	)
	net-analyzer/netcat
	net-firewall/conntrack-tools
	net-firewall/ebtables
	net-fs/autofs
	net-misc/bridge-utils
	net-misc/chrony
	net-misc/rsync
	net-misc/wget
	apparmor? (
		sys-apps/apparmor
		sec-policy/apparmor-profiles
	)
	sys-apps/acl
	sys-apps/cloud-disk-resize
	sys-apps/dbus
	sys-apps/ethtool
	>=sys-apps/iproute2-3.19.0
	sys-apps/loadpin-trigger
	module_sign? ( sys-apps/keyutils )
	sys-apps/less
	sys-apps/mosys
	sys-apps/nvme-cli
	sys-apps/pv
	sys-fs/mdadm
	uefi_bootloaders? (
		sys-boot/grub-lakitu
		sys-boot/shim
	)
	sys-fs/e2fsprogs
	sys-fs/fuse
	sys-fs/lvm2
	sys-fs/xfsprogs
	criu? ( sys-process/criu )
	virtual/chromeos-bsp
	virtual/chromeos-firewall
	virtual/cloud-init-config
	virtual/implicit-system
	virtual/lakitu-network-init
	virtual/linux-sources
	virtual/modutils
	virtual/udev
"

RDEPEND="${LAKITU_RDEPEND}
"

DEPEND="
	${LAKITU_RDEPEND}
	sys-boot/syslinux
"
