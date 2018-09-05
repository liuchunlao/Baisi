//
//  BAIPictureView.h
//  Baisi
//
//  Created by liuchunlao on 2018/9/5.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAITopicModel;
@interface BAIPictureView : UIView

+ (instancetype)pictureView;
@property (nonatomic, strong) BAITopicModel *topic;

@end
