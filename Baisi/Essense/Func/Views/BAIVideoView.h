//
//  BAIVideoView.h
//  Baisi
//
//  Created by liuchunlao on 2018/9/6.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAITopicModel;
@interface BAIVideoView : UIView

@property (nonatomic, strong) BAITopicModel *topic;
+ (instancetype)videoView;

@end
