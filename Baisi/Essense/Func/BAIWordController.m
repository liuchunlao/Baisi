//
//  BAIWordController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/30.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIWordController.h"
#import "BAITopicCell.h"
#import "BAITopicModel.h"

@interface BAIWordController ()

@property (nonatomic, strong) NSMutableArray *topicList;

@end

static NSString *cellid = @"topic";

@implementation BAIWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupRefresh];
}

#pragma mark - 数据加载
- (void)loadTopics {
//    type    false    int    1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
    NSDictionary *params = @{
                             @"a"       : @"list",
                             @"c"       : @"data",
                             @"type"    : @"29"
                             };
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        [self.tableView.mj_header endRefreshing];
        
        [self.topicList removeAllObjects];
        [self processWithResponse:responseObject[@"list"]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"数据获取失败"];
    }];
    
}

- (void)processWithResponse:(NSDictionary *)response {
    
    NSArray *list = [BAITopicModel mj_objectArrayWithKeyValuesArray:response];
    [_topicList addObjectsFromArray:list];
    
    [self.tableView reloadData];
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
    
    cell.topic = _topicList[indexPath.row];
    
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

- (NSMutableArray *)topicList {
    if (!_topicList) {
        _topicList = [NSMutableArray array];
    }
    return _topicList;
}


@end
