//
//  BAIWordController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/30.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIWordController.h"
#import "BAITopicCell.h"

@interface BAIWordController ()

@end

static NSString *cellid = @"topic";

@implementation BAIWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupRefresh];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark - 数据加载
- (void)loadTopics {
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreTopics {
    
    [self.tableView.mj_footer endRefreshing];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BAITopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark - 搭建界面
- (void)setupUI {
 
    [self.tableView registerNib:[UINib nibWithNibName:@"BAITopicCell" bundle:nil] forCellReuseIdentifier:cellid];
}

- (void)setupRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTopics)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 不加延时tableView会向上偏移!!!
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header beginRefreshing];
    });
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}


@end
