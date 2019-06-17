//
//  SONavigationController+Animation.m
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import "SONavigationController+Animation.h"

@implementation UINavigationController(SONavigationController)
- (void)pushViewController:(UIViewController *)viewController withCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype {
    switch (transition) {
        case SONavAnimationNone:{
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromLeft:{
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromRight:{
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationCurlUp:{
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationCurlDown:{
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationFadeIn:{
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        case SONavAnimationMoveIn:{
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        case SONavAnimationPush:{
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        case SONavAnimationReveal:{
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}

#pragma mark - popping

- (void)popViewControllerWithCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype {
    switch (transition) {
        case SONavAnimationNone:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromLeft:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromRight:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationCurlUp:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationCurlDown:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationFadeIn:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        case SONavAnimationMoveIn:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        case SONavAnimationPush:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        case SONavAnimationReveal:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}

- (void)popToRootViewControllerWithCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype {
    switch (transition) {
        case SONavAnimationNone:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromLeft:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromRight:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationCurlUp:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationCurlDown:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
            break;}
        case SONavAnimationFadeIn:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        case SONavAnimationMoveIn:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        case SONavAnimationPush:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        case SONavAnimationReveal:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}

- (void)popToViewController:(UIViewController *)viewController withCustomTransition:(SONavAnimation)transition subtype:(NSString*)subtype {
    switch (transition) {
        case SONavAnimationNone:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromLeft:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationFlipFromRight:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationCurlUp:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationCurlDown:{
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
            break;}
        case SONavAnimationFadeIn:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        case SONavAnimationMoveIn:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        case SONavAnimationPush:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        case SONavAnimationReveal:{
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
            break;}
        default:{
            break;}
    }
}

#pragma mark - private

- (void)standardAnimationWithController:(UIViewController*)viewController
                               duration:(NSTimeInterval)duration
                                options:(UIViewAnimationOptions)options
                           changesBlock:(void (^)(void))block {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView transitionWithView:self.view duration:duration options:options animations:block completion:NULL];
    [UIView commitAnimations];
}

- (void)coreAnimationWithController:(UIViewController*)viewController
                           duration:(NSTimeInterval)duration
                               type:(NSString*)type
                            subtype:(NSString*)subtype
                       changesBlock:(void (^)(void))block {
    CATransition* trans = [CATransition animation];
    [trans setDuration:duration];
    [trans setType:type];
    [trans setSubtype:subtype];
    [self.view.layer addAnimation:trans forKey:kCATransition];
    block();
}

@end
