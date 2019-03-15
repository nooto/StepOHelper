//
//  SOCustomAlertView.h
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import "SOBaseAlertView.h"
#import "SOUILabel.h"
@interface SOCustomAlertView : SOBaseAlertView

@property (nonatomic, strong, readonly) UILabel    *mMessageLabel;

- (id)initWithTitle:(NSString*)title message:(NSString*)message  leftButton:(NSString*)leftTitle rightButton:(NSString*)rightTitle;

@end
