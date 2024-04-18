# Copyright 2023 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="2070da925cf655c45c1028d2e7cab2ee444c7143"
CROS_WORKON_TREE="7384bce08f92e9b5d9edf48b1388dab2228108a2"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v6.1"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 6.1 with Geralt private patches."
KEYWORDS="*"

# This is for MT8188G only.
# It had been developing with chromeos-kernel-upstream before the 6.1 kernel
# was ready in the early stage.
# This ensures that the old kernel target will be rejected and cleared when
# building the new 6.1 kernel.
# CQ should be fine without this, but just in case so that Portage cleans up
# the dependency properly in developers' local incremental builds.
RDEPEND="
	!sys-kernel/chromeos-kernel-upstream
"
