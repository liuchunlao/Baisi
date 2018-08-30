//
//  BAIAllController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/30.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIAllController.h"

@interface BAIAllController ()

@end

@implementation BAIAllController

- (void)viewDidLoad {
    [super viewDidLoad];
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


@end
