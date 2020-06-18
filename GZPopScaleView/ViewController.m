//
//  ViewController.m
//  GZPopScaleView
//
//  Created by 李国志 on 2020/6/18.
//  Copyright © 2020 LGZ. All rights reserved.
//

#import "ViewController.h"
#import "GZPopScaleView.h"
#import "UIView+YYAdd.h"

@interface ViewController ()

@property (nonatomic, strong) GZPopScaleView *popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    GZPopScaleView *popView = [[GZPopScaleView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    self.popView = popView;
    self.popView.alpha = 0;
    [self.view addSubview:popView];
    
    NSArray *locas = @[@"左上", @"上中", @"右上", @"左中", @"中心", @"右中", @"左下", @"下中", @"右下"];
    
    
    for (int i = 0; i < locas.count; i++) {
        UIButton *locaButton = [self createButtonWithFrame:CGRectMake(0, 0, 50, 30) title:locas[i] tag:100 + i];
        if (i == 0) {
            locaButton.bottom = popView.top;
            locaButton.right = popView.left;
        } else if (i == 1) {
            locaButton.bottom = popView.top;
            locaButton.centerX = popView.centerX;
        } else if (i == 2) {
            locaButton.bottom = popView.top;
            locaButton.left = popView.right;
        } else if (i == 3) {
            locaButton.centerY = popView.centerY;
            locaButton.right = popView.left;
        } else if (i == 4) {
            locaButton.center = popView.center;
        } else if (i == 5) {
            locaButton.left = popView.right;
            locaButton.centerY = popView.centerY;
        } else if (i == 6) {
            locaButton.top = popView.bottom;
            locaButton.right = popView.left;
        } else if (i == 7) {
            locaButton.top = popView.bottom;
            locaButton.centerX = popView.centerX;
        } else if (i == 8) {
            locaButton.top = popView.bottom;
            locaButton.left = popView.right;
        }
        
        [self.view addSubview:locaButton];
    }
}

- (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title  tag:(NSInteger)tag {
    UIButton *locaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    locaButton.frame = frame;
    locaButton.tag = tag;
    [locaButton setTitle:title forState:UIControlStateNormal];
    [locaButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [locaButton setBackgroundColor:[UIColor cyanColor]];
    [locaButton addTarget:self action:@selector(locationAction:) forControlEvents:UIControlEventTouchUpInside];
    return locaButton;
}

#pragma mark - Action

- (void)locationAction:(UIButton *)btn {
    NSInteger i = btn.tag - 100;
    if (i == 0) {
        // 这两种方法都可以,后面的就只用一种了,但是在使用Masnory 的情况下还是直接设置center的方式更方便.
//        self.popView.centerX = btn.right;
//        self.popView.centerY = btn.bottom;
        self.popView.layer.position = CGPointMake(btn.right, btn.bottom);
        self.popView.layer.anchorPoint = CGPointMake(0, 0);
    } else if (i == 1) {
        self.popView.layer.position = CGPointMake(btn.centerX, btn.bottom);
        self.popView.layer.anchorPoint = CGPointMake(0.5, 0);
    } else if (i == 2) {
        self.popView.layer.position = CGPointMake(btn.left, btn.bottom);
        self.popView.layer.anchorPoint = CGPointMake(1, 0);
    } else if (i == 3) {
        self.popView.layer.position = CGPointMake(btn.right, btn.centerY);
        self.popView.layer.anchorPoint = CGPointMake(0, 0.5);
    } else if (i == 4) {
        self.popView.layer.position = CGPointMake(btn.centerX, btn.centerY);
        self.popView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    } else if (i == 5) {
        self.popView.layer.position = CGPointMake(btn.left, btn.centerY);
        self.popView.layer.anchorPoint = CGPointMake(1, 0.5);
    } else if (i == 6) {
        self.popView.layer.position = CGPointMake(btn.right, btn.top);
        self.popView.layer.anchorPoint = CGPointMake(0, 1);
    } else if (i == 7) {
        self.popView.layer.position = CGPointMake(btn.centerX, btn.top);
        self.popView.layer.anchorPoint = CGPointMake(0.5, 1);
    } else if (i == 8) {
        self.popView.layer.position = CGPointMake(btn.left, btn.top);
        self.popView.layer.anchorPoint = CGPointMake(1, 1);
    }
    
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.popView showView];
    } else {
        [self.popView hiddenView];
    }
}

@end
