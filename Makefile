export ARCHS = arm64
export TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SubwayMenu
SubwayMenu_FILES = Tweak.x Menu.mm
SubwayMenu_FRAMEWORKS = UIKit QuartzCore
SubwayMenu_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
