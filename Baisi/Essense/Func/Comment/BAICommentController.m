//
//  BAICommentController.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/14.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAICommentController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface BAICommentController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomCons;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation BAICommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem cz_itemWithImgName:@"comment_nav_item_share_icon" highImgName:@"comment_nav_item_share_icon_click" target:nil selector:nil];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadCmt)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreCmt)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UIScreenEdgePanGestureRecognizer *rec = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(backBtnClick:)];
    rec.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:rec];
    
}

- (void)loadCmt {
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreCmt {
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - 数据源方法



- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (void)keyboardChanged:(NSNotification *)noti {
    
    CGFloat y = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat offsetY = kSH - y;
    
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    self -> _bottomCons.constant = -offsetY;
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    self.navigationController.navigationBar.hidden = NO;
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
