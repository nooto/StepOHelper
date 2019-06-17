//
//  SOTools.h
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define WeakSelf(type) autoreleasepool{} __weak __typeof__(type) weakSelf = type;
#define StrongSelf(type) autoreleasepool{} __strong __typeof__(type) strongSelf = type;


#define NAVBAR_H   [SOTools getNavBarHight]
#define SCREEN_BOUNDS           [UIScreen mainScreen].bounds
#define SCREEN_SCALE            [UIScreen mainScreen].scale
#define SCREEN_W            SCREEN_BOUNDS.size.width
#define SCREEN_H           SCREEN_BOUNDS.size.height


@interface SOTools : NSObject
+ (float)getNavBarHight;
+ (NSString *)getDocumentPath;

//单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath;

//遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath;

+ (UInt64)milliSecondTimestamp;

+ (BOOL)openApplicationOpenSetting;
@end

