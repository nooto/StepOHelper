//
//  SOUIView.m
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import "SOUIView.h"

@implementation UIView (StepOHelper)

- (void)addHorizontalGradientWithColors:(NSArray<UIColor *>*)colors locations:(NSArray<NSNumber *> *)locations
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
    
    
    if ([locations count] > 0)
    {
        gradientLayer.locations = locations;
    }
    
    if ([colors count] > 0)
    {
        NSMutableArray *colorRefs = [NSMutableArray array];
        [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [colorRefs addObject:(__bridge id)obj.CGColor];
        }];
        
        gradientLayer.colors = colorRefs;
    }
    
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 1);
}

- (void)addVerticalGradientWithColors:(NSArray<UIColor *>*)colors locations:(NSArray<NSNumber *> *)locations
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
    
    
    if ([locations count] > 0)
    {
        gradientLayer.locations = locations;
    }
    
    if ([colors count] > 0)
    {
        NSMutableArray *colorRefs = [NSMutableArray array];
        [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [colorRefs addObject:(__bridge id)obj.CGColor];
        }];
        
        gradientLayer.colors = colorRefs;
    }
    
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
}

- (void)addSlashGradientWithColors:(NSArray<UIColor *>*)colors locations:(NSArray<NSNumber *> *)locations
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
    
    
    if ([locations count] > 0)
    {
        gradientLayer.locations = locations;
    }
    
    if ([colors count] > 0)
    {
        NSMutableArray *colorRefs = [NSMutableArray array];
        [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [colorRefs addObject:(__bridge id)obj.CGColor];
        }];
        
        gradientLayer.colors = colorRefs;
    }
    
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
}

- (void)setShape:(CGPathRef)shape
{
    if (shape == nil)
    {
        self.layer.mask = nil;
    }
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = shape;
    self.layer.mask = maskLayer;
}


@end
