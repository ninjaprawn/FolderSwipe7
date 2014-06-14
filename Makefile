THEOS_MAKE_PATH = /var/theos/makefiles

TARGET := iphone:clang
ARCHS := armv7 arm64

include $(THEOS_MAKE_PATH)/common.mk

TWEAK_NAME = FolderSwipe7
FolderSwipe7_FILES = Tweak.xm
FolderSwipe7_ARCHS = armv7 arm64
FolderSwipe7_FRAMEWORKS = Foundation UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
