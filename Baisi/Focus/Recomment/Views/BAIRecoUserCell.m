//
//  BAIRecoUserCell.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/27.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIRecoUserCell.h"
#import "BAIRecoUserModel.h"

@interface BAIRecoUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *countL;


@end

@implementation BAIRecoUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _iconV.layer.cornerRadius = 20;
    _iconV.layer.masksToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setModel:(BAIRecoUserModel *)model {
    _model = model;
    
    [_iconV sd_setImageWithURL:[NSURL URLWithString:model.header] placeholderImage:nil];
    _nameL.text = model.screen_name;
    
    if (model.fans_count.integerValue < 10000) {
        _countL.text = [NSString stringWithFormat:@"%@人关注", model.fans_count.description];
    } else {
        float count = model.fans_count.integerValue / 10000.0;
        _countL.text = [NSString stringWithFormat:@"%.2f万人关注", count];
    }
    
}



@end
