//
//  BAITopicCell.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/31.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITopicCell.h"
#import "BAIPictureView.h"
#import "BAIVideoView.h"
#import "BAITopicModel.h"

@interface BAITopicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *infoL;

@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *comBtn;


/**
 展示图片的视图！
 */
@property (nonatomic, strong) BAIPictureView *pictureV;
@property (nonatomic, strong) BAIVideoView *videoV;

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
    _timeL.text = topic.create_time;
    _infoL.text = topic.text;
    
    if (topic.type == kTopicTypePicture) {
        // 图片
        self.pictureV.topic = topic;
        self.pictureV.frame = topic.pictureF;
        self.videoV.hidden = YES;
        self.pictureV.hidden = NO;
        
    } else if (topic.type == kTopicTypeVideo) {
        // 视频
        self.videoV.topic = topic;
        self.videoV.frame = topic.videoF;
        self.videoV.hidden = NO;
        self.pictureV.hidden = YES;
        
    } else {
        // 文字
        self.videoV.hidden = YES;
        self.pictureV.hidden = YES;
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

- (BAIVideoView *)videoV {
    if (!_videoV) {
        _videoV = [BAIVideoView videoView];
        [self.contentView addSubview:_videoV];
    }
    return _videoV;
}

- (BAIPictureView *)pictureV {
    if (!_pictureV) {
        _pictureV = [BAIPictureView pictureView];
        [self.contentView addSubview:_pictureV];
    }
    return _pictureV;
}

@end
