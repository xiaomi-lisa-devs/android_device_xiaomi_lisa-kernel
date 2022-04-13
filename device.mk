#
# Copyright (C) 2021 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE-KERNEL_PATH := device/xiaomi/lisa-kernel

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE-KERNEL_PATH)

BOARD_DTB_OFFSET := 0x01f00000

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE-KERNEL_PATH)/dtb.img

PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel \
    $(call find-copy-subdir-files,*,$(DEVICE-KERNEL_PATH)/vendor-modules,$(TARGET_COPY_OUT_VENDOR)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE-KERNEL_PATH)/ramdisk-modules,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules)

PRODUCT_VENDOR_KERNEL_HEADERS += $(DEVICE-KERNEL_PATH)/kernel-headers

