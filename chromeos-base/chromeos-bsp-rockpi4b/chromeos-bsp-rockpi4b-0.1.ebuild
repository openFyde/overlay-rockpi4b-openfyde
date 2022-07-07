# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="5"

DESCRIPTION="empty project"

inherit cros-audio-configs udev
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
  chromeos-base/device-appid
  net-misc/rsync
  net-wireless/bluez
  sys-boot/rockchip-uboot
  chromeos-base/fydeos-power-daemon-go
  chromeos-base/chromeos-bsp-baseboard-gru
  media-libs/rockchip-mpp
  "

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
  insinto /etc/init
  doins "${FILESDIR}/upstart/sdio-hciattach.conf"
  insinto "/etc/udev/hwdb.d"
  doins "${FILESDIR}"/hwdb/*

  # Install touchpad
  #insinto "/etc/gesture"
  #doins "${FILESDIR}"/gesture/*

  # Install Bluetooth ID override.
  insinto "/etc/bluetooth"
  doins "${FILESDIR}"/bluetooth/*

  # Install audio config files
  local audio_config_dir="${FILESDIR}/audio-config"
  install_audio_configs kevin "${audio_config_dir}"
  insinto /lib/udev/rules.d
  doins ${FILESDIR}/camera/50-camera.rules
  doins ${FILESDIR}/udev-rules/*
#  insinto /etc/camera
#  doins ${FILESDIR}/camera/camera_characteristics.conf
}

