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
    
    [imgV sd_setImageWithURL:[NSURL URLWithString:_topic.image1] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}
- (IBAction)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
