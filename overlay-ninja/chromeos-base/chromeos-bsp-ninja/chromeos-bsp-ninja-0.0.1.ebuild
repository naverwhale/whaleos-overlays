# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid cros-audio-configs

DESCRIPTION="Ninja bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
S="${WORKDIR}"

RDEPEND="
"
DEPEND="${RDEPEND}"
S="${WORKDIR}"

src_install() {
	doappid "{555B868F-306A-3E26-6687-FC081968D43A}" "CHROMEBOX"

	# Install platform-specific internal keyboard keymap.
	# It should probably go into /lib/udev/hwdb.d but
	# unfortunately udevadm on 64 dev boxes does not check
	# that directory (it wants to look in /lib64/udev).
	insinto "${EPREFIX}/etc/udev/hwdb.d"
	doins "${FILESDIR}/61-ninja-keyboard.hwdb"

	# Let's put rules also in /etc/udev to mirror the keymap
	# placement.
	insinto "${EPREFIX}/etc/udev/rules.d"
	doins "${FILESDIR}/55-ninja-keyboard.rules"

	# Install audio config files.
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs swanky "${audio_config_dir}"
}

pkg_postinst() {
	udevadm hwdb --update --root="${ROOT%/}"
	# http://cgit.freedesktop.org/systemd/systemd/commit/?id=1fab57c209035f7e66198343074e9cee06718bda
	[ "${ROOT:-/}" = "/" ] && udevadm control --reload
}
