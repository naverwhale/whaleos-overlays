# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

cros_pre_src_prepare_patches() {
	# Disable noexec mounts check for lakitu.
	# Lots of our users rely on running scripts from /home which
	# is noexec.
	# See https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md
	CPPFLAGS+=" -DSHELL_IGNORE_NOEXEC"
}
