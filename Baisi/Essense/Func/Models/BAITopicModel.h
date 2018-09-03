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

@end


//{
//    bimageuri = "";
//    bookmark = 2;
//    "cache_version" = 2;
//    cai = 14;
//    comment = 27;
//    "create_time" = "2018-09-02 16:22:08";
//    "created_at" = "2018-09-03 16:52:02";
//    ding = 186;
//    favourite = 2;
//    hate = 14;
//    height = 0;
//    id = 28553903;
//    love = 186;
//    name = "\U767d\U4e91\U57ce\U4e3b\U4e00\U53f6\U5b64\U57ce";
//    "original_pid" = 0;
//    passtime = "2018-09-03 16:52:02";
//    "profile_image" = "http://wimg.spriteapp.cn/profile/large/2018/08/12/5b6fb8304134c_mini.jpg";
//    repost = 0;
//    "screen_name" = "\U767d\U4e91\U57ce\U4e3b\U4e00\U53f6\U5b64\U57ce";
//    status = 4;
//    t = 1535964722;
//    tag = "";
//    text = "\U9655\U897f\U7684\U4e00\U4e2a\U7f51\U53cb\Uff0c\U5f88\U804a\U5f97\U6765\Uff01\U6bcf\U6b21\U804a\U5929\U7ed3\U675f\U7684\U65f6\U5019\Uff0c\U4ed6\U90fd\U559c\U6b22\U8bf4\Uff1a\U518d\U89c1\Uff0c\U9e39\U8c94\Uff01\n\U9e39\U8c94\U662f\U4ec0\U4e48\U610f\U601d\U6211\U771f\U4e0d\U61c2\Uff0c\U4e8e\U662f\U95ee\U4ed6\U9e39\U8c94\U662f\U4ec0\U4e48\U610f\U601d\Uff0c\U4ed6\U8bf4\U662f\U8d5e\U7f8e\U4eba\U7684\U8bdd\Uff0c\U5c0a\U656c\U4f60\U624d\U8fd9\U6837\U8bf4\U7684\U3002\U6709\U70b9\U4e0d\U4fe1\U4e8e\U662f\U4e0a\U7f51\U4e00\U67e5\Uff0c\U8fd8\U771f\U662f\U8fd9\U6837\Uff01\n\U9e39\U8c94\Uff1a\U5f62\U5bb9\U4eba\U5177\U6709\"\U5584\U826f\U9ad8\U8d35\"\U7684\U54c1\U8d28\Uff0c\U662f\U8d5e\U7f8e\U9882\U626c\U7684\U6587\U96c5\U7528\U8bcd\U3002\U9e39(gu\U00e1\U4e8c\U58f0)\U8c94(pi\U8f7b\U58f0)\U9e39\U548c\U8c94\U8c85\U5728\U9655\U897f\U5173\U4e2d\U5730\U533a\U4ee3\U8868\U5409\U7965\U9ad8\U8d35\Uff01\n\U4e8e\U662f\U540e\U6765\U6211\U8ddf\U522b\U4eba\U804a\U5929\U4e5f\U559c\U6b22\U7528\U9e39\U8c94\U6765\U8d5e\U7f8e\U522b\U4eba\Uff0c\U53ef\U4e0d\U77e5\U600e\U4e48\U5730\Uff0c\U88ab\U597d\U591a\U4eba\U7ed9\U62c9\U9ed1\U4e86\Uff01\U96be\U9053\U662f\U8fd9\U201c\U9e39\U8c94\U201d\U60f9\U7684\U7978\Uff1f\U59d0\U592b\U4eec\U6709\U6ca1\U6709\U61c2\U5185\U60c5\U7684\Uff1f\U80fd\U4e0d\U80fd\U6559\U6559\U5c0f\U5f1f\Uff1f";
//    "theme_id" = 63674;
//    "theme_name" = "\U539f\U521b\U6bb5\U5b50\U624b";
//    "theme_type" = 1;
//    themes =             (
//    );
//    "top_cmt" =             (
//    );
//    type = 29;
//    "user_id" = 19674378;
//    videotime = 0;
//    videouri = "";
//    voicelength = 0;
//    voicetime = 0;
//    voiceuri = "";
//    "weixin_url" = "http://a.f.zk111.com.cn/share/28553903.html?wx.qq.com&appname=";
//    width = 0;
//    }
