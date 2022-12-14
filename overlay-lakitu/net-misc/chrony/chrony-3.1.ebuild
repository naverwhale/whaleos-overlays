# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# lakitu: Because we use COS_NTP_SERVERS and COS_NTP_SERVERS_OPTIONS here, it
# is not safe to reuse the prebuilt of this package across different boards.
# Inherit the cros-board eclass to make sure that the reuse doesn't happen.
inherit cros-board eutils systemd toolchain-funcs

DESCRIPTION="NTP client and server programs"
HOMEPAGE="http://chrony.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/${PN}/${P/_/-}.tar.gz"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="*"
IUSE="caps +cmdmon html ipv6 libedit +ntp +phc pps readline +refclock +rtc selinux +adns"
REQUIRED_USE="
	?? ( libedit readline )
"

CDEPEND="
	caps? ( sys-libs/libcap )
	libedit? ( dev-libs/libedit )
	readline? ( >=sys-libs/readline-4.1-r4:= )
"
DEPEND="
	${CDEPEND}
	html? ( dev-ruby/asciidoctor )
	pps? ( net-misc/pps-tools )
"
RDEPEND="
	${CDEPEND}
	selinux? ( sec-policy/selinux-chronyd )
"

RESTRICT=test

S="${WORKDIR}/${P/_/-}"

src_prepare() {
	sed -i \
		-e 's:/etc/chrony\.:/etc/chrony/chrony.:g' \
		-e 's:/var/run:/run:g' \
		conf.c doc/*.man.in examples/* || die

	# shellcheck disable=SC2154
	if [[ -n "${COS_NTP_SERVERS}" ]]; then
		sed -i \
			-e "1s:# Use public NTP servers .*:# Use custom NTP servers:" \
			-e "2s:pool pool.ntp.org iburst:server ${COS_NTP_SERVERS} prefer iburst ${COS_NTP_SERVERS_OPTIONS}:" \
			examples/chrony.conf.example1 || die
	fi
	default
}

src_configure() {
	tc-export CC

	local CHRONY_EDITLINE
	# ./configure legend:
	# --disable-readline : disable line editing entirely
	# --without-readline : do not use sys-libs/readline (enabled by default)
	# --without-editline : do not use dev-libs/libedit (enabled by default)
	if ! use readline && ! use libedit; then
		CHRONY_EDITLINE='--disable-readline'
	else
		CHRONY_EDITLINE+=" $(usex readline '' --without-readline)"
		CHRONY_EDITLINE+=" $(usex libedit '' --without-editline)"
	fi

	# not an autotools generated script
	local CHRONY_CONFIGURE="
	./configure \
		$(usex caps '' --disable-linuxcaps) \
		$(usex cmdmon '' --disable-cmdmon) \
		$(usex ipv6 '' --disable-ipv6) \
		$(usex ntp '' --disable-ntp) \
		$(usex phc '' --disable-phc) \
		$(usex pps '' --disable-pps) \
		$(usex rtc '' --disable-rtc) \
		$(usex refclock '' --disable-refclock) \
		$(usex adns '' --disable-asyncdns) \
		${CHRONY_EDITLINE} \
		${EXTRA_ECONF} \
		--docdir=/usr/share/doc/${PF} \
		--chronysockdir=/run/chrony \
		--mandir=/usr/share/man \
		--prefix=/usr \
		--sysconfdir=/etc/chrony \
		--disable-sechash \
		--without-nss \
		--without-tomcrypt
	"

	# print the ./configure call to aid in future debugging
	einfo ${CHRONY_CONFIGURE}
	bash ${CHRONY_CONFIGURE} || die
}

src_compile() {
	emake all docs $(usex html '' 'ADOC=true')
}

src_install() {
	default

	newinitd "${FILESDIR}"/chronyd.init-r1 chronyd
	newconfd "${FILESDIR}"/chronyd.conf chronyd

	insinto /etc/${PN}
	newins examples/chrony.conf.example1 chrony.conf

	docinto examples
	dodoc examples/*.example*

	if use html; then
		docinto html
		dodoc doc/*.html
	fi

	keepdir /var/{lib,log}/chrony

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/chrony-2.4-r1.logrotate chrony

	systemd_newunit "${FILESDIR}"/chronyd.service-r2 chronyd.service
	systemd_enable_ntpunit 50-chrony chronyd.service
	systemd_enable_service multi-user.target chronyd.service
}
