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
    
    if ([topic.cdn_img.pathExtension isEqualToString:@"gif"]) {
        NSLog(@"%@", topic.cdn_img);
        [_imgV sd_setImageWithURL:[NSURL URLWithString:topic.cdn_img] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
        } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
        }];
        return;
    }
    
    
    [_imgV sd_setImageWithURL:[NSURL URLWithString:topic.image2] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {

    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {

        // 如果图片过大，则处理！
        if (topic.isBig) {
            CGFloat imgW = kSW - 4 * BAICellMargin;
            CGSize size = CGSizeMake(imgW, BAICellPictureModH);

            UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);

            CGFloat imgH = image.size.height / image.size.width * imgW;
            [image drawInRect:CGRectMake(0, 0, imgW, imgH)];
            UIImage *zipImg = UIGraphicsGetImageFromCurrentImageContext();
            self->_imgV.image = zipImg;

            UIGraphicsEndImageContext();

        } else {
            self->_imgV.image = image;
        }
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat imgW = kSW - 4 * BAICellMargin;
    CGSize size = CGSizeMake(imgW, BAICellPictureModH);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    [_imgV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    
    
    
}

@end
