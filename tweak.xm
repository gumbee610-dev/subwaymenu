#import <UIKit/UIKit.h>

// 1. TELL THE COMPILER WHAT THE GAME CLASSES DO (The Fix)
@interface CharacterPlayer : NSObject
- (void)setIsInvincible:(BOOL)isInvincible;
- (void)setCollisionEnabled:(BOOL)collisionEnabled;
@end

@interface CharacterMovement : NSObject
@end

@interface Wallet : NSObject
@end

// 2. FAKE MENU ENGINE TO PREVENT MISSING FILE ERRORS
@interface Menu : UIView
+ (instancetype)sharedInstance;
- (void)addSwitch:(NSString *)name description:(NSString *)description toggle:(bool *)toggle;
- (void)addSlider:(NSString *)name description:(NSString *)description min:(float)min max:(float)max value:(float *)value;
@end

@implementation Menu
+ (instancetype)sharedInstance { return [super new]; }
- (void)addSwitch:(NSString *)name description:(NSString *)description toggle:(bool *)toggle {}
- (void)addSlider:(NSString *)name description:(NSString *)description min:(float)min max:(float)max value:(float *)value {}
@end

// 3. YOUR MOD LOGIC
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

%ctor {
    Menu *menu = [Menu sharedInstance];
    [menu addSwitch:@"God Mode" description:@"Never die" toggle:&godMode];
    [menu addSwitch:@"Noclip" description:@"Walk through walls" toggle:&noclip];
    [menu addSlider:@"Jump Height" description:@"Set boost" min:1.0 max:10.0 value:&jumpHeight];
}
