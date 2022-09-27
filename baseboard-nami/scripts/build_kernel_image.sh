#!/bin/bash

# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# All kernel command line changes must update the security base lines in
# the signer.  It rejects any settings it does not recognize and breaks the
# build.  So any modify_kernel_command_line() function change here needs to be
# reflected in ensure_secure_kernelparams.config.

# See crrev.com/i/216896 as an example.

modify_kernel_command_line() {
  # Enable S0ix validation check in kernel
  echo "intel_idle.slp_s0_check=1" >> "$1"

  # Enable S0ix logging using GSMI
  echo "gsmi.s0ix_logging_enable=1" >> "$1"

  # Don't disable the ability to run VMs.
  echo "disablevmx=off" >> "$1"

  # Enable l1d_flush for untrusted VM security
  echo "kvm-intel.vmentry_l1d_flush=always" >> "$1"
}
