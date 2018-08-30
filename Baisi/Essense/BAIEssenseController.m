//
//  BAIEssenseController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIEssenseController.h"
#import "BAISubcribeController.h"

@interface BAIEssenseController ()

@end

@implementation BAIEssenseController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 推荐关注
- (void)leftItemClick {
    
    BAISubcribeController *vc = [[BAISubcribeController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 搭建界面
- (void)setupUI {
 
    UIImageView *titleV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    titleV.bounds = CGRectMake(0, 0, 107, 19);
    self.navigationItem.titleView = titleV;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem cz_itemWithImgName:@"MainTagSubIcon" highImgName:@"MainTagSubIconClick" target:self selector:@selector(leftItemClick)];
    
}

@end
