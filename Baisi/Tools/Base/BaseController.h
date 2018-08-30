//
//  BaseController.h
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) UITableViewStyle tvStyle;
@property (nonatomic, strong) UITableView *tv;

#pragma mark - 搭建界面
- (void)setupUI;

@end
