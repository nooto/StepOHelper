//
//  SOBaseAlertView.h
//  StepOHelperDemo
//
//  Created by GaoAng on 2019/3/14.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOColor+Font.h"

//弹框在队列中显示的优先级。
typedef NS_ENUM(NSInteger, SOAlertViewPriority) {
    SOShowPriorityVeryLow = -8L,
    SOShowPriorityLow = -4L,
    SOShowPriorityNormal = 0,
    SOShowPriorityHigh = 4,
    SOShowPriorityVeryHigh = 8
};

typedef NS_ENUM(NSInteger, SOAlertAnimationType) {
    SOAlertAnimate_FadeOut,
    SOAlertAnimate_Up,
    SOAlertAnimate_Down,
    SOAlertAnimate_Scale,
    SOAlertAnimate_None,
};

typedef NS_ENUM(NSInteger, SOButtondirection) {
    SOButtonLayout_vertical = 0,
    SOButtonLayout_Horizontal = 1,
};



@interface SOBaseAlertView : UIView

//对 subclass 公开的view  用于自定义显示内容。
@property (nonatomic, strong, readonly) UIView *mContentView;

/**
 *  动画效果  默认：SOAlertAnimate_FadeOut
 */
@property (nonatomic, assign) SOAlertAnimationType animationType;

@property (nonatomic, assign) SOButtondirection buttonLayout;

/**
 *  弹框类型  强制升级不允许其他框弹出，退出登录弹框需diss之前的弹框
 */
@property (nonatomic, assign) SOAlertViewPriority priority;

@property (nonatomic, assign)  BOOL  isDismissAfterSelected;//点击去确定取消收是否弹框消失。

@property (nonatomic, assign) BOOL isTouchBgDismiss; //  是否点击背景后 自动 dismiss 默认 NO。

@property (nonatomic, copy) void (^willShowAlertView)(void);

@property (nonatomic, copy) void (^willDismissAlertView)(void);

@property (nonatomic, copy) void (^didSelcectButtonAtIndexWithTitle)(NSInteger index, NSString *buttonText);


/**
 *  显示弹出框 回调方式
 */
- (void)showWithCompletionIndexAndTitle:(void (^)(NSInteger selectIndex, NSString*title))completeBlock;
//- (void)showWithCompletion:(void (^)(NSInteger selectIndex))completeBlock;


//显示弹出框  使用 delegate 方式进行处理。
- (void)show;

// 方便子类扩展，一般子类调用，在中间做些其它事情(比如扩展其它UI)
- (void)showWithActionBlock:(void (^)(void))actionBlock;

//手动
- (void)disMiss;

@end
