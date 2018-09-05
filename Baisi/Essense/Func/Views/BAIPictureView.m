//
//  BAIPictureView.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/5.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIPictureView.h"
#import "BAITopicModel.h"

@interface BAIPictureView ()

@property (nonatomic, weak) IBOutlet UIImageView *gifV;
@property (nonatomic, weak) IBOutlet UIImageView *imgV;
@property (nonatomic, weak) IBOutlet UIButton *bigBtn;

@end

@implementation BAIPictureView

+ (instancetype)pictureView {

    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil
                                       options:nil].lastObject;
}

- (void)setTopic:(BAITopicModel *)topic {
    _topic = topic;
    
    _gifV.hidden = !topic.is_gif.integerValue;
    _bigBtn.hidden = !topic.isBig;
    
    [_imgV sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self->_imgV.image = image;
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_imgV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    
    
    
}

@end
