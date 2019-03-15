//
//  SOCustomAlertView.m
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import "SOCustomAlertView.h"

@interface SOCustomAlertView ()

@property (nonatomic, strong) UILabel    *mMessageLabel;
@property (nonatomic, assign) CGFloat gapWidth;
@property (nonatomic, assign) CGFloat  alpha;

@end

@implementation SOCustomAlertView

- (id)initWithTitle:(NSString*)title message:(NSString*)message  leftButton:(NSString*)leftTitle rightButton:(NSString*)rightTitle{
    
    if (self = [super initWithFrame:CGRectZero]) {
        [self.mTitleLabel setText:title];
        [self.mMessageLabel setText:message];
        [self.mLeftButton setTitle:leftTitle forState:UIControlStateNormal];
        [self.mRightButton setTitle:rightTitle forState:UIControlStateNormal];
        self.gapWidth = 35;
        [self setupAlertView];
    }
    return self;
}

- (void)setupAlertView{
    //标题
    [self.mContentView addSubview:self.mTitleLabel];
    
    //消息。
    [self.mContentView addSubview:self.mMessageLabel];
    [self.mContentView addSubview:self.mLeftButton];
    [self.mContentView addSubview:self.mRightButton];
    self.mLeftButton.hidden = self.mRightButton.hidden = NO;
    [self.mMessageLabel setTextAlignment:NSTextAlignmentLeft];
    [self.mMessageLabel adjustLabelHeight];
    
    CGFloat  gapY = self.gapWidth;
    //垂直布局。
    if (self.buttonLayout == SOButtonLayout_vertical) {
        //两个按钮。
        //CGFloat buttonWidht = (CGRectGetWidth(self.mContentView.frame) -  self.gapWidth*3)/2;
        if (self.mLeftButton.titleLabel.text.length >0 && self.mRightButton.titleLabel.text.length > 0) {
            self.mLeftButton.hidden = self.mRightButton.hidden = NO;
            self.mLeftButton.tag = 0;
            self.mRightButton.tag = 1;
            [self.mLeftButton setFrame:CGRectMake(self.gapWidth, CGRectGetMaxY(self.mMessageLabel.frame) + self.gapWidth, CGRectGetWidth(self.mContentView.frame) - self.gapWidth *2, 42)];
            [self.mRightButton setFrame:CGRectMake(self.gapWidth, CGRectGetMaxY(self.mLeftButton.frame) + self.gapWidth/3, CGRectGetWidth(self.mContentView.frame) - self.gapWidth *2, 42)];
            CGRect frame = self.mContentView.frame;
            frame.size.height = CGRectGetMaxY(self.mRightButton.frame) + self.gapWidth/2;
            self.mContentView.frame = frame;
        }
        else{
            //
            UIButton *onlyButton = nil;
            if (self.mLeftButton.titleLabel.text.length > 0) {
                onlyButton = self.mLeftButton;
                self.mRightButton.hidden = YES;
            }
            else{
                if (self.mRightButton.titleLabel.text.length > 0) {
                    onlyButton = self.mLeftButton;
                    [self.mLeftButton setTitle:self.mRightButton.titleLabel.text forState:UIControlStateNormal];
                    self.mRightButton.hidden  = YES;
                }
            }
            onlyButton.tag = 0;
            [onlyButton setFrame:CGRectMake(self.gapWidth, CGRectGetMaxY(self.mMessageLabel.frame) + self.gapWidth, CGRectGetWidth(self.mContentView.frame) - self.gapWidth *2, 42)];
            CGRect frame = self.mContentView.frame;
            frame.size.height = CGRectGetMaxY(onlyButton.frame) + self.gapWidth;
            self.mContentView.frame = frame;
        }
    }
    else{
        //两个按钮。
        CGFloat buttonWidht = (CGRectGetWidth(self.mContentView.frame) -  self.gapWidth*3)/2;
        if (self.mLeftButton.titleLabel.text.length >0 && self.mRightButton.titleLabel.text.length > 0) {
            self.mLeftButton.hidden = self.mRightButton.hidden = NO;
            self.mLeftButton.tag = 0;
            self.mRightButton.tag = 1;
            
            [self.mLeftButton setFrame:CGRectMake(self.gapWidth, CGRectGetMaxY(self.mMessageLabel.frame) + gapY, buttonWidht, 42)];
            [self.mRightButton setFrame:CGRectMake(CGRectGetMaxX(self.mLeftButton.frame)+ self.gapWidth, CGRectGetMinY(self.mLeftButton.frame), CGRectGetWidth(self.mLeftButton.frame), CGRectGetHeight(self.mLeftButton.frame))];
            
            CGRect frame = self.mContentView.frame;
            frame.size.height = CGRectGetMaxY(self.mRightButton.frame) + 18;
            self.mContentView.frame = frame;
        }
        else{
            //
            UIButton *onlyButton = nil;
            if (self.mLeftButton.titleLabel.text.length > 0) {
                onlyButton = self.mLeftButton;
                self.mRightButton.hidden = YES;
            }
            else{
                if (self.mRightButton.titleLabel.text.length > 0) {
                    onlyButton = self.mRightButton;
                    self.mLeftButton.hidden  = YES;
                }
            }
            onlyButton.tag = 0;
            [onlyButton setFrame:CGRectMake(CGRectGetWidth(self.mContentView.frame) /2 -  buttonWidht/2, CGRectGetMaxY(self.mMessageLabel.frame) + gapY, buttonWidht, 42)];
            CGRect frame = self.mContentView.frame;
            frame.size.height = CGRectGetMaxY(onlyButton.frame) + 18;
            self.mContentView.frame = frame;
        }
    }
    
    [self.mLeftButton layoutIfNeeded];
    [self.mRightButton layoutIfNeeded];
    self.mLeftButton.layer.cornerRadius = CGRectGetHeight(self.mLeftButton.frame)/2;
    self.mRightButton.layer.cornerRadius = CGRectGetHeight(self.mRightButton.frame)/2;
    
    
}

- (void)show{
    [self setupAlertView];
    [super show];
}


#pragma mark -
- (void)buttonAction:(UIButton*)sender{
    if (self.didSelcectButtonAtIndexWithTitle) {
        self.didSelcectButtonAtIndexWithTitle(sender.tag, sender.titleLabel.text);
    }
    if (self.isDismissAfterSelected) {
        [self disMiss];
    }
}

#pragma mark -
- (UILabel*)mMessageLabel{
    if (!_mMessageLabel) {
        //信息
        _mMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.gapWidth), CGRectGetMaxY(self.mTitleLabel.frame) + 16 , CGRectGetWidth(self.mContentView.frame)-  (self.gapWidth)*2, 100)];
        _mMessageLabel.font = kPingfangMediumFont(15);
        _mMessageLabel.textColor = UIColorFromHexString(@"#A4A9AF");
    }
    return _mMessageLabel;
}


@end

