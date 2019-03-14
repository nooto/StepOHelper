//
//  SOCustomAlertView.h
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import "SOBaseAlertView.h"
#import "SOUILabel.h"
@interface SOCustomAlertView : SOBaseAlertView

@property (nonatomic, strong, readonly) UILabel    *mTitleLabel;
@property (nonatomic, strong, readonly) UILabel    *mMessageLabel;
@property (nonatomic, strong, readonly) UIButton   *mLeftButton;
@property (nonatomic, strong, readonly) UIButton   *mRightButton;

- (id)initWithTitle:(NSString*)title message:(NSString*)message  leftButton:(NSString*)leftTitle rightButton:(NSString*)rightTitle;

@end
