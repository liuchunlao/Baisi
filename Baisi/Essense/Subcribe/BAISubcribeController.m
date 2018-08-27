//
//  BAISubcribeController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAISubcribeController.h"
#import "BAISubcribeCell.h"
#import "BAISubcribeModel.h"

@interface BAISubcribeController () <UITableViewDataSource>

@end


static NSString *cellID_sub = @"cellID_sub";

@implementation BAISubcribeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BAISubcribeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_sub forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    self.navigationItem.title = @"订阅";
    
    UITableView *tv = [[UITableView alloc] init];
    tv.dataSource = self;
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tv registerNib:[UINib nibWithNibName:NSStringFromClass([BAISubcribeCell class]) bundle:nil] forCellReuseIdentifier:cellID_sub];
    
}

@end
