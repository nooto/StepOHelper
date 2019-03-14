//
//  SOColor+Font.h
//  StepOHelperDemo
//
//  Created by GaoAng on 2019/3/14.
//  Copyright © 2019年 Self.work. All rights reserved.
//

//#ifndef SOColor_Font_h
//#define SOColor_Font_h
#import <YYKit/YYKit.h>
// Color related macros
#define UIColorFromHexValue(hexValue)       [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromHexString(hexString)     [UIColor colorWithHexString:hexString]
#define RGBAColor(r, g, b, a)               [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)]
#define RGBColor(r, g, b)                   RGBAColor(r, g, b, 1.0)

//字体
#define kSystemFontName @"Helvetica"

// Font
#define kFontWithNameAndSize(name, sz)      [UIFont fontWithName:name size:sz]
#define kPingfangRegularFont(size)          kFontWithNameAndSize(@"PingFangSC-Regular", size)
#define kPingfangMediumFont(size)           kFontWithNameAndSize(@"PingFangSC-Medium", size)
#define kPingfangLightFont(size)            kFontWithNameAndSize(@"PingFangSC-Light", size)
#define kSystemFont(size)                   [UIFont systemFontOfSize:size]
#define kBoldSystemFont(size)               [UIFont boldSystemFontOfSize:size]

// Color
#define kDefaultButtonColor                 UIColorFromHexString(@"#13D5DC")
#define kCommonTextColor                    UIColorFromHexString(@"#C8CACC")
#define kDefaultDisableColor                UIColorFromHexString(@"#A9F4F6")
#define kDefaultNavigationColor             UIColorFromHexString(@"#FFFFFF")
#define kDefaultNavigationTitleColor        UIColorFromHexString(@"#081530")
#define kDefaultBlackColor                  UIColorFromHexString(@"#2F3133")
#define kDefaultRedColor                    UIColorFromHexString(@"#F26161")
#define kDefaultGreyColor                   UIColorFromHexString(@"#76787A")
#define kLightGreyColor                     UIColorFromHexString(@"#DBDBDB")
#define kHighlightGreyColor                 UIColorFromHexString(@"#EBEBEB")
#define kDefaultYellowColor                 UIColorFromHexString(@"#FFD53D")
//#endif /* SOColor_Font_h */
