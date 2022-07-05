#!/bin/bash
. $(dirname ${BASH_SOURCE[0]})/fydeos_version.sh
CHROMEOS_ARC_ANDROID_SDK_VERSION=28
CHROMEOS_ARC_VERSION=6104653
CHROMEOS_VERSION_AUSERVER=https://up.fydeos.com/service/update2
CHROMEOS_VERSION_DEVSERVER=https://devserver.fydeos.com:9999
CHROMEOS_VERSION_TRACK=stable-channel
#CHROMEOS_PATCH=${CHROMEOS_PATCH##*_}
CHROMEOS_PATCH=14
if [ -n "${CHROMEOS_BUILD}" ]; then
  CHROMEOS_VERSION_STRING="${CHROMEOS_BUILD}.${CHROMEOS_BRANCH}.${CHROMEOS_PATCH}.$(get_build_number ${CHROMEOS_PATCH})"
  export FYDEOS_RELEASE=$(get_fydeos_release_version)
fi
skip_blacklist_check=1
skip_test_image_content=1

install_rockpro64_bootloader() {
  local image="$1"

  info "Installing uboot firmware on ${image}"
  dd if="${ROOT}/boot/idbloader.img" of="$image" \
    conv=notrunc,fsync \
    bs=32k \
    seek=1 || die "fail to install idbloader.img"
  dd if="${ROOT}/boot/u-boot.img" of="$image" \
    conv=notrunc,fsync \
    bs=64k \
    seek=128 || die "fail to install u-boot.img"
  dd if="${ROOT}/boot/trust.img" of="$image" \
    conv=notrunc,fsync \
    bs=64k \
    seek=192 || die "fail to install trust.img"

  info "Installed bootloader."
}

install_rockpro64_efi_boot_scr() {
  local image="$1"
  local efi_offset_sectors=$(partoffset "$1" 12)
  local efi_size_sectors=$(partsize "$1" 12)
  local efi_offset=$((efi_offset_sectors * 512))
  local efi_size=$((efi_size_sectors * 512))
  local efi_dir=$(mktemp -d)

  info "Mounting EFI partition"
  sudo mount -o loop,offset=${efi_offset},sizelimit=${efi_size} "$1" \
    "${efi_dir}"

  info "Copying /boot/boot.src"
  sudo cp "${ROOT}/boot/boot.scr" "${efi_dir}/"
  sudo umount "${efi_dir}"
  rmdir "${efi_dir}"

  info "Installed /efi/boot.scr"
}

make_root_a_b_bootable() {
  local image="$1"

  info "Make ROOT-A/ROOT-B bootable"
  cgpt add -i 3 -B 1 "$image" # ROOT-A
  cgpt add -i 5 -B 1 "$image" # ROOT-B
}

board_setup() {
  install_rockpro64_bootloader "$1"
  install_rockpro64_efi_boot_scr "$1"
  # make_root_a_b_bootable "$1"
}
