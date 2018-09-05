//
//  BAIPictureView.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/5.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIPictureView.h"
#import "BAITopicModel.h"

#import "BAIShowPicController.h"

@interface BAIPictureView ()

@property (nonatomic, weak) IBOutlet UIImageView *gifV;
@property (nonatomic, weak) IBOutlet FLAnimatedImageView *imgV;
@property (nonatomic, weak) IBOutlet UIButton *bigBtn;

@property (nonatomic, weak) IBOutlet DALabeledCircularProgressView *progressView;

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
    NSLog(@"%@", topic.image1);
    [_imgV sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressView.hidden = NO;
            [self.progressView setProgress:progress];
            NSString *pg = [NSString stringWithFormat:@"%.0f%%", progress * 100];
            self.progressView.progressLabel.text = pg;
        });
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {

        self.progressView.hidden = YES;
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
    
    BAIShowPicController *vc = [[BAIShowPicController alloc] init];
    vc.topic = _topic;
    [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
}

@end
