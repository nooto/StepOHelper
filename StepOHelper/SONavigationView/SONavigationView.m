//
//  SONavigationView.m
//  FDlna
//
//  Created by GaoAng on 2019/3/15.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import "SONavigationView.h"
#import "SOColor+Font.h"

@interface SONavigationView ()
@end

@implementation SONavigationView

-(id)initWithdelegate:(id)delegate{
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_W, NAVBAR_H)]) {
        self.m_delegate = delegate;
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.backgroundColor = UIColorFromHexString(@"#1EBBFD");//Color_BackGround;
    self.userInteractionEnabled = YES;
    CGFloat btnWidht = 44;
    CGFloat gap = 0.f;

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(gap, CGRectGetMaxY(self.frame) - btnWidht, CGRectGetWidth(self.frame)/2, btnWidht)];
    [self addSubview:titleLabel];
    titleLabel.center = CGPointMake(SCREEN_W/2, titleLabel.center.y);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    self.mTextLabel = titleLabel;
    
    SONavButton* leftButton =  [[SONavButton alloc] initWithFrame:CGRectMake(gap, CGRectGetMaxY(self.frame) - btnWidht, btnWidht, btnWidht)];
    [leftButton setImage:[UIImage imageNamed:@"back_icon_white"] forState:UIControlStateNormal];
//    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButonAction:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.titleLabel.font = _mTextLabel.font;
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self addSubview:leftButton];
    self.mLeftButton = leftButton;
    
    
    SONavButton* rightButton =  [[SONavButton alloc] initWithFrame:CGRectMake(SCREEN_W -  gap - btnWidht, CGRectGetMaxY(self.frame) - btnWidht, btnWidht, btnWidht)];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    rightButton.titleLabel.font = _mTextLabel.font;
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self addSubview:rightButton];
    self.mRightButton = rightButton;

    UIView *mline = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 1.0f, SCREEN_W, 1.0f)];
    mline.backgroundColor = [UIColor lightGrayColor];
    mline.hidden = YES;
    [self addSubview:mline];
    self.mLineView = mline;
}

- (void)setNavBackgroundColor:(UIColor *)backgroundColor{
    self.backgroundColor = backgroundColor;
}

-(void)setBackgroundColorClear{
    self.backgroundColor = [UIColor clearColor];
    self.layer.shadowPath = nil;
    [self.mTextLabel setTextColor:[UIColor whiteColor]];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    [self.mTextLabel setText:title];
//    self.mTextLabel.center = CGPointMake(SCREEN_W/2, self.mTextLabel.center.y);
}
-(void)leftButonAction:(SONavButton*)sender{
    if (_m_delegate && [_m_delegate respondsToSelector:@selector(backBtnPressed:)]) {
        [_m_delegate backBtnPressed:sender];
    }
}

@end
