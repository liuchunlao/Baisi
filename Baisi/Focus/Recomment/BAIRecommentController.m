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

@interface BAIRecommentController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tvLeft;
@property (weak, nonatomic) IBOutlet UITableView *tvRight;

@end

static NSString *cellID_left = @"cellID_left";
static NSString *cellID_right = @"cellID_right";

@implementation BAIRecommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
        return 10;
    }
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == _tvLeft) {
        BAIRecoCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_left forIndexPath:indexPath];
        
        
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
