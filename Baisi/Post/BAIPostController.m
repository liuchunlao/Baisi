//
//  BAIPostController.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/17.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIPostController.h"

@interface BAIPostController ()

@end

@implementation BAIPostController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 搭建界面
- (void)setupUI {
 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:BAIThemeRedColor forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-60);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(360, 50));
    }];
    
}

- (void)btnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
