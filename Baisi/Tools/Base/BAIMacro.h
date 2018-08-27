//
//  BAIMacro.h
//  QMZhengXin
//
//  Created by liuchunlao on 2017/12/25.
//  Copyright © 2017年 liuchunlao. All rights reserved.
//

#ifndef BAIMacro_h
#define BAIMacro_h

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// MARK: - 通知
// 登录
#define BAI_USER_LOGIN_NOTI              @"BAI_USER_LOGIN_NOTI"
// 退出
#define BAI_USER_LOGOUT_NOTI             @"BAI_USER_LOGOUT_NOTI"

// 选择开户行
#define BAI_SELECT_KHH                   @"BAI_SELECT_KHH"

// MARK: - 预约电话
#define BAI_SERVICE_TEL     @"4006505933"

// MARK: - 弱引用
#define BAIWeakSelf __weak typeof(self) weakSelf = self;

// MARK: - 屏幕信息
#define kSH [UIScreen mainScreen].bounds.size.height
#define kSW [UIScreen mainScreen].bounds.size.width

// MARK: - 主颜色
#define BAIRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kBg BAIRGBACOLOR(246,246,246,1)
#define BAIRedColor BAIRGBACOLOR(242, 72, 72, 1)

#define BAIThemeRedColor BAIRGBACOLOR(192, 0, 0, 1)

// MARK: - 网络错误提示语
#define kNetWorkErrorMsg @"连接失败，请检查网络设置"
// MARK: - 接口返回 0000 代表成功  mes 返回提示语
#define kNetCode            @"100"
#define kMessage            @"msg"
#define kCode               @"code"
#define kResults            @"results"

// MARK: - 获取验证码倒计时时间
#define kCountDown 60

// MARK: - 渠道号
#define CHANNEL @"10000"

// MARK: - 列表数据的单页数量
#define kPageSize 10

// MARK: - 输出
//#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__)
//#else
//#define NSLog(...)
//#endif

// MARK: - 字体
#define BAIFont(size)  [UIFont systemFontOfSize:size]


#endif
