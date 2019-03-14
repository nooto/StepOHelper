//
//  SOCustomAlertManager.m
//  StepOHelper
//
//  Created by GaoAng on 2019/3/14.
//

#import "SOCustomAlertManager.h"
#import "SOCustomerAlertView/SOCustomAlertView.h"

@interface SOCustomAlertManager ()

@property (nonatomic,strong) NSMutableArray *mNeedShowViews;

@property (nonatomic, weak) SOBaseAlertView    *mCurrentView;

@end


@implementation SOCustomAlertManager
+ (instancetype)shareInstance
{
    static SOCustomAlertManager *develop = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        develop = [[SOCustomAlertManager alloc] init];
    });
    return develop;
}

- (id)init{
    if (self = [super init]) {
        self.mCurrentView = nil;
        //        self.curShowViewIndex = -1;
    }
    return self;
}


//注释 同上
- (void)showAlertViewWithTitle:(NSString*)title
                       message:(NSString*)msg
                    leftButton:(NSString*)leftbtn
                   rightButton:(NSString*)rightBtn
                     completct:(void (^)(NSInteger selectIndex, NSString*title))complete{
    SOCustomAlertView *alertView = [[SOCustomAlertView alloc] initWithTitle:title message:msg leftButton:leftbtn rightButton:rightBtn];
    [alertView setDidSelcectButtonAtIndexWithTitle:complete];
    [self showAlertView:alertView];
}

- (void)dismissCurrentAlertView{
    //隐藏当前的数据。
    if (self.mCurrentView ) {
        [self.mCurrentView setWillDismissAlertView:nil];
        [self.mCurrentView disMiss];
        [self.mNeedShowViews removeObject:self.mCurrentView];
        self.mCurrentView = nil;
    }
    
    [self showAlertView:self.mNeedShowViews.firstObject];
}

- (void)dismissAlertView:(SOBaseAlertView*)alertView{
    
    if (alertView.tag == self.mCurrentView.tag) {
        [self dismissCurrentAlertView];
    }
    else{
        if ([self.mNeedShowViews containsObject:alertView]) {
            [self.mNeedShowViews removeObject:alertView];
        }
    }
}


- (BOOL)isContainSourceOnly{
//    for (NSInteger i = 0; i < self.mNeedShowViews.count; i ++) {
//        SOBaseAlertView *baseView = [self.mNeedShowViews objectAtIndex:i];
//        if (baseView.sourceType == SHAlertViewSourceOnly) {
//            return YES;;
//        }
//    }
//
    return NO;
}


#pragma mark - 核心功能
- (SOCustomAlertView*)CreateAlertViewWithTitle:(NSString*)title
                                       message:(NSString*)msg
                                    leftButton:(NSString*)leftbtn
                                   rightButton:(NSString*)rightBtn
                                     completct:(void (^)(NSInteger, NSString *))complete{
    SOCustomAlertView *alertView = [[SOCustomAlertView alloc] initWithTitle:title message:msg leftButton:leftbtn rightButton:rightBtn];
    [alertView setDidSelcectButtonAtIndexWithTitle:complete];
    return alertView;
}

-(void)showAlertView:(SOBaseAlertView*)alertView{
    if (![alertView isKindOfClass:[SOBaseAlertView class]]) {
        return;
    }
    
//    //含有唯一的view
//    if (alertView.sourceType == SHAlertViewSourceOnly && [self isContainSourceOnly]) {
//        return;
//    }
    
    //先将要显示的弹框放入到l队列中。
    [self sortAlertViewInLine:alertView];
    
    
    //延迟显示
    SOBaseAlertView *firstView = self.mNeedShowViews.firstObject;
    if (firstView.tag == self.mCurrentView.tag) {
        return;
    }
    
    //隐藏掉之前的。
    if (self.mCurrentView ) {
        [self.mCurrentView setWillDismissAlertView:nil];
        [self.mCurrentView disMiss];
        [self.mNeedShowViews removeObject:self.mCurrentView];
        self.mCurrentView = nil;
    }
    
    [alertView show];
    self.mCurrentView = alertView;
    __weak typeof(self) weakSelf = self;
    [alertView setWillDismissAlertView:^{
        __strong typeof(self) strongSelf = weakSelf;
        if ([strongSelf.mNeedShowViews containsObject:alertView]) {
            [strongSelf.mNeedShowViews removeObject:alertView];
        }
        //继续显示下一个要显示的。
        [strongSelf showAlertView:strongSelf.mNeedShowViews.firstObject];
    }];
}

//    VeryHigh -> high -> normal -> low -> Verylow
//对alertitem 数据 按照层级，进行排序插入。
-(NSInteger)sortAlertViewInLine:(SOBaseAlertView*)item{
    
    //继续显示在队列中的view
    if ([self.mNeedShowViews containsObject:item]) {
        return 0;
    }
    
    //根据优先级 插入准备显示的数据。
    if (self.mNeedShowViews.count == 0) {
        [self.mNeedShowViews addObject:item];
        return 0;
    }
    
    for (NSInteger i = 0; i <= self.mNeedShowViews.count; i++) {
        if (i == self.mNeedShowViews.count) {
            [self.mNeedShowViews addObject:item];
            break;
        }
        SOBaseAlertView *tempItem = self.mNeedShowViews[i];
        //找到比自己层级的低的插入到前面去  。如果是 同等层级的，先来先显示，后来后显示。
        if ( item.priority > tempItem.priority) {
            [self.mNeedShowViews insertObject:item atIndex:i];
            //            //判断是否需要清除比自己层级低的弹框。
            //            if (item.clear) {
            //                [self.mSourceItems removeObjectsInRange:NSMakeRange(i, self.mSourceItems.count - i)];
            //            }
            break;
        }
        //        //当前显示的view 层级较高 当前层级要清除比自己层级低的view
        //        else if (item.priority < tempItem.priority){
        //            if (tempItem.clear) {
        //                break;
        //            }
        //        }
        //同等级的 正常显示。
        else if (item.priority == tempItem.priority){
            
        }
    }
    return -1;
}

-(NSMutableArray*)mNeedShowViews{
    if (!_mNeedShowViews) {
        _mNeedShowViews  = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _mNeedShowViews;
}


@end
