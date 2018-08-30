//
//  BaseController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBg;
    
    [self setupUI];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 0;
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return nil;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    cell.textLabel.text = @(indexPath.row).description;
    return cell;
}



- (UITableView *)tv {
    if (!_tv) {
        _tv = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tvStyle];
        _tv.dataSource = self;
        _tv.delegate = self;
        [self.view addSubview:_tv];
    }
    return _tv;
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    
}

@end
