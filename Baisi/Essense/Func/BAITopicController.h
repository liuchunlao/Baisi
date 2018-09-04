//
//  BAITopicController.h
//  Baisi
//
//  Created by liuchunlao on 2018/9/4.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BaseController.h"

//    type    false    int    1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
typedef enum {
    kTopicTypeAll       = 1,
    kTopicTypeVideo     = 41,
    kTopicTypePicture   = 10,
    kTopicTypeWord      = 29
    
} kTopicType;

@interface BAITopicController : UITableViewController

@property (nonatomic, assign) kTopicType type;

@end
