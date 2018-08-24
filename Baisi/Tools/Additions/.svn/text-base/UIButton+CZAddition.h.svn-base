//
//  UIButton+CZAddition.h
//  001-Meituan
//
//  Created by 刘凡 on 16/5/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CZAddition)

/// 创建文本按钮
///
/// @param title         文本
/// @param fontSize      字体大小
/// @param normalColor   默认颜色
/// @param selectedColor 选中颜色
///
/// @return UIButton
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;


/**
 创建界面底部的大按钮

 @param title 按钮标题
 字体 默认 20 颜色默认白色 不能点击时 & 高亮时 alpha 为0.5
 背景图片 通过颜色生成 默认 与导航栏颜色一致， 高亮时 0xee3636
 */
+ (instancetype)cz_textButton:(NSString *)title;


/**
 将按钮的图片渲染成需要的颜色

 @param imgName 图片名称
 @param color 渲染的颜色值
 */
+ (UIButton *)cz_colorButtonWithImgName:(NSString *)imgName rendColor:(UIColor *)color;

@end
