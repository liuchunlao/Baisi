//
//  UIView+CZAddition.m
//  003-小画板
//
//  Created by 刘凡 on 16/5/11.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "UIView+CZAddition.h"

@implementation UIView (CZAddition)

-(void)cz_setFTCornerdious:(CGFloat)cornerdious{
    
    
    self.layer.cornerRadius = cornerdious;
    
    self.layer.masksToBounds = YES;
    
}

-(void)cz_setFTBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    
}

- (void)setCz_x:(CGFloat)cz_x {

    CGRect frame = self.frame;
    frame.origin.x = cz_x;
    self.frame = frame;
}

- (void)setCz_y:(CGFloat)cz_y {
    
    CGRect frame = self.frame;
    frame.origin.y = cz_y;
    self.frame = frame;
}

- (void)setCz_width:(CGFloat)cz_width {
    
    CGRect frame = self.frame;
    frame.size.width = cz_width;
    self.frame = frame;
}

- (void)setCz_height:(CGFloat)cz_height {
    
    CGRect frame = self.frame;
    frame.size.height = cz_height;
    self.frame = frame;
}

- (CGFloat)cz_x {
    
    return self.frame.origin.x;
}

- (CGFloat)cz_y {

    return self.frame.origin.y;
}

- (CGFloat)cz_width {

    return self.frame.size.width;
}

- (CGFloat)cz_height {

    return self.frame.size.height;
}


- (UIImage *)cz_snapshotImage {

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
