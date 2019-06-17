//
//  SONavigationView.h
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SONavButton.h"
#import "SOTools.h"

@protocol SONavigationViewDelegate <NSObject>
-(void)backBtnPressed:(SONavButton*)button;
@end


@interface SONavigationView : UIView
@property (nonatomic, strong) UIView *mLineView;
@property (nonatomic, copy) NSString *title;

//标题栏
@property (nonatomic, weak) UILabel *mTextLabel;


//左侧返回按钮。默认显示。
@property (nonatomic, strong ) SONavButton *mLeftButton;
@property (nonatomic, strong ) SONavButton *mRightButton;
@property (nonatomic, weak)  id<SONavigationViewDelegate> m_delegate;

-(id)initWithdelegate:(id)delegate;

-(void)setBackgroundColorClear;
- (void)setNavBackgroundColor:(UIColor *)backgroundColor;

@end
