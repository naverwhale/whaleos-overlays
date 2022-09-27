# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

# Any changes submitted in the current ebuild needs to be duplicated in
# `non-9999` ebuild as well.

EAPI=7

CROS_WORKON_REPO="https://cos.googlesource.com"
CROS_WORKON_PROJECT="third_party/kernel"
CROS_WORKON_LOCALNAME="cos-kernel"
CROS_WORKON_MANUAL_UPREV="1"

CHROMEOS_KERNEL_CONFIG="${FILESDIR}/base.config"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2 osreleased

STRIP_MASK+=" /usr/src/${P}/build/vmlinux"
STRIP_MASK+=" *.ko"

DESCRIPTION="Chromium OS Linux Kernel 4.19"
HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
KEYWORDS="~*"
IUSE="module_sign gpu"

src_configure() {
	if use module_sign ; then
		# Provide a custom key configuration file, because otherwise the kernel
		# would auto-generate one.
		mkdir -p "$(cros-workon_get_build_dir)/certs"
		cp -f "${FILESDIR}/x509.genkey" \
			"$(cros-workon_get_build_dir)/certs/x509.genkey" || die
		# Different board use different root key.
		if use gpu ; then
			# The root key belongs to lakitu-gpu board.
			cp -f "${FILESDIR}/lakitu_gpu_root_cert.pem" \
				"$(cros-workon_get_build_dir)/certs/trusted_key.pem" || die
		else
			# The root key belongs to lakitu board.
			cp -f "${FILESDIR}/lakitu_root_cert.pem" \
				"$(cros-workon_get_build_dir)/certs/trusted_key.pem" || die
		fi
	fi
	cros-kernel2_src_configure
}

# Change for EAPI=6
src_prepare() {
	default
	cros-kernel2_src_prepare
}

tar_kernel_source() {
	# Put kernel source tarball under /opt to avoid it gets
	# masked by INSTALL_MASK.
	local source_dir=opt/google/src
	dodir "${source_dir}"
	pushd "${D}/usr/src/${P}" || die
	tar --exclude="./build" -czf "${D}/${source_dir}/kernel-src.tar.gz" .
	popd || die
}

tar_kernel_headers() {
	einfo "Packaging kernel headers"
	# We do pretty much exactly what scripts/package/builddeb does.
	pushd "${D}/usr/src/${P}" || die
	(
		find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl
		find arch/*/include include scripts -type f -o -type l
		find "arch/$(tc-arch-kernel)" -name module.lds -o -name Kbuild.platforms -o -name Platform
		find "arch/$(tc-arch-kernel)" -name include -o -name scripts -type d | while IFS='' read -r line; do
			find "${line}" -type f
		done
	) > "${T}/hdrsrcfiles"
	popd || die

	pushd "$(cros-workon_get_build_dir)" || die
	{
		if cros_chkconfig_present STACK_VALIDATION; then
			find tools/objtool -type f -executable
		fi

		find "arch/$(tc-arch-kernel)/include" Module.symvers include scripts -type f

		if cros_chkconfig_present GCC_PLUGINS; then
			find scripts/gcc-plugins -name \*.so -o -name gcc-common.h
		fi
	} > "${T}/hdrobjfiles"
	popd || die

	local destdir="${T}/headers_tmp/usr/src/linux-headers-$(kernelrelease)"
	mkdir -p "${destdir}"
	tar -c -f - -C "${D}/usr/src/${P}" -T "${T}/hdrsrcfiles" | tar -xf - -C "${destdir}"
	tar -c -f - -C "$(cros-workon_get_build_dir)" -T "${T}/hdrobjfiles" | tar -xf - -C "${destdir}"
	rm "${T}/hdrsrcfiles" "${T}/hdrobjfiles"

	cp "$(cros-workon_get_build_dir)/.config" "${destdir}/.config"

	# We don't configure INSTALL_MASK to remove files in /opt, so export the
	# headers tarball through /opt.
	local source_dir=opt/google/src
	dodir "${source_dir}"
	pushd "${T}/headers_tmp" || die
	tar -czf "${D}/${source_dir}/kernel-headers.tgz" .
	popd || die
	rm -r "${T}/headers_tmp"
}

write_toolchain_env() {
	# Write the compiler info used for kernel compilation
	# in toolchain_env.
	local toolchain_env_dir=etc
	# Example for toolchain_env content:
	# CC=x86_64-cros-linux-gnu-clang
	# CXX=x86_64-cros-linux-gnu-clang++
	# The file will be deleted after copying data to BUILD_DIR artifact
	echo "CC=${CC}" > "${D}/${toolchain_env_dir}/toolchain_env"
	echo "CXX=${CXX}" >> "${D}/${toolchain_env_dir}/toolchain_env"
}

write_kernel_info() {
	# Write kernel information used for building kernel.
	local kernel_info_dir=etc
	# Example for kernel_info content:
	# URL=https://chromium.googlesource.com/chromiumos/third_party/kernel
	echo "URL=${CROS_WORKON_REPO}/${CROS_WORKON_PROJECT}" > "${D}/${kernel_info_dir}/kernel_info"
}

get_kernel_commit_id() {
	# Provide kernel commit id
	# VCSID variable is unconditionally set by the cros-workon eclass, and
	# is in the form of "<ebuild_revision>-<sha1>".
	echo "${VCSID##*-}"
}

write_kernel_commit() {
	# Write kernel commit information used for building kernel.
	local kernel_commit_dir=etc
	# Example for kernel_commit content:
	# c7ad6ff415b5a1e87f8333e2a63c7209e6efc1b2
	get_kernel_commit_id > "${D}/${kernel_commit_dir}/kernel_commit"
}

src_install() {
	cros-kernel2_src_install

	do_osrelease_field "KERNEL_COMMIT_ID" "$(get_kernel_commit_id)"

	# Install kernel source and headers tarballs so they can be exported as
	# artifacts later.
	tar_kernel_source
	tar_kernel_headers
	# Install kernel compiler information
	write_toolchain_env
	# Install kernel source information
	write_kernel_info
	# Install kernel commit information
	write_kernel_commit
}

# Change the following (commented out) number to the next prime number
# when you change base.config.  This workaround will force the
# ChromeOS CQ to uprev sys-kernel/lakitu-kernel-4_19 ebuild and pick up the
# configuration changes.  In absence of this workaround the config changes
# would not be picked up unless there was a code change in kernel source tree.
#
# NOTE: There's nothing magic keeping this number prime but you just need to
# make _any_ change to this file.  ...so why not keep it prime?
#
# The coolest prime number is: 47
