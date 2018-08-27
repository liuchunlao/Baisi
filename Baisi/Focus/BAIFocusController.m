//
//  BAIFocusController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIFocusController.h"
#import "BAIRecommentController.h"

@interface BAIFocusController ()

@end

@implementation BAIFocusController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)leftItemClick {
    BAIRecommentController *vc = [[BAIRecommentController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 搭建界面
- (void)setupUI {
 
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem cz_itemWithImgName:@"friendsRecommentIcon" highImgName:@"friendsRecommentIcon-click" target:self selector:@selector(leftItemClick)];
    
}

@end
