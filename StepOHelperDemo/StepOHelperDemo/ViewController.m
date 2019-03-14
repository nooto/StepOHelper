//
//  ViewController.m
//  StepOHelperDemo
//
//  Created by GaoAng on 2019/3/14.
//  Copyright © 2019年 Self.work. All rights reserved.
//

#import "ViewController.h"
#import <StepOHelper/SOCustomAlertView.h>
#import  <StepOHelper/SOCustomAlertManager.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)ShowButtonAction:(id)sender {
    [SOAlertManagerShareInstance showAlertViewWithTitle:@"提示细腻的标题" message:@"细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻细腻" leftButton:@"细腻细腻细腻细腻细腻细腻细腻细腻" rightButton:@"细腻细腻细腻细腻细腻" completct:^(NSInteger selectIndex, NSString *title) {
        
    }];
}

@end
