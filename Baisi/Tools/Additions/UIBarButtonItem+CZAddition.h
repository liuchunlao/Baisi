//
//  UIBarButtonItem+CZAddition.h
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CZAddition)

+ (instancetype)itemWithImage:(NSString *)imgName target:(id)target selector:(SEL)selector;

@end
