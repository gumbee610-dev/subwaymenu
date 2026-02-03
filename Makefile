TARGET := iphone:clang:latest:14.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMod
SubwayMod_FILES = tweak.x
SubwayMod_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
