#!/bin/bash

# Copyright 2023 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# All kernel command line changes must update the security base lines in
# the signer.  It rejects any settings it does not recognize and breaks the
# build.  So any modify_kernel_command_line() function change here needs to be
# reflected in ensure_secure_kernelparams.config.

# See crrev.com/i/216896 as an example.

modify_kernel_command_line() {
  {
    echo "amdgpu.abmlevel=0x4"

    # See b/189856884 - enable PSR
    echo "amdgpu.dcfeaturemask=0x8"

    echo "rtc-cmos.use_acpi_alarm=1"
    # TODO(b/290662743): Re-enable when STB debugfs doesn't crash
    echo "amd-pmc.enable_stb=0"
    echo "amd_pstate=active"
  } >> "$1"
}
