//
//  SOTools.m
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import "SOTools.h"
#import "UIDevice+SO.h"
@implementation SOTools
+ (float)getNavBarHight{
    if ([UIDevice isIPhoneX]) {
        return 44+44;
    }
    return 64;
}

+ (NSString *)getDocumentPath {
    NSString *userDocumentsPath = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        userDocumentsPath = [paths objectAtIndex:0];
    }
    return userDocumentsPath;
}

//单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

//遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

+ (UInt64)milliSecondTimestamp{
    return  [[NSDate date] timeIntervalSince1970] * 1000;
}


+ (BOOL)openApplicationOpenSetting{
    __block BOOL isSuccess = NO;
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if( [[UIApplication sharedApplication] canOpenURL:url] ) {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:)]) {
            isSuccess =   [[UIApplication sharedApplication] openURL:url];
        }
        else{
            if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                    isSuccess = success;
                }];
            }
        }
    }
    return isSuccess;
}


@end
