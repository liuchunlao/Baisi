//
//  NSString+CZAddition.h
//  ZhangXin
//
//  Created by liuchunlao on 2017/5/16.
//  Copyright © 2017年 BeiJingYinChuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CZAddition)

/**
 去掉字符串两端的空格
 */
+ (NSString *)cz_stringByDelWhitespace:(NSString *)string;

/**
 去掉字符串两端的空格及回车！
 */
+ (NSString *)cz_stringByDelWhitespaceAndEnter:(NSString *)string;

/**
 去掉所有的回车符及空格
 */
+ (NSString *)cz_stringByDelAllSpaceAndEnter:(NSString *)string;

/**
 社会信用代码校验
 */
+ (BOOL)cz_checkSocialCredit18Number:(NSString *)socialCreditNum;

/**
 手机号校验
 */
+ (BOOL)cz_checkTelephone:(NSString *)tel;

/**
 身份证校验
 */
+ (BOOL)cz_checkIsIdentityCard: (NSString *)identityCard;

/**
 电话号码显示格式转换
 @param telephone 电话号码
 xxxxxxxxxx -> xxx-xxx-xxxx
 */
+ (NSString *)cz_stringForTelephone:(NSString *)telephone;
- (NSString *)cz_stringForTelephone;


/**
 处理后台返回的时间

 @param interval 发表时间
 @return yyyy-MM-dd HH:mm   年-月-日 时:分
 */
+ (NSString *)cz_stringFromTimeIntervalSince1970:(NSTimeInterval)interval
                                dateFormatter:(NSString *)dateFormatter;


/**
 利用NSDecimalNumber处理精度丢失问题
 */
+(NSString *)cz_reviseString:(NSString *)string;

@end
