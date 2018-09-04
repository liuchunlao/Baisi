//
//  BAITopicCell.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/31.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITopicCell.h"
#import "BAITopicModel.h"

@interface BAITopicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;

@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *comBtn;

@end

@implementation BAITopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _iconV.layer.cornerRadius = 15;
    _iconV.layer.masksToBounds = YES;
    
    
}

- (void)setTopic:(BAITopicModel *)topic {
    _topic = topic;
    [_iconV sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    _nameL.text = topic.screen_name;
    
    NSString *time = topic.create_time;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *dt = [fmt dateFromString:time];
    
    if ([dt cz_isThisYear]) {
        if ([dt cz_isToday]) {
            NSDateComponents *cmps = [[NSDate date] cz_componentsFromDate:dt];
            if (cmps.hour > 1) {
                
                if (cmps.minute < 1) {
                    _timeL.text = @"刚刚";
                } else {
                    _timeL.text = [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
                }
            } else {
                fmt.dateFormat = @"HH:mm:ss";
                _timeL.text = [fmt stringFromDate:dt];
            }
            
        } else if ([dt cz_isYesterday]) {
            // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            _timeL.text = [fmt stringFromDate:dt];
            
        } else {
            // 其他时间
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            _timeL.text = [fmt stringFromDate:dt];
        }
        
    } else {
        _timeL.text = time;
    }
    
    
    [_zanBtn setTitle:topic.favourite forState:UIControlStateNormal];
    [_caiBtn setTitle:topic.cai forState:UIControlStateNormal];
    [_repostBtn setTitle:topic.repost forState:UIControlStateNormal];
    [_comBtn setTitle:topic.comment forState:UIControlStateNormal];
    
}

- (void)setFrame:(CGRect)frame {
    
    CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2 * margin;
    frame.size.height -= 10;
    frame.origin.y += 10;
    
    [super setFrame:frame];
}

@end
