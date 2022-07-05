EAPI=6

inherit git-r3

DESCRIPTION="Rockchip U-boot"
SRC_URI=""
EGIT_REPO_URI="git@github.com:damenly/uboot-images.git"
EGIT_BRANCH="rockpi-4b"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* arm64 arm"

DEPEND=""
RDEPEND=""

#S="${WORKDIR}"

src_compile() {
	mkimage -O linux -T script -C none -a 0 -e 0 \
		-n "boot" -d "${FILESDIR}/boot.cmd" "boot.scr" || die
}

src_install() {
	insinto /boot
	doins boot.scr
	doins idbloader.img
    doins u-boot.img
    doins trust.img
}
