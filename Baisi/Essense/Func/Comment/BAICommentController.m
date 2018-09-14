//
//  BAICommentController.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/14.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAICommentController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface BAICommentController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomCons;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;


@end

@implementation BAICommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem cz_itemWithImgName:@"comment_nav_item_share_icon" highImgName:@"comment_nav_item_share_icon_click" target:nil selector:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (void)keyboardChanged:(NSNotification *)noti {
//    NSLog(@"%@", noti.userInfo);
    CGFloat y = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat offsetY = kSH - y;
    
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        self -> _bottomCons.constant = -offsetY;
    }];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}


@end
