//
//  BAITopicModel.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/3.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITopicModel.h"

@implementation BAITopicModel {
    CGFloat _cellHeight;
}


#pragma mark - 计算cell高度！
- (CGFloat)cellHeight {
    
    if (_cellHeight) {
        return _cellHeight;
    }
    
    // 计算！
    // | - 40 - x - 40 -|
    // 头像-昵称及时间
    _cellHeight = 40;
    
    // 文字高度
    // 间距
    _cellHeight += BAICellMargin;
    
    // 文字所需高度！
    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(kSW - 4 * BAICellMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{
                                                                                                                                                             NSFontAttributeName : BAIFont(14),
                                                                                                                                                             NSForegroundColorAttributeName : UIColor.grayColor
                                                                                                                                                             } context:nil].size.height;
    _cellHeight += textH;
    
    // 间距
    _cellHeight += BAICellMargin;
    
    
    CGFloat pictureX = BAICellMargin;
    CGFloat pictureY = _cellHeight;
    
    // 高度计算
    CGFloat pictureW = kSW - 4 * BAICellMargin;
    CGFloat pictureH = self.height.floatValue * pictureW / self.width.floatValue * 1.0;
    
    /***计算中间插入内容的frame信息***/
    if (_type == kTopicTypePicture) {
        
        // 图片位置！
        _isBig = pictureH > BAICellPictureMaxH;
        
        // 大于1k，缩小显示，小于时正常展示！
        pictureH = _isBig ? BAICellPictureModH : pictureH;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        _cellHeight += pictureH;
        
    } else if (_type == kTopicTypeVideo) {
        // 视频frame
        pictureH = pictureH > 450 ? 450 : pictureH;
        _videoF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        NSLog(@"_videoF = %@", NSStringFromCGRect(_videoF));
        _cellHeight += pictureH;
        
    } else {
        _cellHeight -= BAICellMargin;
    }
    
    _cellHeight += 2 * BAICellMargin;
    _cellHeight += 40;
    return _cellHeight;
}

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
