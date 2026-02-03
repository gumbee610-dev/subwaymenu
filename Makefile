export ARCHS = arm64
export TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMod
# This line MUST include both files now
SubwayMod_FILES = tweak.x Menu.mm
SubwayMod_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
