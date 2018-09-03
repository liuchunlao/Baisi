//
//  NSDate+CZAddition.h
//  Baisi
//
//  Created by liuchunlao on 2018/9/3.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CZAddition)

/**
 距离当前时间的差值

 @param date 比较时间
 @return 返回与当前时间的差值
 */
- (NSDateComponents *)cz_componentsFromDate:(NSDate *)date;

/**
 是否是今年
 */
- (BOOL)cz_isThisYear;

/**
 是否是这个月
 */
- (BOOL)cz_isThisMonth;

/**
 是否是今天
 */
- (BOOL)cz_isToday;




@end
