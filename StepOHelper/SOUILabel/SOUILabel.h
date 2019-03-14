//
//  SOUILabel.h
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import <UIKit/UIKit.h>

#define font(a) [UIFont systemFontOfSize:a]
#define font_B(a) [UIFont boldSystemFontOfSize:a]
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define MB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define MB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif

@interface UILabel (StepOHelper)


@property (nonatomic, readonly) CGSize textSize;

+ (UILabel *)labelWithTextColor:(UIColor *)textColor textFont:(UIFont *)textFont;

+ (UILabel *)labelWithTextColor:(UIColor *)textColor
                       textFont:(UIFont *)textFont
                  textAlignment:(NSTextAlignment)alignment;

+ (UILabel *)labelWithTextColor:(UIColor *)textColor
                backgroundColor:(UIColor *)backgroundColor
                       textFont:(UIFont *)textFont
                  textAlignment:(NSTextAlignment)alignment
                   nuberOflines:(NSInteger)lines;


- (void)addalignment:(NSTextAlignment)alignment backgroundColor:(UIColor*)color titleColor:(UIColor*)titleColor labelTag:(NSInteger)tag font:(UIFont *)fontSize;
- (NSDictionary *)attributesWithAlignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor font:(UIFont *)font;
/// 设置富文本
- (CGFloat)setAttrbuteWithFirstString:(NSString *)firstString secondString:(NSString *)secondString firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor firstFont:(CGFloat)firstFont secondFont:(CGFloat)secondFont ;
/// 设置富文本
- (CGFloat)setAttrbuteWithFirstString:(NSString *)firstString secondString:(NSString *)secondString firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor firstFont:(CGFloat)firstFont secondFont:(CGFloat)secondFont alignment:(NSTextAlignment)alignment;

- (CGSize)textSizeWithLimitWidth:(CGFloat)limitWidth;

- (CGSize)addAotuSizeLabel:(NSString *)label maximumSize:(CGSize)size;
/** 添加跑马灯效果*/
- (void)addPMDEffection:(NSTimeInterval)animationDuration;
/** 移除跑马灯效果*/
- (void)removePMDEffection;


-(void)adjustLabelWidth;
-(void)setTextWithAdjustWidth:(NSString*)text;

-(void)adjustLabelHeight;
-(void)setTextWithAdjustHeight:(NSString*)text;

@end

