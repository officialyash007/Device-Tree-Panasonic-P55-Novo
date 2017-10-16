LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
             mt6592_ril.cpp \
             xlog.cpp \
             wvm.cpp \
             gps.cpp \
             egl.cpp \
             audio.cpp \
             ui.cpp \
             crypto.c

LOCAL_SHARED_LIBRARIES := libbinder libcutils libutils liblog libicuuc libui libcrypto
LOCAL_MODULE := libmtk_symbols
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
