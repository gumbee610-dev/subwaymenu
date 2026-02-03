#import <UIKit/UIKit.h>
#import <vector>

// Integrated Menu Interface - Removes need for Menu.h
@interface Menu : UIView
@property (nonatomic, strong) NSString *title;
+ (instancetype)sharedInstance;
- (void)addSwitch:(NSString *)name description:(NSString *)description toggle:(bool *)toggle;
- (void)addSlider:(NSString *)name description:(NSString *)description min:(float)min max:(float)max value:(float *)value;
- (void)showMenuButton;
@end

@implementation Menu
+ (instancetype)sharedInstance {
    static Menu *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ shared = [[self alloc] init]; });
    return shared;
}
- (void)addSwitch:(NSString *)name description:(NSString *)description toggle:(bool *)toggle {}
- (void)addSlider:(NSString *)name description:(NSString *)description min:(float)min max:(float)max value:(float *)value {}
- (void)showMenuButton {}
@end

// Your Mod Logic
bool godMode = false;
bool noclip = false;
float jumpHeight = 1.0f;

%hook CharacterPlayer
- (void)update {
    %orig;
    if (godMode) { [self setIsInvincible:YES]; }
    if (noclip) { [self setCollisionEnabled:NO]; }
}
%end

%hook CharacterMovement
- (float)jumpVelocity {
    if (jumpHeight > 1.0f) { return %orig * jumpHeight; }
    return %orig;
}
%end

%hook Wallet
- (bool)canAfford:(long long)amount { return YES; }
%end

void setupMenu() {
    Menu *menu = [Menu sharedInstance];
    [menu addSwitch:@"God Mode" description:@"Never die" toggle:&godMode];
    [menu addSwitch:@"Noclip" description:@"Walk through walls" toggle:&noclip];
    [menu addSlider:@"Jump Height" description:@"Set boost" min:1.0 max:10.0 value:&jumpHeight];
}

%ctor {
    setupMenu();
}
