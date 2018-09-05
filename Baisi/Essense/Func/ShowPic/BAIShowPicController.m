//
//  BAIShowPicController.m
//  Baisi
//
//  Created by liuchunlao on 2018/9/5.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIShowPicController.h"
#import "BAITopicController.h"

#import "BAITopicModel.h"

@interface BAIShowPicController ()

@property (nonatomic, weak) IBOutlet UIScrollView *sv;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@end

@implementation BAIShowPicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FLAnimatedImageView *imgV = [[FLAnimatedImageView alloc] init];
    imgV.backgroundColor = UIColor.whiteColor;
    imgV.userInteractionEnabled = YES;
    [imgV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)]];
    [_sv addSubview:imgV];
    
    CGFloat w = kSW;
    CGFloat h = w * _topic.height.floatValue / _topic.width.floatValue;
    
    imgV.mj_size = CGSizeMake(w, h);
    if (h < kSH) {
        imgV.cz_centerY = kSH * 0.5;
    } else {
        imgV.cz_x = 0;
        imgV.cz_y = 0;
        _sv.contentSize = imgV.mj_size;
    }
    
    [self.progressView setProgress:_topic.progress];
    [imgV sd_setImageWithURL:[NSURL URLWithString:_topic.image1] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        self->_topic.progress = progress;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressView.hidden = NO;
            [self.progressView setProgress:progress];
            NSString *pg = [NSString stringWithFormat:@"%.0f%%", progress * 100];
            self.progressView.progressLabel.text = pg;
        });
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.progressView.hidden = YES;
    }];
}
- (IBAction)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
