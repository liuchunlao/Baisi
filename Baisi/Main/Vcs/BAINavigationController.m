//
//  BAINavigationController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAINavigationController.h"

@interface BAINavigationController ()

@end

@implementation BAINavigationController

+ (void)initialize {
    
    // 只在此种类型下生效！
    UINavigationBar *nb = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [nb setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
