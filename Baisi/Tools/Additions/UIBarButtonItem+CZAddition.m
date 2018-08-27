//
//  UIBarButtonItem+CZAddition.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "UIBarButtonItem+CZAddition.h"

@implementation UIBarButtonItem (CZAddition)

+ (instancetype)cz_itemWithImgName:(NSString *)imgName highImgName:(NSString *)highImgName target:(id)target selector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImgName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

@end
