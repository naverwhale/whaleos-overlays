# Copyright 2021 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_COMMIT="d2d95e8af89939f893b1443135497c1f5572aebc"
CROS_WORKON_TREE="776139a53bc86333de8672a51ed7879e75909ac9"
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for Bubs"
HOMEPAGE="http://src.chromium.org"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="*"

src_install() {
	install_model_files
}
