//
//  BAIEssenseController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIEssenseController.h"
#import "BAISubcribeController.h"
#import "BAITopSelectView.h"

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
 
    [self setupNav];
    [self setupTags];
}

- (void)setupTags {
    BAITopSelectView *topV = [BAITopSelectView selectViewWithArr:@[@"全部", @"图片", @"视频", @"文字"]];
    topV.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [self.view addSubview:topV];
    
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }
        make.height.mas_equalTo(35);
    }];
    
}

- (void)setupNav {
    
    UIImageView *titleV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    titleV.bounds = CGRectMake(0, 0, 107, 19);
    self.navigationItem.titleView = titleV;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem cz_itemWithImgName:@"MainTagSubIcon" highImgName:@"MainTagSubIconClick" target:self selector:@selector(leftItemClick)];
    
}

@end
