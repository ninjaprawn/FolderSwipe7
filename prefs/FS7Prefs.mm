#import "PSListController.h"
#import "PSSpecifier.h"
#import "PSViewController.h"

@interface FS7PrefsListController: PSListController {
}
@end

@implementation FS7PrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FS7Prefs" target:self] retain];
	}
	return _specifiers;
}

@end

// vim:ft=objc
