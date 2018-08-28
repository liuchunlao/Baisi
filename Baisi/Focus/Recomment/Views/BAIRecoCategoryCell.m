//
//  BAIRecoCategoryCell.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIRecoCategoryCell.h"
#import "BAIRecommentModel.h"

@interface BAIRecoCategoryCell ()
@property (weak, nonatomic) IBOutlet UIView *lineV;
@property (weak, nonatomic) IBOutlet UILabel *infoL;

@end

@implementation BAIRecoCategoryCell

- (void)setModel:(BAIRecommentModel *)model {
    _model = model;
    _infoL.text = model.name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 选中效果及分割线
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _lineV.hidden = YES;
    self.backgroundColor = [UIColor cz_colorWithHex:0xededed];
}

- (void)categoryCellSetSelected:(BOOL)select {

    _lineV.hidden = !select;
    _infoL.textColor = select ? BAIThemeRedColor : [UIColor cz_colorWithHex:0x212121];
    
}

@end
