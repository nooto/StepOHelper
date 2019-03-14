//
//  SOUILabel.m
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import "SOUILabel.h"
#import "UIView+YYAdd.h"
#import "SONSString.h"
#import <objc/runtime.h>

@interface UILabel()

@property (nonatomic, strong) NSNumber *isAnimating;
@property (nonatomic, strong) NSNumber *duration;

@end

@implementation UILabel (StepOHelper)

+ (UILabel *)labelWithTextColor:(UIColor *)textColor textFont:(UIFont *)textFont
{
    return [self labelWithTextColor:textColor backgroundColor:[UIColor clearColor] textFont:textFont textAlignment:NSTextAlignmentLeft nuberOflines:1];
}

+ (UILabel *)labelWithTextColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)alignment
{
    return [self labelWithTextColor:textColor backgroundColor:[UIColor clearColor] textFont:textFont textAlignment:alignment nuberOflines:1];
}

+ (UILabel *)labelWithTextColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)alignment nuberOflines:(NSInteger)lines{
    UILabel *label = [[UILabel alloc] init];
    
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    label.font = textFont;
    label.textAlignment = alignment;
    label.numberOfLines = lines;
    return label;
}

- (void)addalignment:(NSTextAlignment)alignment backgroundColor:(UIColor*)color titleColor:(UIColor*)titleColor labelTag:(NSInteger)tag font:(UIFont *)fontSize
{
    self.textAlignment = alignment;
    self.backgroundColor = color;
    self.textColor = titleColor;
    self.font = fontSize;
    self.tag = tag;
}

- (NSDictionary *)attributesWithAlignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor font:(UIFont *)font
{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = alignment;
    return  @{NSFontAttributeName:font,NSForegroundColorAttributeName:textColor,NSParagraphStyleAttributeName:style};
}

- (CGSize)addAotuSizeLabel:(NSString *)label maximumSize:(CGSize)size
{
    return [self.text getUISize:self.font limitWidth:self.width];
}

- (CGFloat)setAttrbuteWithFirstString:(NSString *)firstString secondString:(NSString *)secondString firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor firstFont:(CGFloat)firstFont secondFont:(CGFloat)secondFont
{
    return [self setAttrbuteWithFirstString:firstString secondString:secondString firstColor:firstColor secondColor:secondColor firstFont:firstFont secondFont:secondFont alignment:NSTextAlignmentLeft];
}

- (CGFloat)setAttrbuteWithFirstString:(NSString *)firstString secondString:(NSString *)secondString firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor firstFont:(CGFloat)firstFont secondFont:(CGFloat)secondFont alignment:(NSTextAlignment)alignment
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]init];
    NSAttributedString *attribute1 = [[NSAttributedString alloc]initWithString:firstString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:firstFont],NSForegroundColorAttributeName:firstColor}];
    [attrString appendAttributedString:attribute1];
    
    NSAttributedString *attribute2 = [[NSAttributedString alloc]initWithString:secondString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:secondFont],NSForegroundColorAttributeName:secondColor}];
    
    [attrString appendAttributedString:attribute2];
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = alignment;//对齐方式
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attrString.length)];
    
    CGFloat firstWidth = [firstString getUISize:font(firstFont) limitWidth:MAXFLOAT].width;
    CGFloat secondWidth = [secondString getUISize:font(secondFont) limitWidth:MAXFLOAT].width;
    
    self.attributedText = attrString;
    self.width = firstWidth+secondWidth;
    
    return firstWidth+secondWidth;
}


- (void)addPMDEffection:(NSTimeInterval)animationDuration
{
    if (!self.text.length || [self viewWithTag:10010]) return;
    
    CGFloat textWidth = [self.text getUISize:self.font limitWidth:MAXFLOAT].width;
    CGFloat width = CGRectGetWidth(self.frame);
    if (textWidth <= width) return;
    
    self.duration = @(animationDuration);
    
    UILabel *firstLabel = [self mutableCopy];
    firstLabel.tag = 10010;
    [firstLabel sizeToFit];
    
    UILabel *secondLabel = [self mutableCopy];
    secondLabel.tag = 10011;
    [secondLabel sizeToFit];
    
    self.text = nil;
    [self addSubview:firstLabel];
    [self addSubview:secondLabel];
    [self setClipsToBounds:YES];
    
    firstLabel.frame = CGRectMake(0, 0, firstLabel.width, self.height);
    secondLabel.frame = CGRectMake(firstLabel.right+30, 0, secondLabel.width, self.height);
    
    self.isAnimating = @NO;
    [self animate];
}

- (void)animate
{
    if ([self.isAnimating boolValue]) {
        return;
    }
    self.isAnimating = @YES;
    
    UILabel *firstLabel = [self viewWithTag:10010];
    UILabel *secondLabel = [self viewWithTag:10011];
    if (!firstLabel || !secondLabel) {
        return;
    }
    
    [UIView animateWithDuration:[self.duration floatValue] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        if (firstLabel.left == 0) {
            firstLabel.left = -(firstLabel.width+30);
            secondLabel.left = 0;
        }else{
            firstLabel.left = 0;
            secondLabel.left = -(secondLabel.width+30);
        }
    }  completion:^(BOOL finished) {
        if (firstLabel.left == 0) {
            secondLabel.left = firstLabel.right+30;
        }else{
            firstLabel.left = secondLabel.right+30;
        }
        
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //            self.isAnimating = @NO;
        //            [self animate];
        //        });
    }];
}

- (void)removePMDEffection
{
    self.isAnimating = @YES;
    UILabel *firstLabel = [self viewWithTag:10010];
    UILabel *secondLabel = [self viewWithTag:10011];
    if (!firstLabel || !secondLabel) {
        return;
    }
    self.text = firstLabel.text;
    [self setClipsToBounds:NO];
    [firstLabel removeFromSuperview];
    [secondLabel removeFromSuperview];
}

- (CGSize)textSizeWithLimitWidth:(CGFloat)limitWidth
{
    return [self.text getUISize:self.font limitWidth:limitWidth];
}

#pragma mark - getter
- (CGSize)textSize
{
    if (!self.text.length) {
        return CGSizeZero;
    }
    return [self.text getUISize:self.font limitWidth:MAXFLOAT];
}

- (void)setIsAnimating:(NSNumber *)isAnimating
{
    objc_setAssociatedObject(self, "isAnimating", isAnimating, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)isAnimating
{
    NSNumber *animating = objc_getAssociatedObject(self, "isAnimating");
    if (!animating) {
        animating = @NO;
        objc_setAssociatedObject(self, "isAnimating", animating, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return animating;
}

- (void)setDuration:(NSNumber *)duration
{
    objc_setAssociatedObject(self, "duration", duration, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)duration
{
    NSNumber *dur = objc_getAssociatedObject(self, "duration");
    if (!dur) {
        dur = @4;
        objc_setAssociatedObject(self, "duration", dur, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dur;
}

#pragma mark -

-(void)setTextWithAdjustWidth:(NSString*)text{
    [self setText:text];
    [self adjustLabelWidth];
}

-(void)adjustLabelWidth{
    if (self.text.length > 0  && self.font) {
        CGSize testSize = TEXTSIZE(self.text,self.font);//[self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
        CGRect frame = self.frame;
        frame.size.width = testSize.width;
        //        frame.size.height = testSize.height;
        self.frame =frame;
    }
    else{
        CGRect frame = self.frame;
        frame.size.width = 0;
        //        frame.size.height = 0;
        self.frame = frame;
    }
}

-(void)adjustLabelHeight{
    if (self.text && self.font) {
        CGSize testSize = MB_MULTILINE_TEXTSIZE(self.text, self.font, CGSizeMake(self.frame.size.width, MAXFLOAT), 0);//[self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
        CGRect frame = self.frame;
        frame.size.height = testSize.height;
        self.numberOfLines = 0;
        self.frame =frame;
    }
}

-(void)setTextWithAdjustHeight:(NSString*)text{
    [self setText:text];
    [self adjustLabelHeight];
}


@end
