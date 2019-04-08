//
//  UIDevice+SO
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import "UIDevice+SO.h"
#import <UIKit/UIKit.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <CoreFoundation/CoreFoundation.h>
#import <sys/utsname.h>
#import <mach/vm_statistics.h>
#import <mach/message.h>
#import <mach/mach.h>
#import <sys/socket.h>
#import <arpa/inet.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <ifaddrs.h>
#import <objc/runtime.h>

@implementation UIDevice (StepO)

#pragma mark -  屏幕宽度
+ (CGFloat)getDeviceScreenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

#pragma mark -  屏幕高度
+ (CGFloat)getDeviceScreenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

//+ (NSString *)deviceUUID{
//    NSString * uuid = [SHKeyChainWapper loadPassWordDataWithIdentifier:@"egDeviceUUID" accessGroup:nil];
//    if (!uuid) {
//        uuid = UIDevice.currentDevice.identifierForVendor.UUIDString;
//        [SHKeyChainWapper savePassWordDataWithdIdentifier:@"egDeviceUUID" data:uuid accessGroup:nil];
//    }
//    return uuid;
//}

+ (BOOL)isJailbroken
{
    NSString *cydiaPath = @"/Applications/Cydia.app";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        return YES;
    }
    
    /* apt */
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        return YES;
    }
    
    return NO;
}

#pragma mark - 设备名字
+ (NSUInteger)getSysInfo:(uint)typeSpecifier {
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

#pragma mark - sysctlbyname utils

+ (NSString *)getSysInfoByName:(char *)typeSpecifier {
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding:NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

#pragma mark - Max socket buffer size

+ (NSUInteger)maxSocketBufferSize {
    return [self getSysInfo:KIPC_MAXSOCKBUF];
}

#pragma mark - Extensions

+ (NSString *)platform {
    return [self getSysInfoByName:"hw.machine"];
}

+ (BOOL)isIPhoneX{
#if TARGET_IPHONE_SIMULATOR
    return [[UIScreen mainScreen] bounds].size.width >= 375 && [[UIScreen mainScreen] bounds].size.height >= 812;
#else
    UIDevicePlatform platform = [self platformType];
    return platform == UIDevicePlatformiPhoneX ||
    platform == UIDevicePlatformiPhoneXR ||
    platform == UIDevicePlatformiPhoneXSM ||
    platform == UIDevicePlatformiPhoneXS ;
#endif
}

+ (UIDevicePlatform)platformType {
    NSString *platform = [self platform];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return UIDevicePlatformiPhoneA1203;
    if ([platform isEqualToString:@"iPhone1,2"]) return UIDevicePlatformiPhone3G;
    if ([platform isEqualToString:@"iPhone2,1"]) return UIDevicePlatformiPhone3GS;
    if ([platform isEqualToString:@"iPhone3,1"]) return UIDevicePlatformiPhone4A1332;
    if ([platform isEqualToString:@"iPhone3,2"]) return UIDevicePlatformiPhone4A1332;
    if ([platform isEqualToString:@"iPhone3,3"]) return UIDevicePlatformiPhone4A1349;
    if ([platform isEqualToString:@"iPhone4,1"]) return UIDevicePlatformiPhone4S;
    if ([platform isEqualToString:@"iPhone5,1"]) return UIDevicePlatformiPhone5A1428;
    if ([platform isEqualToString:@"iPhone5,2"]) return UIDevicePlatformiPhone5;
    if ([platform isEqualToString:@"iPhone5,3"]) return UIDevicePlatformiPhone5CA1456;
    if ([platform isEqualToString:@"iPhone5,4"]) return UIDevicePlatformiPhone5C;
    if ([platform isEqualToString:@"iPhone6,1"]) return UIDevicePlatformiPhone5SA1453;
    if ([platform isEqualToString:@"iPhone6,2"]) return UIDevicePlatformiPhone5S;
    if ([platform isEqualToString:@"iPhone7,1"]) return UIDevicePlatformiPhone6Plus;
    if ([platform isEqualToString:@"iPhone7,2"]) return UIDevicePlatformiPhone6;
    if ([platform isEqualToString:@"iPhone8,1"]) return UIDevicePlatformiPhone6S;
    if ([platform isEqualToString:@"iPhone8,2"]) return UIDevicePlatformiPhone6SPlus;
    if ([platform isEqualToString:@"iPhone8,4"]) return UIDevicePlatformiPhoneSE;
    if ([platform isEqualToString:@"iPhone9,1"]) return UIDevicePlatformiPhone7;
    if ([platform isEqualToString:@"iPhone9,2"]) return UIDevicePlatformiPhone7Plus;
    if ([platform isEqualToString:@"iPhone10,1"]) return UIDevicePlatformiPhone8;
    if ([platform isEqualToString:@"iPhone10,4"]) return UIDevicePlatformiPhone8;
    if ([platform isEqualToString:@"iPhone10,2"]) return UIDevicePlatformiPhone7Plus;
    if ([platform isEqualToString:@"iPhone10,5"]) return UIDevicePlatformiPhone7Plus;
    if ([platform isEqualToString:@"iPhone10,3"]) return UIDevicePlatformiPhoneX;
    if ([platform isEqualToString:@"iPhone10,6"]) return UIDevicePlatformiPhoneX;
    
    if ([platform isEqualToString:@"iPhone11,2"]) return UIDevicePlatformiPhoneXS;
    if ([platform isEqualToString:@"iPhone11,8"]) return UIDevicePlatformiPhoneXR;
    if ([platform isEqualToString:@"iPhone11,4"]) return UIDevicePlatformiPhoneXSM;
    if ([platform isEqualToString:@"iPhone11,6"]) return UIDevicePlatformiPhoneXSM;
    

    if ([platform isEqualToString:@"i386"]) {
        BOOL smallerScreen = [[UIScreen mainScreen] bounds].size.width < 768;
        return smallerScreen ? UIDevicePlatformiPhone32bitSimulator : UIDevicePlatformiPad32bitSimulator;
    }
    if ([platform isEqualToString:@"x86_64"]) {
        BOOL smallerScreen = [[UIScreen mainScreen] bounds].size.width < 768;
        return smallerScreen ? UIDevicePlatformiPhone64bitSimulator : UIDevicePlatformiPad64bitSimulator;
    }
    // iFPGA Device
    if ([platform isEqualToString:@"iFPGA"]) return UIDeviceIFPGA;
    // Unknown
    return UIDevicePlatformUnknown;
}

+ (NSString *)platformString {
    NSString *platform = [self platform];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G(A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5C (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5C (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5S (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5S (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524/A1593)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586/A1589)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6S (A1633/A1688/A1691/A1700)";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6S Plus (A1634/A1687/A1690/A1699)";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE (A1662/A1723/A1724)";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7 (A1660/A1778/A1779)";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus (A1661/A1784/A1785)";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8 (A1863/A1906)";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8 (A1905)";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus (A1864/A1898)";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus (A1897)";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X (A1865/A1902)";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X (A1901)";
    if ([platform isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
   
    
    if ([platform isEqualToString:@"i386"]) {
        BOOL smallerScreen = [[UIScreen mainScreen] bounds].size.width < 768;
        return smallerScreen ? @"32-bit iPhone Simulator" : @"32-bit iPad Simulator";
    }
    if ([platform isEqualToString:@"x86_64"]) {
        BOOL smallerScreen = [[UIScreen mainScreen] bounds].size.width < 768;
        return smallerScreen ? @"64-bit iPhone Simulator" : @"64-bit iPad Simulator";
    }
    // iFPGA Device
    if ([platform isEqualToString:@"iFPGA"]) return @"iFPGA Device";
    // Unknown
    return platform;
}

+ (NSString *)hardwareModel {
    return [self getSysInfoByName:"hw.model"];
}

+ (NSUInteger)CPUFrequency {
    return [self getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)CPUCount {
    return [self getSysInfo:HW_NCPU];
}

+ (float)CPUUsage {
    kern_return_t kr;
    task_info_data_t tinfo;
    mach_msg_type_number_t task_info_count;
    
    task_info_count = TASK_INFO_MAX;
    kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    
    //    task_basic_info_t      basic_info;
    thread_array_t         thread_list;
    mach_msg_type_number_t thread_count;
    
    thread_info_data_t     thinfo;
    mach_msg_type_number_t thread_info_count;
    
    thread_basic_info_t basic_info_th;
    //    uint32_t stat_thread = 0; // Mach threads
    
    //    basic_info = (task_basic_info_t)tinfo;
    
    // get threads in the task
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    //    if (thread_count > 0)
    //        stat_thread += thread_count;
    
    long tot_sec = 0;
    long tot_usec = 0;
    float tot_cpu = 0;
    int j;
    
    for (j = 0; j < (int)thread_count; j++) {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j], THREAD_BASIC_INFO,
                         (thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        
        basic_info_th = (thread_basic_info_t)thinfo;
        
        if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
            tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
            tot_usec = tot_usec + basic_info_th->user_time.microseconds + basic_info_th->system_time.microseconds;
            tot_cpu = tot_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE * 100.0;
        }
        
    } // for each thread
    
    kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    assert(kr == KERN_SUCCESS);
    
    return tot_cpu;
}

+ (NSUInteger)BUSFrequency {
    return [self getSysInfo:HW_BUS_FREQ];
}

+ (NSUInteger)totalMemory {
    return [self getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)userMemory {
    return [self getSysInfo:HW_USERMEM];
}

+ (double)availableMemory {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    return ((vm_page_size * vmStats.free_count)/1024.0)/1024.0;
}

+ (double)usedMemory {
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    return taskInfo.resident_size/1024.0/1024.0;
}

+ (NSString *)totalDiskSpace {
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    CGFloat sizeInBytes = [fattributes[NSFileSystemSize] floatValue];
    if (sizeInBytes > pow(2, 30)) {
        return [NSString stringWithFormat:@"%0.2fGB", sizeInBytes / pow(2, 30)];
    } else if (sizeInBytes > pow(2, 20)) {
        return [NSString stringWithFormat:@"%0.2fMB", sizeInBytes / pow(2, 20)];
    } else if (sizeInBytes > pow(2, 10)) {
        return [NSString stringWithFormat:@"%0.2fKB", sizeInBytes / pow(2, 10)];
    } else {
        return [NSString stringWithFormat:@"%0.2fB", sizeInBytes];
    }
}

+ (NSString *)freeDiskSpace {
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    CGFloat sizeInBytes = [fattributes[NSFileSystemFreeSize] floatValue];
    if (sizeInBytes > pow(2, 30)) {
        return [NSString stringWithFormat:@"%0.2fGB", sizeInBytes / pow(2, 30)];
    } else if (sizeInBytes > pow(2, 20)) {
        return [NSString stringWithFormat:@"%0.2fMB", sizeInBytes / pow(2, 20)];
    } else if (sizeInBytes > pow(2, 10)) {
        return [NSString stringWithFormat:@"%0.2fKB", sizeInBytes / pow(2, 10)];
    } else {
        return [NSString stringWithFormat:@"%0.2fB", sizeInBytes];
    }
}

// Actually, MAC address of device
- (NSString *)deviceAddress {
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Error: Memory allocation error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2\n");
        free(buf); // Thanks, Remy "Psy" Demerest
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    free(buf);
    return outstring;
}

+ (NSDictionary *)Wi_FiInfo {
    NSString *ssid = @"";
    NSString *bssid = @"";
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    NSDictionary *info;
    if ([ifs count] > 0) {
        for (NSString *ifname in ifs) {
            info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifname);
            
            NSString *ssidKey =  (__bridge_transfer NSString *)kCNNetworkInfoKeySSID;
            NSString *bssidKey = (__bridge_transfer NSString *)kCNNetworkInfoKeyBSSID;
            if (info) {
                ssid = info[ssidKey];
                bssid = info[bssidKey];
            }
        }
    }
    
    if (bssid.length > 0) {
        NSArray *components = [bssid componentsSeparatedByString:@":"];
        NSString *rawString = @"";
        for (NSString *component in components) {
            NSString *tempString = component;
            if (component.length == 1) {
                tempString = [NSString stringWithFormat:@"0%@", component];
            }
            
            if (rawString.length < 1) {
                rawString = [rawString stringByAppendingFormat:@"%@", tempString];
            } else {
                rawString = [rawString stringByAppendingFormat:@":%@", tempString];
            }
        }
        bssid = rawString;
    } else {
        bssid = @"";
    }
    bssid = [UIDevice standardFormateMAC:bssid];
    
    return @{@"SSID":ssid ? : @"", @"BSSID":bssid};
}
+ (NSString *)Wi_FiSSID {
    NSDictionary *dict = [UIDevice Wi_FiInfo];
    NSString *ssid=  dict[@"SSID"];
    if ([ssid isKindOfClass:[NSString class]]) {
        return ssid;
    }
    return nil;
}

+ (NSString *)standardFormateMAC:(NSString *)MAC {
    NSArray *subStr = [MAC componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":-"]];
    NSMutableArray *subStr_M = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSString *str in subStr) {
        if (1 == str.length) {
            NSString *tmpStr = [NSString stringWithFormat:@"0%@", str];
            [subStr_M addObject:tmpStr];
        } else {
            [subStr_M addObject:str];
        }
    }
    
    NSString *formateMAC = [subStr_M componentsJoinedByString:@":"];
    return [formateMAC lowercaseString];
}

#pragma mark - Get device IP address

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

+ (NSString *)deviceIPAddress:(BOOL)preferIPv4 {
    NSArray *searchArray = preferIPv4 ? @[IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6] : @[IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4];
    
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        address = addresses[key];
        if ([self isValidatIP:address]) {
            *stop = YES;
        }
    }];
    return address ? address : @"0.0.0.0";
}

+ (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result = [ipAddress substringWithRange:resultRange];
            //输出结果
            NSLog(@"%@",result);
            return YES;
        }
    }
    return NO;
}

+ (NSDictionary *)getIPAddresses {
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if (!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for (interface=interfaces; interface; interface=interface->ifa_next) {
            if (!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if (addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if (type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

#pragma mark - Get gateway IP address

+ (NSString *)gatewayIPAddress {
//#if TARGET_IPHONE_SIMULATOR
    return @"Simulator";
//#else
    
//    NSString *address = nil;
//
//    int mib[] = {CTL_NET, PF_ROUTE, 0, AF_INET, NET_RT_FLAGS, RTF_GATEWAY};
//    size_t ll;
//
//    if (sysctl(mib, sizeof(mib) / sizeof(int), 0, &ll, 0, 0) < 0) {
//        address = @"192.168.0.1";
//    }
//
//    if(ll > 0) {
//        char *buffer, *pointer;
//        buffer = malloc(ll);
//        if (sysctl(mib, sizeof(mib) / sizeof(int), buffer, &ll, 0, 0) < 0) {
//            address = @"192.168.0.1";
//        }
//
//        struct rt_msghdr *rt;
//        struct sockaddr *sa, *sa_tab[RTAX_MAX];
//
//        for (pointer = buffer; pointer < buffer+ll; pointer += rt->rtm_msglen) {
//            rt = (struct rt_msghdr *)pointer;
//            sa = (struct sockaddr *)(rt + 1);
//            for(int index = 0; index < RTAX_MAX; index++) {
//                if(rt->rtm_addrs & (1 << index)) {
//                    sa_tab[index] = sa;
//                    sa = (struct sockaddr *)((char *)sa + (int)ceil(sa->sa_len));
//                } else {
//                    sa_tab[index] = NULL;
//                }
//            }
//
//            if (((rt->rtm_addrs & (RTA_DST | RTA_GATEWAY)) == (RTA_DST | RTA_GATEWAY))
//                && sa_tab[RTAX_DST]->sa_family == AF_INET
//                && sa_tab[RTAX_GATEWAY]->sa_family == AF_INET) {
//                unsigned char octet[4]  = {0,0,0,0};
//                for (int index = 0; index < 4; index++){
//                    octet[index] = (((struct sockaddr_in *)(sa_tab[RTAX_GATEWAY]))->sin_addr.s_addr >> (index * 8)) & 0xFF;
//                }
//                if (((struct sockaddr_in *)sa_tab[RTAX_DST])->sin_addr.s_addr == 0) {
//                    in_addr_t addr = ((struct sockaddr_in *)(sa_tab[RTAX_GATEWAY]))->sin_addr.s_addr;
//                    address = [NSString stringWithFormat:@"%s", inet_ntoa(*((struct in_addr*)&addr))];
//                    break;
//                }
//            }
//        }
//        free(buffer);
//    }
//
//    return address;
//#endif
}

+ (BOOL)isRetinaDisplayer {
    return ([UIScreen mainScreen].scale == 2.0f);
}




#pragma mark -  获取iPhone名称
+ (NSString *)getiPhoneName {
    return [UIDevice currentDevice].name;
}

#pragma mark -  是否开启了热点
+ (BOOL)isOpenHotspot
{
    BOOL isHotspot = false;
    
    if ([self isIPhoneX]) {
        isHotspot = (([UIApplication sharedApplication].statusBarFrame.size.height - 44) == 20);
    }
    else{
        isHotspot = (([UIApplication sharedApplication].statusBarFrame.size.height - 20) == 20);
    }
    
    return isHotspot;
}


#pragma mark -  获取电池电量
+ (CGFloat)getBatteryLevel {
    return [UIDevice currentDevice].batteryLevel;
}

#pragma mark -  当前系统名称
+ (NSString *)getSystemName {
    return [UIDevice currentDevice].systemName;
}

#pragma mark -  当前系统版本号
+ (NSString *)getSystemVersion {
    return [UIDevice currentDevice].systemVersion;
}

#pragma mark -  通用唯一识别码UUID
+ (NSString *)getUUID {
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}


#pragma mark -  获取当前设备IP
+ (NSString *)getDeviceIPAdress {
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) { // 0 表示获取成功
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}


#pragma mark -  获取总内存大小
+ (long long)getTotalMemorySize {
    return [NSProcessInfo processInfo].physicalMemory;
}


#pragma mark - 获取当前可用内存
+ (long long)getAvailableMemorySize {
    
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if (kernReturn != KERN_SUCCESS)
    {
        return NSNotFound;
    }
    
    return ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count));
}


#pragma mark -  获取精准电池电量
+ (CGFloat)getCurrentBatteryLevel {
    UIApplication *app = [UIApplication sharedApplication];
    if (app.applicationState == UIApplicationStateActive||app.applicationState==UIApplicationStateInactive) {
        Ivar ivar=  class_getInstanceVariable([app class],"_statusBar");
        id status  = object_getIvar(app, ivar);
        for (id aview in [status subviews]) {
            int batteryLevel = 0;
            for (id bview in [aview subviews]) {
                if ([NSStringFromClass([bview class]) caseInsensitiveCompare:@"UIStatusBarBatteryItemView"] == NSOrderedSame&&[[[UIDevice currentDevice] systemVersion] floatValue] >=6.0) {
                    Ivar ivar=  class_getInstanceVariable([bview class],"_capacity");
                    if(ivar) {
                        batteryLevel = ((int (*)(id, Ivar))object_getIvar)(bview, ivar);
                        if (batteryLevel > 0 && batteryLevel <= 100) {
                            return batteryLevel;
                        } else {
                            return 0;
                        }
                    }
                }
            }
        }
    }
    return 0;
}


#pragma mark -  获取电池当前的状态，共有4种状态
+ (NSString *)getBatteryState {
    UIDevice *device = [UIDevice currentDevice];
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return @"UnKnow";
    } else if (device.batteryState == UIDeviceBatteryStateUnplugged){
        return @"Unplugged";
    } else if (device.batteryState == UIDeviceBatteryStateCharging){
        return @"Charging";
    } else if (device.batteryState == UIDeviceBatteryStateFull){
        return @"Full";
    }
    return nil;
}

#pragma mark -  获取当前语言
+ (NSString *)getDeviceLanguage {
    NSArray *languageArray = [NSLocale preferredLanguages];
    return [languageArray objectAtIndex:0];
}

#pragma mark - 获取 mac 地址
+ (NSString *)getMacAddress {
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        NSLog(@"Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        NSLog(@"Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        NSLog(@"Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        NSLog(@"Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return [outstring uppercaseString];
}

#pragma mark - 获取当 wifi 名称
+ ( NSString* )getWifiName{
    
    NSString *ssid = nil;
    NSArray *ifs = (__bridge   id)CNCopySupportedInterfaces();
    for (NSString *ifname in ifs) {
        NSDictionary *info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifname);
        if (info[@"SSID"])
        {
            ssid = info[@"SSID"];
        }
    }
    return ssid;
}



@end
