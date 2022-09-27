#!/bin/sh
#
# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# This script is given one argument: the base of the source directory of
# the package, and it prints a string on stdout with the numerical version
# number for said repo.

if [ ! -d "$1" ] ; then
    exit
fi

cd "$1" || exit

# Strip any .0 fix level from the version string.
make kernelversion | sed -Ee 's/([0-9]*\.[0-9]*)\.0/\1/' -e s/-/_/g
