LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res
LOCAL_RESOURCE_DIR += frameworks/support/v7/appcompat/res
LOCAL_RESOURCE_DIR += frameworks/support/v7/recyclerview/res
LOCAL_RESOURCE_DIR += frameworks/opt/chips/res
LOCAL_RESOURCE_DIR += frameworks/opt/colorpicker/res
LOCAL_RESOURCE_DIR += frameworks/opt/photoviewer/res
LOCAL_RESOURCE_DIR += frameworks/opt/photoviewer/activity/res

LOCAL_STATIC_JAVA_LIBRARIES := android-common
LOCAL_STATIC_JAVA_LIBRARIES += android-common-framesequence
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v4
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-appcompat
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-palette
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-recyclerview
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v13
LOCAL_STATIC_JAVA_LIBRARIES += com.android.vcard
LOCAL_STATIC_JAVA_LIBRARIES += lite-orm

LOCAL_AAPT_FLAGS := --auto-add-overlay
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.appcompat
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.recyclerview
LOCAL_AAPT_FLAGS += --extra-packages com.android.ex.chips
LOCAL_AAPT_FLAGS += --extra-packages com.android.vcard
LOCAL_AAPT_FLAGS += --extra-packages com.android.ex.photo
LOCAL_AAPT_FLAGS += --extra-packages com.android.colorpicker

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PROGUARD_FLAG_FILES := proguard-rules.pro

LOCAL_PACKAGE_NAME := FakeGPS
LOCAL_CERTIFICATE := platform
LOCAL_DEX_PREOPT := false

include $(BUILD_PACKAGE)

# add lite-orm
##################################################
include $(CLEAR_VARS)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := lite-orm:libs/lite-orm-1.9.2.jar

include $(BUILD_MULTI_PREBUILT)

# Also build our test apk
include $(call all-makefiles-under,$(LOCAL_PATH))
