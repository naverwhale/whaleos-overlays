#!/bin/bash

# Copyright 2019 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# All kernel command line changes must update the security base lines in
# the signer.  It rejects any settings it does not recognize and breaks the
# build.  So any modify_kernel_command_line() function change here needs to be
# reflected in ensure_secure_kernelparams.config.

# See crrev.com/i/216896 as an example.

modify_kernel_command_line() {
  echo "tpm_tis.force=1" >> "$1"
  echo "tpm_tis.interrupts=0" >> "$1"
  echo "kvm-intel.vmentry_l1d_flush=always" >> "$1"
}
