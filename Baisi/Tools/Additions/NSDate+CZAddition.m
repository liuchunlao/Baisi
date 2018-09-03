//
//  NSDate+CZAddition.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/3.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "NSDate+CZAddition.h"

@implementation NSDate (CZAddition)

- (NSDateComponents *)cz_componentsFromDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self toDate:date options:0];
    
    return cmps;
}


/**
 是否为今年
 */
- (BOOL)cz_isThisYear {
    
    NSCalendar *c = [NSCalendar currentCalendar];
    NSInteger y1 = [c component:NSCalendarUnitYear fromDate:self];
    NSInteger y2 = [c component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return y1 == y2;
}


/**
 是否为这个月
 */
- (BOOL)cz_isThisMonth {
    
    NSCalendar *c = [NSCalendar currentCalendar];
    NSDateComponents *c1 = [c components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *c2 = [c components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:[NSDate date]];
    
    return c1.year == c2.year && c1.month == c2.month;
}


/**
 是否为今天
 */
- (BOOL)cz_isToday {
    
    NSCalendar *c = [NSCalendar currentCalendar];
    NSDateComponents *c1 = [c components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    NSDateComponents *c2 = [c components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    
    return c1.year == c2.year && c1.month == c2.month && c1.day == c2.day;
}


/**
 是否是昨天
 */
- (BOOL)cz_isYesterday {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *s1 = [fmt stringFromDate:self];
    NSString *s2 = [fmt stringFromDate:[NSDate date]];
    
    NSDate *d1 = [fmt dateFromString:s1];
    NSDate *d2 = [fmt dateFromString:s2];
    
    NSDateComponents *c = [d1 cz_componentsFromDate:d2];
    return c.year == 0
        && c.month == 0
        && c.day == 1;
}

@end
