//
//  BAIRecommentController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIRecommentController.h"
#import "BAIRecommentModel.h"
#import "BAIRecoCategoryCell.h"
#import "BAIRecoUserCell.h"
#import <SVProgressHUD.h>

@interface BAIRecommentController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tvLeft;
@property (weak, nonatomic) IBOutlet UITableView *tvRight;

@property (nonatomic, weak) BAIRecoCategoryCell *selCategoryCell;

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
        
        // 默认选中第0个
        BAIRecoCategoryCell *cell = [self->_tvLeft cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [cell categoryCellSetSelected:YES];
        self->_selCategoryCell = cell;
        
        // 获取用户数据

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
        [SVProgressHUD showErrorWithStatus:@"获取失败"];
    }];
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tvLeft) {
        [_selCategoryCell categoryCellSetSelected:NO];
        
        BAIRecoCategoryCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell categoryCellSetSelected:YES];
        
        _selCategoryCell = cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tvLeft) {
        return 60;
    }
    return 80;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _tvLeft) {
        return _categoryList.count;
    }
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == _tvLeft) {
        BAIRecoCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_left forIndexPath:indexPath];
        cell.model = _categoryList[indexPath.row];
        
        return cell;
    } else {
        BAIRecoUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_right forIndexPath:indexPath];
        
        
        return cell;
    }
}

#pragma mark - 搭建界面
- (void)setupUI {
    self.navigationItem.title = @"推荐关注";
    
    [_tvLeft registerNib:[UINib nibWithNibName:NSStringFromClass([BAIRecoCategoryCell class]) bundle:nil] forCellReuseIdentifier:cellID_left];
    [_tvRight registerNib:[UINib nibWithNibName:NSStringFromClass([BAIRecoUserCell class]) bundle:nil] forCellReuseIdentifier:cellID_right];
    
}

@end
