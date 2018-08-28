//
//  BAIRecommentController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIRecommentController.h"
#import "BAIRecommentModel.h"
#import "BAIRecoUserModel.h"
#import "BAIRecoCategoryCell.h"
#import "BAIRecoUserCell.h"
#import <SVProgressHUD.h>

@interface BAIRecommentController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tvLeft;
@property (weak, nonatomic) IBOutlet UITableView *tvRight;

@property (nonatomic, weak) BAIRecoCategoryCell *selCategoryCell;

@property (nonatomic, strong) NSDictionary *params;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

static NSString *cellID_left = @"cellID_left";
static NSString *cellID_right = @"cellID_right";

@implementation BAIRecommentController {
    NSArray<BAIRecommentModel *> *_categoryList;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCategory];
}

- (void)loadCategory {
    
    [SVProgressHUD show];
    
    NSDictionary *params = @{
                             @"a" : @"category",
                             @"c" : @"subscribe"
                             };

    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
        self->_categoryList = [BAIRecommentModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self->_tvLeft reloadData];
        
        if (self->_categoryList.count == 0) {
            return;
        }
        
        // 默认选中第0个
        BAIRecoCategoryCell *cell = [self->_tvLeft cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [cell categoryCellSetSelected:YES];
        self->_selCategoryCell = cell;
        
        // 获取用户数据
        [self.tvRight.mj_header beginRefreshing];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
    }];
    
}

- (void)loadUserData {
    
    _selCategoryCell.model.page = 1;
    NSDictionary *params = @{
                             @"category_id" : _selCategoryCell.model.category_id,
                             @"a"           : @"list",
                             @"c"           : @"subscribe",
                             @"page"        : @"1"
                             };
    self.params = params;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.tvRight.mj_header endRefreshing];
        
        if (self.params != params || (![params[@"category_id"] isEqualToString:self->_selCategoryCell.model.category_id])) {
            return;
        }
        
        [self.selCategoryCell.model.userList removeAllObjects];
        
        self.selCategoryCell.model.userCount = responseObject[@"total"];
        self.selCategoryCell.model.userList = [BAIRecoUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        
        [self.tvRight reloadData];
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tvRight.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
    }];
    
}

- (void)loadMoreUser {
    
    _selCategoryCell.model.page++;
    NSDictionary *params = @{
                             @"category_id" : _selCategoryCell.model.category_id,
                             @"a"           : @"list",
                             @"c"           : @"subscribe",
                             @"page"        : @(_selCategoryCell.model.page)
                             };
    self.params = params;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.tvRight.mj_footer endRefreshing];

        if (self.params != params || (![params[@"category_id"] isEqualToString:self->_selCategoryCell.model.category_id])) {
            // 将页码减回去！
            [self->_categoryList enumerateObjectsUsingBlock:^(BAIRecommentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj.category_id isEqualToString:params[@"category_id"]]) {
                    obj.page--;
                };
            }];
            return;
        }

        NSArray *list = [BAIRecoUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.selCategoryCell.model.userList addObjectsFromArray:list];

        if (self.params != params) {
            return;
        }

        [self.tvRight reloadData];
        [self checkFooterState];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tvRight.mj_footer endRefreshing];
        self.selCategoryCell.model.page--;
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
    }];
}

- (void)checkFooterState {
    
    NSInteger count1 = _selCategoryCell.model.userList.count;
    NSInteger count2 = _selCategoryCell.model.userCount.integerValue;
    if (count1 == count2) {
        [_tvRight.mj_footer endRefreshingWithNoMoreData];
    } else {
        [_tvRight.mj_footer resetNoMoreData];
    }
    _tvRight.mj_footer.hidden = !_selCategoryCell.model.userList.count;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tvLeft) {
        
        // 切换选中cell
        [_selCategoryCell categoryCellSetSelected:NO];
        BAIRecoCategoryCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell categoryCellSetSelected:YES];
        _selCategoryCell = cell;
        
        // 立即刷新右侧表格,更新footer状态
        [_tvRight reloadData];
        
        // 加载用户数据
        if (self.tvRight.mj_header.isRefreshing) {
            [self.tvRight.mj_header endRefreshing];
        }
        
        if (self.tvRight.mj_footer.isRefreshing) {
            [self.tvRight.mj_footer endRefreshing];
        }
        
        if (_selCategoryCell.model.userList == nil) {
            _selCategoryCell.model.userList = [NSMutableArray array];
        }
        
        [self checkFooterState];
        
        // 确定没有数据时再刷新，防止重复加载！
        if (_selCategoryCell.model.userList.count == 0) {
            [_tvRight.mj_header beginRefreshing];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tvLeft) {
        return 40;
    }
    return 60;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _tvLeft) {
        return _categoryList.count;
    }
    return _selCategoryCell.model.userList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == _tvLeft) {
        BAIRecoCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_left forIndexPath:indexPath];
        cell.model = _categoryList[indexPath.row];
        
        return cell;
    } else {
        BAIRecoUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_right forIndexPath:indexPath];
        
        cell.model = _selCategoryCell.model.userList[indexPath.row];
        
        return cell;
    }
}

#pragma mark - 搭建界面
- (void)setupUI {
    self.navigationItem.title = @"推荐关注";
    
    [_tvLeft registerNib:[UINib nibWithNibName:NSStringFromClass([BAIRecoCategoryCell class]) bundle:nil] forCellReuseIdentifier:cellID_left];
    [_tvRight registerNib:[UINib nibWithNibName:NSStringFromClass([BAIRecoUserCell class]) bundle:nil] forCellReuseIdentifier:cellID_right];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadUserData)];
    _tvRight.mj_header = header;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUser)];
    _tvRight.mj_footer = footer;
    
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)dealloc {
    
    [self.manager invalidateSessionCancelingTasks:YES];
}

@end
