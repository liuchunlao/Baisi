//
//  UIView+CZAddition.h
//  003-小画板
//
//  Created by 刘凡 on 16/5/11.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CZAddition)

@property (nonatomic, assign) CGFloat cz_x;
@property (nonatomic, assign) CGFloat cz_y;
@property (nonatomic, assign) CGFloat cz_width;
@property (nonatomic, assign) CGFloat cz_height;
@property (nonatomic, assign) CGFloat cz_centerX;
@property (nonatomic, assign) CGFloat cz_centerY;

/// 返回屏幕截图
- (UIImage *)cz_snapshotImage;
-(void)cz_setFTCornerdious:(CGFloat)cornerdious;

-(void)cz_setFTBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
