//
//  BAIVideoView.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/6.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIVideoView.h"
#import "BAITopicModel.h"

@interface BAIVideoView ()


@property (nonatomic, weak) IBOutlet UIImageView *imgV;
@property (nonatomic, weak) IBOutlet UILabel *countL;
@property (nonatomic, weak) IBOutlet UILabel *timeL;


@end

@implementation BAIVideoView

+ (instancetype)videoView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (void)setTopic:(BAITopicModel *)topic {
    _topic = topic;
    _countL.text = topic.playcount;
    _timeL.text = topic.videotime;
    
    [_imgV sd_setImageWithURL:[NSURL URLWithString:topic.cdn_img]];
    
}

@end
