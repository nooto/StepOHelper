//
//  SOUIView.h
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface UIView (StepOHelper)

- (void)addHorizontalGradientWithColors:(NSArray<UIColor *>*)colors locations:(nullable NSArray<NSNumber *> *)locations;
- (void)addVerticalGradientWithColors:(NSArray<UIColor *>*)colors locations:(nullable NSArray<NSNumber *> *)locations;
- (void)addSlashGradientWithColors:(NSArray<UIColor *>*)colors locations:(nullable NSArray<NSNumber *> *)locations;

- (void)setShape:(CGPathRef)shape;
@end
