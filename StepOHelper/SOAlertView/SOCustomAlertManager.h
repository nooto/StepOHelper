//
//  SOCustomAlertManager.h
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//



// Note:
/*
 该管理类对APP 中需要的弹出框做了全局的缓存，依次弹出展示。
 内部缓存数据按照 priority 优先级进行了排序，同时支持是否清除低层级的弹出框。
 */
#import <UIKit/UIKit.h>
#import "SOBaseAlertView.h"
#import "SOCustomAlertView.h"
#define  SOAlertManagerShareInstance [SOCustomAlertManager shareInstance]


@interface SOCustomAlertManager : NSObject
+ (instancetype)shareInstance;


////  V2 版本实现接口。
////************************************************************************************************************************************************
//
//- (SHCustomTextFieldAlertView*)CreateAlertTextFieldViewWithTitle:(NSString*)title
//                                                       textField:(NSString*)text
//                                                     placeholder:(NSString*)placeholder
//                                                      leftButton:(NSString*)leftTitle
//                                                     rightButton:(NSString*)rightTitle;


//V2. 版本中 修改内部记录方式，支持自定义view  通过返回 view 方式实现 全方位定制效果。
- (void)showAlertViewWithTitle:(NSString*)title
                       message:(NSString*)msg
                    leftButton:(NSString*)leftbtn
                   rightButton:(NSString*)rightBtn
                     completct:(void (^)(NSInteger selectIndex, NSString*title))complete;


//弹框。
- (SOCustomAlertView*)CreateAlertViewWithTitle:(NSString*)title
                                       message:(NSString*)msg
                                    leftButton:(NSString*)leftbtn
                                   rightButton:(NSString*)rightBtn
                                     completct:(void (^)(NSInteger selectIndex, NSString*title))complete;

- (void)showAlertView:(SOBaseAlertView*)alertView;
- (void)dismissAlertView:(SOBaseAlertView*)alertView;

/**
 取消当前的 alertview 弹框。不影响，队列中后续需要弹框的展示。
 */
- (void)dismissCurrentAlertView;

@end
