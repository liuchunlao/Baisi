//
//  BAIRecommentModel.h
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BAIRecoUserModel, BAIRecoUserModel;
@interface BAIRecommentModel : NSObject

@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *category_id;


/**
 对应的列表数据
 */
@property (nonatomic, strong) NSMutableArray<BAIRecoUserModel *> *userList;
@property (nonatomic, assign) NSInteger page;

@end
//count = 65;
//id = 35;
//name = "\U7f51\U7ea2";
