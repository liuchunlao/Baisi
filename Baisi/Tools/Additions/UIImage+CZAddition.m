//
//  UIImage+CZAddition.m
//  ZhangXin
//
//  Created by liuchunlao on 2017/4/11.
//  Copyright © 2017年 BeiJingYinChuang. All rights reserved.
//

#import "UIImage+CZAddition.h"

@implementation UIImage (CZAddition)

+ (UIImage *)cz_image:(UIImage*)image byScale:(CGFloat)scale {
    
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    CGFloat width = sourceImage.size.width * scale;
    CGFloat height = sourceImage.size.height * scale;
    
    CGSize targetSize = CGSizeMake(width, height);
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}

+ (UIImage *)cz_imageWithColor:(UIColor *)color {
    return [self cz_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)cz_imageWithColor:(UIColor *)color size:(CGSize)size {
    
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)cz_originalImageName:(NSString *)name {

    UIImage *img = [UIImage imageNamed:name];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)cz_stretchImageWithName:(NSString *)imgName {

    UIImage *img = [UIImage imageNamed:imgName];
    return [img stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.5];
}

+ (UIImage *)cz_roundImageFromImage:(UIImage *)image borderColor:(UIColor *)color borderWidth:(CGFloat)width {
        
    // 1 裁剪出正方形
    CGSize orgSize = image.size;
    // 计算目标区域
    CGFloat destW;
    CGFloat destX;
    CGFloat destY;
    
    if (orgSize.width > orgSize.height) {
        destW = orgSize.height;
        destY = 0;
        destX = (orgSize.width - orgSize.height) * 0.5;
        
    } else {
        destW = orgSize.width;
        destX = 0;
        destY = (orgSize.height - orgSize.width) * 0.5;
    }
    
    CGRect destRect = CGRectMake(destX, destY, destW, destW);
    
    CGImageRef imgRef = CGImageCreateWithImageInRect(image.CGImage, destRect);
    UIImage *destImg = [[UIImage alloc] initWithCGImage:imgRef];
    
    CGImageRelease(imgRef);
    
    // 2 绘制边框
    CGSize cxtSize = CGSizeMake(100, 100);
    
    UIGraphicsBeginImageContextWithOptions(cxtSize, NO, 0.0);
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width * 0.5, width * 0.5, cxtSize.width - width, cxtSize.height - width) cornerRadius:4];
    path.lineWidth = width;
    [color set];
    [path stroke];
    
    // 3 裁剪区域
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width, width, cxtSize.width - width * 2, cxtSize.height - width * 2) cornerRadius:3];
    path2.lineWidth = 1;
    CGContextAddPath(cxt, path2.CGPath);
    CGContextClip(cxt);
    
    // 4 画图生成图片
    [destImg drawInRect:CGRectMake(0, 0, cxtSize.width, cxtSize.height)];
    UIImage *smallImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return smallImg;
}

@end
