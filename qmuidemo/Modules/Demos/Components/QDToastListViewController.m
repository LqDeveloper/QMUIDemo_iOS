//
//  QDToastListViewController.m
//  qmuidemo
//
//  Created by zhoonchen on 2016/12/13.
//  Copyright © 2016年 QMUI Team. All rights reserved.
//

#import "QDToastListViewController.h"
#import "QDCustomToastAnimator.h"
#import "QDCustomToastContentView.h"

@interface QDToastListViewController ()

@end

@implementation QDToastListViewController

- (void)initDataSource {
    self.dataSource = @[@"Loading",
                        @"Loading With Text",
                        @"Tips For Succeed",
                        @"Tips For Error",
                        @"Tips For Info",
                        @"Custom TintColor",
                        @"Custom BackgroundView Style",
                        @"Custom Animator",
                        @"Custom Content View"];
}

- (void)didSelectCellWithTitle:(NSString *)title {
    UIView *parentView = self.navigationController.view;
    
    if ([title isEqualToString:@"Loading"]) {
        QMUITips *tips = [QMUITips createTipsToView:parentView];
        QMUIToastContentView *contentView = (QMUIToastContentView *)tips.contentView;
        contentView.minimumSize = CGSizeMake(90, 90);
        [tips showLoadingHideAfterDelay:2];
        
        // 如果不需要修改contentView的样式，也可以直接使用下面这个工具方法
        // [QMUITips showLoadingInView:parentView hideAfterDelay:2];
        
    } else if ([title isEqualToString:@"Loading With Text"]) {
        [QMUITips showLoading:@"加载中..." inView:parentView hideAfterDelay:2];
        
    } else if ([title isEqualToString:@"Tips For Succeed"]) {
        [QMUITips showSucceed:@"加载成功" inView:parentView hideAfterDelay:2];
        
    } else if ([title isEqualToString:@"Tips For Error"]) {
        [QMUITips showError:@"加载失败，请检查网络情况" inView:parentView hideAfterDelay:2];
        
    } else if ([title isEqualToString:@"Tips For Info"]) {
        [QMUITips showInfo:@"活动已经结束" detailText:@"本次活动时间为2月1号-2月15号" inView:parentView hideAfterDelay:2];
        
    } else if ([title isEqualToString:@"Custom TintColor"]) {
        QMUITips *tips = [QMUITips showInfo:@"活动已经结束" detailText:@"本次活动时间为2月1号-2月15号" inView:parentView hideAfterDelay:2];
        tips.tintColor = UIColorBlue;
        
    } else if ([title isEqualToString:@"Custom BackgroundView Style"]) {
        QMUITips *tips = [QMUITips showInfo:@"活动已经结束" detailText:@"本次活动时间为2月1号-2月15号" inView:parentView hideAfterDelay:2];
        QMUIToastBackgroundView *backgroundView = (QMUIToastBackgroundView *)tips.backgroundView;
        backgroundView.shouldBlurBackgroundView = YES;
        backgroundView.styleColor = UIColorMakeWithRGBA(232, 232, 232, 0.8);
        tips.tintColor = UIColorBlack;
        
    } else if ([title isEqualToString:@"Custom Content View"]) {
        QMUITips *tips = [QMUITips createTipsToView:parentView];
        tips.toastPosition = QMUIToastViewPositionBottom;
        QDCustomToastAnimator *customAnimator = [[QDCustomToastAnimator alloc] initWithToastView:tips];
        tips.toastAnimator = customAnimator;
        QDCustomToastContentView *customContentView = [[QDCustomToastContentView alloc] init];
        [customContentView renderWithImage:UIImageMake(@"icon_emotion") text:@"什么是QMUIToastView" detailText:@"QMUIToastView用于临时显示某些信息，并且会在数秒后自动消失。这些信息通常是轻量级操作的成功信息。"];
        tips.contentView = customContentView;
        [tips showAnimated:YES];
        [tips hideAnimated:YES afterDelay:4];
        
    } else if ([title isEqualToString:@"Custom Animator"]) {
        QMUITips *tips = [QMUITips createTipsToView:parentView];
        QDCustomToastAnimator *customAnimator = [[QDCustomToastAnimator alloc] initWithToastView:tips];
        tips.toastAnimator = customAnimator;
        [tips showInfo:@"活动已经结束" detailText:@"本次活动时间为2月1号-2月15号" hideAfterDelay:2];
        
    }
    
    [self.tableView clearsSelection];
}

@end