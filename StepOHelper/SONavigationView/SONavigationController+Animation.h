//
//  SONavigationController+Animation.h
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum {
    SONavAnimationNone,
    SONavAnimationFlipFromLeft,
    SONavAnimationFlipFromRight,
    SONavAnimationCurlUp,
    SONavAnimationCurlDown,
    SONavAnimationFadeIn,
    SONavAnimationMoveIn,
    SONavAnimationPush,
    SONavAnimationReveal
} SONavAnimation;

@interface UINavigationController(SONavigationController)

- (void)pushViewController:(UIViewController *)viewController withCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype;
- (void)popViewControllerWithCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype;
- (void)popToRootViewControllerWithCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype;
- (void)popToViewController:(UIViewController *)viewController withCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype;

@end
