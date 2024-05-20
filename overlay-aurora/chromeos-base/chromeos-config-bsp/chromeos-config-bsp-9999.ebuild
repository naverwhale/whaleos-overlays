# Copyright 2021 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

# cros_workon applies only to ebuild and files directory. Use the
# canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-workon cros-unibuild

DESCRIPTION="ChromeOS model configuration"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/chromeos-config/README.md"

LICENSE="BSD-Google"
KEYWORDS="~*"
RDEPEND="!chromeos-base/chromeos-config-bsp-aurora"

src_install() {
	install_model_files
}
