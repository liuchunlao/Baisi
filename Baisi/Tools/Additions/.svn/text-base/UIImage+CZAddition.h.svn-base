//
//  UIImage+CZAddition.h
//  ZhangXin
//
//  Created by liuchunlao on 2017/4/11.
//  Copyright © 2017年 BeiJingYinChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CZAddition)


+ (UIImage *)cz_imageWithColor:(UIColor *)color size:(CGSize)size;
/**
 图片压缩
 */
+ (UIImage *)cz_image:(UIImage*)image byScale:(CGFloat)scale;

/**
 通过颜色生成图片
 */
+ (UIImage *)cz_imageWithColor:(UIColor *)color;

/**
 加载原始图片，避免被渲染
 */
+ (UIImage *)cz_originalImageName:(NSString *)name;

/**
 拉伸图片
 */
+ (UIImage *)cz_stretchImageWithName:(NSString *)imgName;


/**
 将图片剪出圆角矩形效果
 
 @param image 原始图片
 @param color 边框颜色
 @param width 边框宽度
 */
+ (UIImage *)cz_roundImageFromImage:(UIImage *)image borderColor:(UIColor *)color borderWidth:(CGFloat)width;



@end
