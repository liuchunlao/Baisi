//
//  UIButton+CZAddition.m
//  001-Meituan
//
//  Created by 刘凡 on 16/5/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIButton+CZAddition.h"
#import "UIColor+CZAddition.h"
#import "UIImage+CZAddition.h"

@implementation UIButton (CZAddition)

+ (UIButton *)cz_colorButtonWithImgName:(NSString *)imgName rendColor:(UIColor *)color{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.imageView.tintColor = [UIColor cz_colorWithHex:0x666666];
    UIImage *img = [UIImage imageNamed:imgName];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [btn setImage:img forState:UIControlStateNormal];
    
    return btn;
}

+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    
    [button sizeToFit];
    
    return button;
}

+ (instancetype)cz_textButton:(NSString *)title {

    UIButton *btn = [self cz_textButton:title fontSize:18 normalColor:nil selectedColor:nil];
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = YES;
    
    UIColor *normalC = [UIColor cz_colorWithHex:0xffffff];
    UIColor *highLightC = normalC;
    UIColor *disC = [UIColor cz_colorWithHex:0x999999];
    
    UIImage *norImg = [UIImage cz_imageWithColor:[UIColor cz_colorWithHex:0xc00000]];
    UIImage *disImg = [UIImage cz_imageWithColor:[UIColor cz_colorWithHex:0xdddddd]];
    UIImage *higImg = norImg;
    
    [btn setTitleColor:normalC forState:UIControlStateNormal];
    [btn setTitleColor:highLightC forState:UIControlStateHighlighted];
    [btn setTitleColor:disC forState:UIControlStateDisabled];
    
    [btn setBackgroundImage:norImg forState:UIControlStateNormal];
    [btn setBackgroundImage:disImg forState:UIControlStateDisabled];
    [btn setBackgroundImage:higImg forState:UIControlStateHighlighted];
    
    return btn;
}


@end
