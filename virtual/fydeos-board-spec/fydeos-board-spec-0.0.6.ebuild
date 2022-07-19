# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="4"

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
    chromeos-base/auto-expand-partition
    sys-apps/haveged
    virtual/fydemina
    chromeos-base/fydeos-power-daemon-go
    chromeos-base/device-appid
"

DEPEND="${RDEPEND}"
