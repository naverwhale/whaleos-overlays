# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# update on bump, look for https://github.com/docker\
# docker-ce/blob/<docker ver OR branch>/components/engine/hack/dockerfile/install/containerd.installer
CONTAINERD_COMMIT="269548fa27e0089a8b8278fc4fc781d7f65a939b"
EGO_PN="github.com/containerd/${PN}"

inherit golang-vcs-snapshot toolchain-funcs

DESCRIPTION="A daemon to control runC"
HOMEPAGE="https://containerd.io/"
# NOTE: Drop '.gh' on bump, it's there because of bug #764791
SRC_URI="https://github.com/containerd/${PN}/archive/${CONTAINERD_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="apparmor btrfs device-mapper +cri hardened +seccomp selinux test"

DEPEND="
	btrfs? ( sys-fs/btrfs-progs )
	seccomp? ( sys-libs/libseccomp )
"

RDEPEND="
	${DEPEND}
	~app-emulation/runc-1.0.0_rc92
"

BDEPEND="
	virtual/pkgconfig
	test? ( "${RDEPEND}" )
"

# tests require root or docker
# upstream does not recommend stripping binary
RESTRICT+=" strip test"

S="${WORKDIR}/${P}/src/${EGO_PN}"

src_prepare() {
	default
	sed -i -e "s/git describe --match.*$/echo ${PV})/"\
		-e "s/git rev-parse HEAD.*$/echo ${CONTAINERD_COMMIT})/"\
		-e "s/-s -w//" \
		Makefile || die
}

src_compile() {
	local options=(
		$(usev apparmor)
		$(usex btrfs "" "no_btrfs")
		$(usex cri "" "no_cri")
		$(usex device-mapper "" "no_devmapper")
		$(usev seccomp)
		$(usev selinux)
	)

	myemakeargs=(
		BUILDTAGS="${options[*]}"
		DESTDIR="${ED}"
		LDFLAGS="$(usex hardened '-extldflags -fno-PIC' '')"
	)

	export GOPATH="${WORKDIR}/${P}" # ${PWD}/vendor
	export GOFLAGS="-v -x -mod=vendor"
	emake "${myemakeargs[@]}" all
}

src_install() {
	dobin bin/*
	#doman man/*
	newinitd "${FILESDIR}"/${PN}.initd "${PN}"
	keepdir /var/lib/containerd

	# we already installed manpages, remove markdown source
	# before installing docs directory
	#rm -r docs/man || die

	#local DOCS=( README.md PLUGINS.md docs/. )
	#einstalldocs
}
