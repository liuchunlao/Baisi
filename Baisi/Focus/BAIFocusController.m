//
//  BAIFocusController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIFocusController.h"
#import "BAIRecommentController.h"
#import "BAILoginController.h"

@interface BAIFocusController ()

@end

@implementation BAIFocusController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)loginAndregisterBtnClick {
    
    BAILoginController *vc = [[BAILoginController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)leftItemClick {
    BAIRecommentController *vc = [[BAIRecommentController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    self.navigationItem.title = @"关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem cz_itemWithImgName:@"friendsRecommentIcon" highImgName:@"friendsRecommentIcon-click" target:self selector:@selector(leftItemClick)];
    
}

@end
