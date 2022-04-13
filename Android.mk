#
# Copyright (C) 2021 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter lisa,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Kernel headers
$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr: $(wildcard device/xiaomi/lisa-kernel/kernel-headers/*)
	rm -rf $@
	mkdir -p $@/include
	cp -a device/xiaomi/lisa-kernel/kernel-headers/. $@/include

endif
