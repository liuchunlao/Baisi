//
//  BAITabBar.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITabBar.h"

@implementation BAITabBar {
    UIButton *_plusBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
    
    _plusBtn = btn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (![self.subviews containsObject:_plusBtn]) {
        [self insertSubview:_plusBtn atIndex:3];
    }
    
    CGFloat btnY = 0;
    CGFloat btnW = self.cz_width / 5;
    CGFloat btnH = self.cz_height;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:UIControl.class]) {
            obj.frame = CGRectMake((idx - 1) * btnW, btnY, btnW, btnH);
        }
    }];
}



@end
