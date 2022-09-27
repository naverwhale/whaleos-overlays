#!/bin/bash

# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# All kernel command line changes must update the security base lines in
# the signer.  It rejects any settings it does not recognize and breaks the
# build.  So any modify_kernel_command_line() function change here needs to be
# reflected in ensure_secure_kernelparams.config.

# See crrev.com/i/216896 as an example.

modify_kernel_command_line() {
  # Might be helpful to preserve ramoops in extreme circumstances
  echo "ramoops.ecc=1" >> "$1"

  # Avoid a cosmetic TPM error (Work around for b/113527055)
  sed -i -e '/tpm_tis.force/d' "$1"
  echo "tpm_tis.force=0" >> "$1"

  # Check for S0ix failures and show warnings on failures
  echo "intel_pmc_core.warn_on_s0ix_failures=1" >> "$1"

  # Enable Guc and Huc loading. When enable_guc is set to 3,
  # it supports guc/huc loading and guc submission.
  echo "i915.enable_guc=3" >> "$1"

  # Enable power-saving display c states. Setting the value of 4
  # enables up to DC6 with DC3C0.
  echo "i915.enable_dc=4" >> "$1"

  # Disable xDomain protocol on the thunderbolt driver
  echo "xdomain=0" >> "$1"
}
