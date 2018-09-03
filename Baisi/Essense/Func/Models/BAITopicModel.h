//
//  BAITopicModel.h
//  Baisi
//
//  Created by liuchunlao on 2018/9/3.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAITopicModel : NSObject


/**
 头像
 */
@property (nonatomic, copy) NSString *profile_image;

/**
 昵称
 */
@property (nonatomic, copy) NSString *screen_name;

/**
 是否为新浪会员
 */
@property (nonatomic, assign) NSInteger sina_v;

/**
 创建时间
 */
@property (nonatomic, copy) NSString *create_time;

/**
 收藏量
 */
@property (nonatomic, copy) NSString *favourite;

/**
 踩
 */
@property (nonatomic, copy) NSString *cai;

/**
 评论
 */
@property (nonatomic, copy) NSString *comment;

/**
 转发
 */
@property (nonatomic, copy) NSString *repost;

/**
 是否是gif
 */
@property (nonatomic, copy) NSString *is_gif;

/**
 第一次加载帖子时候不需要传入此关键字，当需要加载下一页时：需要传入加载上一页时返回值字段“maxtime”中的内容。
 */
@property (nonatomic, copy) NSString *maxtime;

@end


