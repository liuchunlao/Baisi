//
//  NSString+CZAddition.m
//  ZhangXin
//
//  Created by liuchunlao on 2017/5/16.
//  Copyright © 2017年 BeiJingYinChuang. All rights reserved.
//

#import "NSString+CZAddition.h"

@implementation NSString (CZAddition)

/**
 去掉字符串两端的空格
 */
+ (NSString *)cz_stringByDelWhitespace:(NSString *)string {
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
 去掉字符串两端的空格及回车！
 */
+ (NSString *)cz_stringByDelWhitespaceAndEnter:(NSString *)string {
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 去掉所有的回车符及空格
 */
+ (NSString *)cz_stringByDelAllSpaceAndEnter:(NSString *)string {
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/**
 社会信用代码校验
 */
+ (BOOL)cz_checkSocialCredit18Number:(NSString *)socialCreditNum {
    if(socialCreditNum.length != 18){
        return NO;
    }
    
    NSString *scN = @"^([0-9ABCDEFGHJKLMNPQRTUWXY]{2})([0-9]{6})([0-9ABCDEFGHJKLMNPQRTUWXY]{9})([0-9Y])$";
    NSPredicate *regextestSCNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", scN];
    if (![regextestSCNum evaluateWithObject:socialCreditNum]) {
        return NO;
    }
    
    NSArray *ws = @[@1,@3,@9,@27,@19,@26,@16,@17,@20,@29,@25,@13,@8,@24,@10,@30,@28];
    NSDictionary *zmDic = @{@"A":@10,@"B":@11,@"C":@12,@"D":@13,@"E":@14,@"F":@15,@"G":@16,@"H":@17,@"J":@18,@"K":@19,@"L":@20,@"M":@21,@"N":@22,@"P":@23,@"Q":@24,@"R":@25,@"T":@26,@"U":@27,@"W":@28,@"X":@29,@"Y":@30};
    NSMutableArray *codeArr = [NSMutableArray array];
    NSMutableArray *codeArr2 = [NSMutableArray array];
    
    codeArr[0] = [socialCreditNum substringWithRange:NSMakeRange(0,socialCreditNum.length-1)];
    codeArr[1] = [socialCreditNum substringWithRange:NSMakeRange(socialCreditNum.length-1,1)];
    
    int sum = 0;
    
    for (int i = 0; i < [codeArr[0] length]; i++) {
        
        [codeArr2 addObject:[codeArr[0] substringWithRange:NSMakeRange(i, 1)]];
    }
    
    NSScanner* scan;
    int val;
    for (int j = 0; j < codeArr2.count; j++) {
        scan = [NSScanner scannerWithString:codeArr2[j]];
        if (![scan scanInt:&val] && ![scan isAtEnd]) {
            codeArr2[j] = zmDic[codeArr2[j]];
        }
    }
    
    
    for (int x = 0; x < codeArr2.count; x++) {
        sum += [ws[x] intValue]*[codeArr2[x] intValue];
    }
    
    
    int c18 = 31 - (sum % 31);
    
    for (NSString *key in zmDic.allKeys) {
        
        if (zmDic[key]==[NSNumber numberWithInt:c18]) {
            if (![codeArr[1] isEqualToString:key]) {
                return NO;
            }
        }
    }
    
    return YES;
}

/**
 手机号校验
 */
+ (BOOL)cz_checkTelephone:(NSString *)tel {
    
    NSString *Regex = @"1\\d{10}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    
    return [emailTest evaluateWithObject:tel];
    
}

//身份证号
+ (BOOL)cz_checkIsIdentityCard: (NSString *)identityCard
{
    //判断是否为空
    if (identityCard==nil||identityCard.length <= 0) {
        return NO;
    }
    //判断是否是18位，末尾是否是x
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    if(![identityCardPredicate evaluateWithObject:identityCard]){
        return NO;
    }
    //判断生日是否合法
    NSRange range = NSMakeRange(6,8);
    NSString *datestr = [identityCard substringWithRange:range];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"yyyyMMdd"];
    if([formatter dateFromString:datestr]==nil){
        return NO;
    }
    
    //判断校验位
    if(identityCard.length==18)
    {
        NSArray *idCardWi= @[ @"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2" ]; //将前17位加权因子保存在数组里
        NSArray * idCardY=@[ @"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2" ]; //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        int idCardWiSum=0; //用来保存前17位各自乖以加权因子后的总和
        for(int i=0;i<17;i++){
            idCardWiSum+=[[identityCard substringWithRange:NSMakeRange(i,1)] intValue]*[idCardWi[i] intValue];
        }
        
        int idCardMod=idCardWiSum%11;//计算出校验码所在数组的位置
        NSString *idCardLast=[identityCard substringWithRange:NSMakeRange(17,1)];//得到最后一位身份证号码
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2){
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]){
                return YES;
            }else{
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast intValue]==[idCardY[idCardMod] intValue]){
                return YES;
            }else{
                return NO;
            }
        }
    }
    return NO;
}

+(NSString *)cz_reviseString:(NSString *)string {
    
    /* 直接传入精度丢失有问题的Double类型*/
    double conversionValue        = (double)[string floatValue];
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

// MARK: - 将电话号码按照 xxx-xxx-xxxx格式显示
+ (NSString *)cz_stringForTelephone:(NSString *)telephone {
    
    if ([telephone containsString:@"-"]) {
        return telephone;
    }
    
    NSUInteger length = telephone.length;
    
    NSInteger margin = 3;
    
    // 倍数
    NSInteger times = length / margin;
    // 余数
    NSInteger reminder = length % margin;
    
    // 如果余数 < 3; 横线减一
    if (reminder < margin) {
        times--;
    }
    NSMutableArray *tempArrM = [NSMutableArray array];
    for (int i = 0; i < times; i++) {
        NSString *tempStr = [telephone substringWithRange:NSMakeRange(i * margin, margin)];
        
        [tempArrM addObject:tempStr];
    }
    NSString *lastStr = [telephone substringFromIndex:times * margin];
    [tempArrM addObject:lastStr];
    
    // 拼接横线！
    NSMutableString *strM = [NSMutableString string];
    [tempArrM enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [strM appendFormat:@"%@-", obj];
    }];
    // 去掉最后一根横线
    return [strM substringToIndex:(strM.length - 1)];
    
}

- (NSString *)cz_stringForTelephone {
    
    return [NSString cz_stringForTelephone:self];
}

// MARK: - 处理后台返回的时间 年 月 日 xxxx-xx-xx
+ (NSString *)cz_stringFromTimeIntervalSince1970:(NSTimeInterval)interval
                                dateFormatter:(NSString *)dateFormatter {
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = dateFormatter;
    
    return [fmt stringFromDate:date];
}


@end
