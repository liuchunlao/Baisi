//
//  UIBarButtonItem+CZAddition.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "UIBarButtonItem+CZAddition.h"

@implementation UIBarButtonItem (CZAddition)

+ (instancetype)itemWithImage:(NSString *)imgName target:(id)target selector:(SEL)selector {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:target action:selector];
    return item;
}

@end
