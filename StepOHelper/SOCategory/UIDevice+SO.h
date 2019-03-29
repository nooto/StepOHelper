//
//  SODevice.h
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, UIDeviceFamily) {
    UIDeviceFamilyUnknown,
    UIDeviceFamilyiPhone,
    UIDeviceFamilyiPad,
    UIDeviceFamilyiPodTouch,
    UIDeviceFamilyAppleTV,
    UIDeviceFamilyAppleWatch,
};

// Currently for iPhone only
typedef NS_ENUM(NSUInteger, UIDevicePlatform) {
    UIDevicePlatformUnknown = 0,
    // iPhone
    UIDevicePlatformiPhoneA1203,
    UIDevicePlatformiPhone3G,
    UIDevicePlatformiPhone3GS,
    UIDevicePlatformiPhone4A1332,
    UIDevicePlatformiPhone4A1349,
    UIDevicePlatformiPhone4S,
    UIDevicePlatformiPhone5,
    UIDevicePlatformiPhone5A1428,
    UIDevicePlatformiPhone5C,
    UIDevicePlatformiPhone5CA1456,
    UIDevicePlatformiPhone5S,
    UIDevicePlatformiPhone5SA1453,
    UIDevicePlatformiPhone6,
    UIDevicePlatformiPhone6Plus,
    UIDevicePlatformiPhone6S,
    UIDevicePlatformiPhone6SPlus,
    UIDevicePlatformiPhoneSE,
    UIDevicePlatformiPhone7,
    UIDevicePlatformiPhone7Plus,
    UIDevicePlatformiPhone8,
    UIDevicePlatformiPhone8Plus,
    UIDevicePlatformiPhoneX,
    UIDevicePlatformiPhoneXR,
    UIDevicePlatformiPhoneXS,
    UIDevicePlatformiPhoneXSM,
    // iPad
    //    UIDevicePlatformiPad,
    //    UIDevicePlatformiPad2A1395,
    //    UIDevicePlatformiPad2A1396,
    //    UIDevicePlatformiPad2A1397,
    //    UIDevicePlatformiPad3A1416,
    //    UIDevicePlatformiPad3A1403,
    //    UIDevicePlatformiPad3A1430,
    //    UIDevicePlatformiPad4A1458,
    //    UIDevicePlatformiPad4A1459,
    //    UIDevicePlatformiPad4A1460,
    //    UIDevicePlatformiPadAirA1474,
    //    UIDevicePlatformiPadAirA1475,
    //    UIDevicePlatformiPadAirA1476,
    //    UIDevicePlatformiPadAir2A1566,
    //    UIDevicePlatformiPadAir2A1567,
    //    UIDevicePlatformiPadPro,
    //    UIDevicePlatformiPadProA1584,
    //    UIDevicePlatformiPadProA1652,
    //    UIDevicePlatformiPadProA1673,
    //    // iPad mini
    //    UIDevicePlatformiPadMiniA1432,
    //    UIDevicePlatformiPadMiniA1454,
    //    UIDevicePlatformiPadMiniA1455,
    //    UIDevicePlatformiPadMini2A1489,
    //    UIDevicePlatformiPadMini2A1490,
    //    UIDevicePlatformiPadMini2A1491,
    //    UIDevicePlatformiPadMini3A1599,
    //    UIDevicePlatformiPadMini3A1600,
    //    UIDevicePlatformiPadMini3A1601,
    //    UIDevicePlatformiPadMini4A1538,
    //    UIDevicePlatformiPadMini4A1550,
    //    // iPod Touch
    //    UIDevicePlatformiPodTouchA1213,
    //    UIDevicePlatformiPodTouch2G,
    //    UIDevicePlatformiPodTouch3G,
    //    UIDevicePlatformiPodTouch4G,
    //    UIDevicePlatformiPodTouch5G,
    //    UIDevicePlatformiPodTouch6G,
    //    // Apple TV
    //    UIDevicePlatformAppleTV2G,
    //    UIDevicePlatformAppleTV3GA1427,
    //    UIDevicePlatformAppleTV3GA1469,
    //    UIDevicePlatformAppleTV4G,
    //    // Apple Watch
    //    UIDevicePlatformAppleWatch,
    //    UIDevicePlatformAppleWatchA1553,
    //    // Simulator
    UIDevicePlatformiPhone32bitSimulator,
    UIDevicePlatformiPhone64bitSimulator,
    UIDevicePlatformiPad32bitSimulator,
    UIDevicePlatformiPad64bitSimulator,
    // Unknown
    UIDevicePlatformUnknowniPhone,
    UIDevicePlatformUnknowniPad,
    UIDevicePlatformUnknowniPodTouch,
    UIDevicePlatformUnknownAppleTV,
    UIDevicePlatformUnknownAppleWatch,
    UIDeviceIFPGA
};

@interface UIDevice (StepO)
/// 屏幕宽度
+ (CGFloat)getDeviceScreenWidth;

/// 屏幕高度
+ (CGFloat)getDeviceScreenHeight;

/// 获取设备版本号
//+ (NSString *)getDeviceName;

/// 获取iPhone名称
+ (NSString *)getiPhoneName;

/// 是否是iphoneX
+ (BOOL)isIPhoneX;

/// 是否开启了热点
+ (BOOL)isOpenHotspot;

/// 获取电池电量
+ (CGFloat)getBatteryLevel;

/// 当前系统名称
+ (NSString *)getSystemName;

/// 当前系统版本号
+ (NSString *)getSystemVersion;

/// 通用唯一识别码UUID
+ (NSString *)getUUID;

/// 获取当前设备IP
+ (NSString *)getDeviceIPAdress;

/// 获取总内存大小
+ (long long)getTotalMemorySize;

/// 获取当前可用内存
+ (long long)getAvailableMemorySize;

/// 获取精准电池电量
+ (CGFloat)getCurrentBatteryLevel;

/// 获取电池当前的状态，共有4种状态
+ (NSString *) getBatteryState;

/// 获取当前语言
+ (NSString *)getDeviceLanguage;

/// 获取当 MAC 地址
+ (NSString *) getMacAddress;

/// 获取当 wifi 名称
+ (NSString* )getWifiName;

// 设备唯一id
//+ (NSString *)deviceUUID;

// 是否越狱
+ (BOOL)isJailbroken;

+ (NSDictionary *)Wi_FiInfo;
+ (NSString *)Wi_FiSSID;

@end
