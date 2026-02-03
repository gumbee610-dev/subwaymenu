#import <UIKit/UIKit.h>

static bool modsEnabled = false;

// 1. Forward Declarations
@interface CharacterPlayer : NSObject
- (void)setIsInvincible:(BOOL)isInvincible;
- (void)setCollisionEnabled:(BOOL)collisionEnabled;
@end

// 2. THE TOGGLE (2-Finger Long Press)
%hook UIViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;
    UILongPressGestureRecognizer *toggle = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleModToggle:)];
    toggle.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:toggle];
}

%new
- (void)handleModToggle:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        modsEnabled = !modsEnabled;
    }
}
%end

// 3. UNLIMITED EVERYTHING (Coins, Keys, Boards)
%hook Wallet
- (long long)coins { return modsEnabled ? 999999999 : %orig; }
- (long long)keys { return modsEnabled ? 999999999 : %orig; }
- (int)hoverboards { return modsEnabled ? 999999999 : %orig; }
- (bool)canAfford:(long long)amount { return modsEnabled ? YES : %orig; }
- (bool)canAffordKeys:(long long)amount { return modsEnabled ? YES : %orig; }
%end

// 4. FREE SHOPPING & SCORE MULTIPLIER
%hook StoreHandler
- (bool)isItemPurchased:(id)itemIdentifier { return modsEnabled ? YES : %orig; }
%end

%hook GameStats
- (int)multiplier { return modsEnabled ? 999 : %orig; }
%end

// 5. GAMEPLAY HACKS (God Mode & Jump)
%hook CharacterPlayer
- (void)update {
    %orig;
    if (modsEnabled) {
        [self setIsInvincible:YES];
        [self setCollisionEnabled:NO];
    }
}
%end

%hook CharacterMovement
- (float)jumpVelocity {
    return modsEnabled ? (%orig * 2.0f) : %orig;
}
%end
