//
//  GZPopScaleView.m
//  GZPopScaleView
//
//  Created by 李国志 on 2020/6/18.
//  Copyright © 2020 LGZ. All rights reserved.
//

#import "GZPopScaleView.h"

@implementation GZPopScaleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}

#pragma mark - configureUI

- (void)configureUI {
    self.backgroundColor = [UIColor redColor];
}

- (void)showView {
    self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    self.alpha = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1f animations:^{
            self.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            //  恢复原位
            self.transform = CGAffineTransformIdentity;
        }];
        // 显示12秒隐藏
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 五分钟后显示视图
//            [self hiddenView];
//        });
    }];
}

- (void)hiddenView {
    self.transform = CGAffineTransformMakeScale(1 , 1);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0.01 , 0.01);
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
        self.alpha = 0.0f;
        // 隐藏后5分钟后再次显示
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * 60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 五分钟后显示视图
//            [self showView];
//        });
    }];
}

@end
