//
//  BAITopicCell.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/31.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITopicCell.h"

@implementation BAITopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setFrame:(CGRect)frame {
    
    CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2 * margin;
    frame.size.height -= 10;
    frame.origin.y += 10;
    
    [super setFrame:frame];
}

@end
