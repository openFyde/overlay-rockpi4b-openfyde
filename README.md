# overlay-rockpi4b-openfyde

![Logo badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fopenfyde-badge-wivuxrq8xzvh.runkit.sh%2F) ![Release badge](https://img.shields.io/github/v/release/openFyde/overlay-rockpi4b-openfyde?label=latest%20release%20image)

<br>

## Introduction
Same as Chromium OS, openFyde adopts the [Portage build and packaging system](https://wiki.gentoo.org/wiki/Portage) from Gentoo Linux. openFyde uses Portage with certain customisations to support building multiple targets (bootable OS system images) across different hardware architectures from a shared set of sources.

A **board** defines a target type, it can be either for a family of hardware devices or specifically for one type of device. For example, The board `amd64-openfyde` is a target type for an openFyde system image that aims to run on most recent PCs with amd64(x86_64) architecture; whilst the `rpi4-openfyde` board is a target type specifically for the infamous single-board computer [Raspberry Pi 4B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/). We append  Each board has a corresponding **overlay** that defines the configuration for it. This includes details like CPU architecture, kernel configuration, as well as additional packages and USE flags.

<br>

## About this repository
This repository is the overlay for the `rockpi4b-openfyde` board, it's part of the openFyde open-source project.

This repository contains the following packages:

| Packages                               | Description                                           | Reference                                                                                                                                      |
|----------------------------------------|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| chromeos-base/device-appid             | Setup device appid                                    |                                                                                                                                                |
| virtual/fydeos-board-spec              | Setup board dependency                                |                                                   


<br>

## About the board `rockpi4b-openfyde`
 - This board specifically targets the [Rock Pi 4 model B](https://rockpi.org/rockpi4):

    ![Rock Pi 4B](https://rockpi.org/assets/images/rockpi_4B_v13_breadboard_front.svg)

 - Rock Pi 4 Model A and C should also be compatible
 - [Rock Pi 4 Model C+](https://dl.radxa.com/rockpi4/docs/hw/rockpi4/rockpi4c_plus_product_brief.pdf) is not compatible with this board
 

<br>

###### Copyright (c) 2022 Fyde Innovations and the openFyde Authors. Distributed under the license specified in the root directory of this repository.
