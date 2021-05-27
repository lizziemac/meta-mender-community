FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

require recipes-bsp/u-boot/u-boot-mender.inc

SRC_URI += "file://0001-Mender-Configs-for-U-Boot.patch \
            file://0002-remove-env_get_location-override.patch \
            "


MENDER_UBOOT_AUTO_CONFIGURE = "0"

# 8K
BOOTENV_SIZE = "0x2000"

DEPENDS_append = " stm32mp-uboot-scr"
