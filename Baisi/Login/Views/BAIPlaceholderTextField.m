//
//  BAIPlaceholderTextField.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/29.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIPlaceholderTextField.h"

@implementation BAIPlaceholderTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self resignFirstResponder];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    
    [self setValue:UIColor.whiteColor forKeyPath:@"placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self setValue:UIColor.grayColor forKeyPath:@"placeholderLabel.textColor"];
    return [super resignFirstResponder];
}

@end
