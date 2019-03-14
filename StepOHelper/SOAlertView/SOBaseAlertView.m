//
//  SOBaseAlertView.m
//  StepOHelperDemo
//
//  Created by GaoAng on 2019/3/14.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import "SOBaseAlertView.h"

@interface SOBaseAlertView()

@property (nonatomic, strong) UIView     *mBgView;
@property (nonatomic, strong) UIView     *mContentView;
@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, assign) CGFloat gapWidth;
@property (nonatomic, assign) CGFloat  alpha;

@end



@implementation SOBaseAlertView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)]) {
        self.gapWidth = 35;
        self.duration = 0.35f;
        self.isDismissAfterSelected = YES;
        self.alpha = 0.4f;
        self.isTouchBgDismiss = NO;
        self.animationType = SOAlertAnimate_FadeOut;//
        self.tag = [[NSDate date] timeIntervalSince1970] * 1000;
        // self.isKeepButtonWidth = YES;
        [self setupBaseUI];
    }
    return self;
}

- (void)setupBaseUI{
    //大背景
    [self addSubview:self.mBgView];
    
    //内容背景
    [self addSubview:self.mContentView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if (self.isTouchBgDismiss) {
        [self disMiss];
    }
}

- (void)showWithCompletionIndexAndTitle:(void (^)(NSInteger, NSString *))completeBlock{
    [self show];
    [self setDidSelcectButtonAtIndexWithTitle:completeBlock];
}

- (void)showWithActionBlock:(void (^)(void))actionBlock{
    [self setupBaseUI];
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
    if (self.willShowAlertView) {
        self.willShowAlertView();
    }
    
    CGFloat  centerY_Scale = 0.45f;
    
    self.mBgView.alpha = 0.0f;
    switch (self.animationType) {
        case SOAlertAnimate_Down:{
            _mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)+CGRectGetHeight(_mContentView.frame)/2);
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = self.alpha;
                self.mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame) * centerY_Scale);
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case SOAlertAnimate_Up:{
            _mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, - CGRectGetHeight(_mContentView.frame)/2);
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = self.alpha;
                self.mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame) *  centerY_Scale);
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case SOAlertAnimate_FadeOut:{
            _mContentView.alpha = 0.0f;
            _mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame) *  centerY_Scale);
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = self.alpha;
                self.mContentView.alpha = 1.0f;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case SOAlertAnimate_Scale:{
            _mContentView.alpha = 1.0f;
            _mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame) *  centerY_Scale);
            self.mContentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = self.alpha;
                self.mContentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case SOAlertAnimate_None:{
            self.mBgView.alpha = self.alpha;
            self.mContentView.alpha =1.0f;
            self.mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame) *  centerY_Scale);
        }
            break;
            
        default:
            break;
    }
}

- (void)show
{
    [self showWithActionBlock:nil];
}

- (void)disMiss{
    if (self.willDismissAlertView) {
        self.willDismissAlertView();
    }
    switch (self.animationType) {
        case SOAlertAnimate_Down:{
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = 0.0f;
                self.mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)+CGRectGetHeight(self.mContentView.frame)/2);
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
            
        }
            break;
            
        case SOAlertAnimate_Up:{
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = 0.0f;
                self.mContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, - CGRectGetHeight(self.mContentView.frame)/2);
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
            
        }
            break;
            
        case SOAlertAnimate_FadeOut:{
            _mContentView.alpha = 1.0f;
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = 0.0f;
                self.mContentView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
            
        }
            break;
            
        case SOAlertAnimate_Scale:{
            _mContentView.alpha = 1.0f;
            self.mContentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            [UIView animateWithDuration:_duration animations:^{
                self.mBgView.alpha = 0.0f;
                self.mContentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
            
        case SOAlertAnimate_None:{
            [self removeFromSuperview];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -
- (UIView*)mBgView{
    if (!_mBgView) {
        _mBgView = [[UIView alloc] initWithFrame:self.bounds];
        _mBgView.backgroundColor = [UIColor blackColor];
    }
    return _mBgView;
}

- (UIView*)mContentView{
    if (!_mContentView) {
        //内容背景
        CGFloat widht  = CGRectGetWidth(self.bounds) -  (self.gapWidth)*2;
        _mContentView = [[UIView alloc] initWithFrame:CGRectMake(self.gapWidth, CGRectGetHeight(self.bounds), widht, 40)];
        _mContentView.backgroundColor = [UIColor whiteColor];
        _mContentView.layer.cornerRadius = 8.f;
        _mContentView.layer.borderColor = kLightGreyColor.CGColor;
        _mContentView.layer.borderWidth = 0.5F;
        
    }
    return _mContentView;
}

@end

