//
//  SONSString.h
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import <UIKit/UIKit.h>


@interface NSString (StepOHelper)
//获取字符串Size
- (CGSize)getUISize:(UIFont*)font limitWidth:(CGFloat)width;
- (NSString *)isDetailGoodsID;//扫描二维码 获取产品ID
/**获取带行间距的字符串Size*/
- (CGSize)getUISize:(UIFont*)font WithParagraphSpace:(CGFloat)space limitWidth:(CGFloat)width;
/**
 *  生成带“¥”符号的字符串
 */
- (NSString *)addCurrencySymbol;

/** 中文字符长度 */
- (NSInteger)byteLength;

/** 判断字符串字符个数 */
+ (int)getCharacterFromStr:(NSString *)tempStr;

/** 给不同的内容赋不同的字体 */
+ (NSArray *)descripteDifferentLabelWithFirstString:(NSString *)firstString  AndFirstFont:(UIFont *)fontF WithFirstColor:(UIColor *)firstColor WithSecondString:(NSString *)secondString AndSecondFont:(UIFont *)fontL AndSecondColor:(UIColor *)secondColor;

/** 给字符串赋不同的颜色 */
+ (NSMutableAttributedString *)replaceStrColorFormStr:(NSString *)tempStr  targetStr:(NSString *)targetStr color:(UIColor *)newColor;


+ (NSString *)pathName;//文件名字
/**
 *  左侧菜单栏的存贮文件名
 *
 */
+ (NSString *)leftMenuPathName;
/**
 *  积分商城的存贮位置
 *
 */
+(NSString *)pointMallPathName;

+ (BOOL)checkPasswordValid:(NSString *)password;


@end
