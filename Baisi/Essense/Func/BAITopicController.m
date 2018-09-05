//
//  BAIWordController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/30.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITopicController.h"
#import "BAITopicCell.h"
#import "BAITopicModel.h"

@interface BAITopicController ()

@property (nonatomic, strong) NSMutableArray<BAITopicModel *> *topicList;
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, assign) NSInteger curPage;

/**
 总数量
 */
@property (nonatomic, assign) NSInteger count;

/**
 最后一条time
 */
@property (nonatomic, copy) NSString *maxtime;

@end

static NSString *cellid = @"topic";

@implementation BAITopicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupRefresh];
}

#pragma mark - 数据加载
- (void)loadTopics {
    if (self.tableView.mj_footer.isRefreshing) {
        [self.tableView.mj_footer endRefreshing];
    }
    
    self.curPage = 1;
    NSDictionary *params = @{
                             @"a"       : @"list",
                             @"c"       : @"data",
                             @"type"    : @(_type),
                             @"page"    : @(self.curPage)
                             };
    self.params = params;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        if ((self.params != params) || (self.params[@"page"] != params[@"page"])) {
            return;
        }
        
        [self.tableView.mj_header endRefreshing];
        
        [self.topicList removeAllObjects];
        [self processWithResponse:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"数据获取失败"];
    }];
    
}

- (void)processWithResponse:(NSDictionary *)response {
    
    NSDictionary *infoDict = response[@"info"];
    _count = [infoDict[@"count"] integerValue];
    _maxtime = infoDict[@"maxtime"];
    
    NSArray *list = [BAITopicModel mj_objectArrayWithKeyValuesArray:response[@"list"]];
    [_topicList addObjectsFromArray:list];
    
    [self.tableView reloadData];
}

- (void)loadMoreTopics {
    if (self.tableView.mj_header.isRefreshing) {
        [self.tableView.mj_header endRefreshing];
    }
    
    self.curPage++;
    NSDictionary *params = @{
                             @"a"       : @"list",
                             @"c"       : @"data",
                             @"type"    : @(_type),
                             @"maxtime" : _maxtime,
                             @"page"    : @(self.curPage)
                             };
    self.params = params;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        if ((self.params != params) || (self.params[@"page"] != params[@"page"])) {
            return;
        }
        
        [self.tableView.mj_footer endRefreshing];
        [self processWithResponse:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self.curPage--;
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"数据获取失败"];
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _topicList[indexPath.row].cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.tableView.mj_footer.hidden = !_topicList.count;
    return _topicList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BAITopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    
    cell.topic = _topicList[indexPath.row];
    
    return cell;
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"BAITopicCell" bundle:nil] forCellReuseIdentifier:cellid];
}

- (void)setupRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTopics)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    
    
    // 不加延时tableView会向上偏移!!!
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header beginRefreshing];
    });
    
}

- (NSMutableArray *)topicList {
    if (!_topicList) {
        _topicList = [NSMutableArray array];
    }
    return _topicList;
}


@end
