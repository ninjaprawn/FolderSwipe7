ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/common.mk

BUNDLE_NAME = FS7Prefs
FS7Prefs_FILES = FS7Prefs.mm
FS7Prefs_INSTALL_PATH = /Library/PreferenceBundles
FS7Prefs_FRAMEWORKS = UIKit
FS7Prefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FS7Prefs.plist$(ECHO_END)
