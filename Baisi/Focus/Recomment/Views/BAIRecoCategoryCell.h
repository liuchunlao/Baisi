//
//  BAIRecoCategoryCell.h
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BaseCell.h"

@class BAIRecommentModel;
@interface BAIRecoCategoryCell : BaseCell

@property (nonatomic, strong) BAIRecommentModel *model;

- (void)categoryCellSetSelected:(BOOL)select;

@end
