//
//  BAIRecommentModel.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIRecommentModel.h"

@implementation BAIRecommentModel

+ (void)initialize {
    [self mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"category_id" : @"id"
                 };
    }];
}

@end
