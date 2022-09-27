# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="List of packages that make up the base OS image;
by default, we build a Chromium OS image"
HOMEPAGE="http://dev.chromium.org/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
    app-emulation/docker
    net-firewall/iptables
    dev-lang/python:3.6
    virtual/target-chromium-os
"
