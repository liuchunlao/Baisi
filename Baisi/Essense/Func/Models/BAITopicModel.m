//
//  BAITopicModel.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/3.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITopicModel.h"

@implementation BAITopicModel


- (NSString *)create_time {
    
    NSString *time = _create_time;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *dt = [fmt dateFromString:time];
    
    if ([dt cz_isThisYear]) {
        if ([dt cz_isToday]) {
            NSDateComponents *cmps = [[NSDate date] cz_componentsFromDate:dt];
            if (cmps.hour > 1) {
                
                if (cmps.minute < 1) {
                    return @"刚刚";
                } else {
                    return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
                }
            } else {
                fmt.dateFormat = @"HH:mm:ss";
                return [fmt stringFromDate:dt];
            }
            
        } else if ([dt cz_isYesterday]) {
            // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:dt];
            
        } else {
            // 其他时间
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:dt];
        }
        
    } else {
        return time;
    }
}

@end
