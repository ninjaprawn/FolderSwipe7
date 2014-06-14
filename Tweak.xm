@interface SBIcon 
-(void)launchFromLocation:(int)arg1 ;
-(BOOL)isFolderIcon;
@end

@interface SBIconView : UIView {
	SBIcon* _icon;
}
@end

BOOL enabled = YES;
int gestureType = 1;

%hook SBIconView 

-(void)setLocation:(int)arg1 {

	UISwipeGestureRecognizer *swipeUp = [[[%c(UISwipeGestureRecognizer) alloc] initWithTarget:self action:@selector(FSSwipeUpGesture:)] autorelease];
	swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[self addGestureRecognizer:swipeUp];

	UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(FSPinchGesture:)];
	[self addGestureRecognizer:pinchGesture];
    %orig;
}

%new - (void)FSSwipeUpGesture:(UISwipeGestureRecognizer *)gesture {

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ninjaprawn.folderswipe7.plist"];

	if (prefs) {
		enabled = [prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : enabled;
		gestureType = [prefs objectForKey:@"swipe"] ? [[prefs objectForKey:@"swipe"] intValue] : gestureType;
	}
	if (enabled) {
	    if (gestureType == 1) {
		    SBIcon *icon = MSHookIvar<id>(self, "_icon");
		    int iconPos = MSHookIvar<int>(self, "_iconLocation");

		    if (gesture.state == UIGestureRecognizerStateEnded) {
			    if ([icon isFolderIcon]) {
				    [icon launchFromLocation:iconPos];
				}
			}
		}
	}
}

%new - (void)FSPinchGesture:(UIPinchGestureRecognizer *)gesture {

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ninjaprawn.folderswipe7.plist"];

	if (prefs) {
		enabled = [prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : enabled;
		gestureType = [prefs objectForKey:@"swipe"] ? [[prefs objectForKey:@"swipe"] intValue] : gestureType;
	}
	if (enabled) {
	    if (gestureType == 2) {
		    SBIcon *icon = MSHookIvar<id>(self, "_icon");
		    int iconPos = MSHookIvar<int>(self, "_iconLocation");

		    if (gesture.state == UIGestureRecognizerStateEnded) {
			    if ([icon isFolderIcon]) {
				    [icon launchFromLocation:iconPos];
				}
			}
		}
	}
}

%end