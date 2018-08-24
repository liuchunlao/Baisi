//
//  NSAttributedString+CZAdditon.m
//  Zhifubao
//
//  Created by 刘凡 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NSAttributedString+CZAdditon.h"
#import "UIColor+CZAddition.h"

@implementation NSAttributedString (CZAdditon)

/**
 修改字符串效果
 
 @param attr 总体效果
 @param str 总字符串
 @param subAttr 某个位置效果
 @param subStr 某个位置的字符串
 */
+ (NSAttributedString *)cz_attr:(NSDictionary *)attr ForString:(NSString *)str subAttr:(NSDictionary *)subAttr forSubStringt:(NSString *)subStr {
    
    if (![str containsString:subStr] || str.length == 0) {
        return nil;
    }
    
    NSMutableAttributedString *attrM = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange r = NSMakeRange(0, 0);
    if (subStr.length > 0) {
        r = [str rangeOfString:subStr];
        [attrM addAttributes:attr range:NSMakeRange(0, str.length)];
    }
    [attrM addAttributes:subAttr range:r];
    
    return attrM.copy;
}

+ (instancetype)cz_attrStringWithString:(NSString *)string range:(NSRange)range attrs:(NSDictionary *)dicts range2:(NSRange)range2 attrs2:(NSDictionary *)dicts2 {
    
    NSMutableAttributedString *attrstrM = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attrstrM addAttributes:dicts range:range];
    [attrstrM addAttributes:dicts2 range:range2];
    
    return attrstrM.copy;
}

+ (instancetype)cz_imageTextWithImage:(UIImage *)image imageWH:(CGFloat)imageWH title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor spacing:(CGFloat)spacing {
    
    // 文本字典
    NSDictionary *titleDict = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                NSForegroundColorAttributeName: titleColor};
    NSDictionary *spacingDict = @{NSFontAttributeName: [UIFont systemFontOfSize:spacing]};
    
    // 图片文本
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, 0, imageWH, imageWH);
    NSAttributedString *imageText = [NSAttributedString attributedStringWithAttachment:attachment];
    
    // 换行文本
    NSAttributedString *lineText = [[NSAttributedString alloc] initWithString:@"\n\n" attributes:spacingDict];
    
    // 按钮文字
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:title attributes:titleDict];
    
    // 合并文字
    NSMutableAttributedString *attM = [[NSMutableAttributedString alloc] initWithAttributedString:imageText];
    [attM appendAttributedString:lineText];
    [attM appendAttributedString:text];
    
    return attM.copy;
}


+ (NSAttributedString *)cz_attrStringWithPrefixStr:(NSString *)preStr placeholder:(NSString *)placeholder {
    
    if (placeholder.length <= 0) {
        return nil;
    }
    
    NSMutableAttributedString *attrM = [[NSMutableAttributedString alloc] initWithString:[preStr stringByAppendingString:placeholder]];
    
    if (preStr.length > 0) {
        [attrM addAttributes:@{
                               NSForegroundColorAttributeName : [UIColor cz_colorWithHex:0xf24848],
                               
                               } range:NSMakeRange(0, preStr.length)];
    }
    [attrM addAttributes:@{
                           NSForegroundColorAttributeName : [UIColor cz_colorWithHex:0x999999],
                           NSFontAttributeName : [UIFont systemFontOfSize:14]
                           } range:NSMakeRange(preStr.length, placeholder.length)];
    
    return attrM.copy;
    
}

@end
