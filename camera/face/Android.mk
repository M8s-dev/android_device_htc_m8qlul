LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    CameraFace.cpp

LOCAL_SHARED_LIBRARIES := \
	libutils \
	libcutils \
	libcamera_client \
	libgui \
	libbinder \
	libandroid

LOCAL_32_BIT_ONLY := true
LOCAL_MODULE := libcameraface
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
