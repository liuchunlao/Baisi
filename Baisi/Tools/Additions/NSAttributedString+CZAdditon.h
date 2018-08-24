//
//  NSAttributedString+CZAdditon.h
//  Zhifubao
//
//  Created by 刘凡 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (CZAdditon)

/**
 修改字符串效果
 
 @param attr 总体效果
 @param str 总字符串
 @param subAttr 某个位置效果
 @param subStr 某个位置的字符串
 */
+ (NSAttributedString *)cz_attr:(NSDictionary *)attr ForString:(NSString *)str subAttr:(NSDictionary *)subAttr forSubStringt:(NSString *)subStr;


/// 使用图像和文本生成上下排列的属性文本
///
/// @param image      图像
/// @param imageWH    图像宽高
/// @param title      标题文字
/// @param fontSize   标题字体大小
/// @param titleColor 标题颜色
/// @param spacing    图像和标题间距
///
/// @return 属性文本
+ (instancetype)cz_imageTextWithImage:(UIImage *)image
                              imageWH:(CGFloat)imageWH
                                title:(NSString *)title
                             fontSize:(CGFloat)fontSize
                           titleColor:(UIColor *)titleColor
                              spacing:(CGFloat)spacing;
/**
 将文字特殊化显示
 @param string 原文本内容
 @param range 范围1
 @param dicts 效果1
 @param range2 范围2
 @param dicts2 效果2
 */
+ (NSAttributedString *)cz_attrStringWithString:(NSString *)string range:(NSRange)range attrs:(NSDictionary *)dicts range2:(NSRange)range2 attrs2:(NSDictionary *)dicts2;


/**
 占位特效文字

 @param preStr 前缀
 @param placeholder 文字内容
 */
+ (NSAttributedString *)cz_attrStringWithPrefixStr:(NSString *)preStr placeholder:(NSString *)placeholder;
@end
