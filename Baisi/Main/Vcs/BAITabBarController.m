//
//  BAITabBarController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITabBarController.h"
#import "BAINavigationController.h"
#import "BAIEssenseController.h"
#import "BAINewController.h"
#import "BAIFocusController.h"
#import "BAIMeController.h"
#import "BAITabBar.h"

@interface BAITabBarController ()

@end

@implementation BAITabBarController

+ (void)initialize {
    
    UITabBarItem *item = UITabBarItem.appearance;
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.grayColor} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.darkGrayColor} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVcs];
}

- (void)setupChildVcs {
    
    [self chideVc:[[BAIEssenseController alloc] init] title:@"精彩" imgName:@"tabBar_essence_icon" selImgName:@"tabBar_essence_click_icon"];
    [self chideVc:[[BAINewController alloc] init] title:@"最新" imgName:@"tabBar_new_icon" selImgName:@"tabBar_new_click_icon"];
    [self chideVc:[[BAIFocusController alloc] init] title:@"关注" imgName:@"tabBar_friendTrends_icon" selImgName:@"tabBar_friendTrends_click_icon"];
    [self chideVc:[[BAIMeController alloc] init] title:@"我" imgName:@"tabBar_me_icon" selImgName:@"tabBar_me_click_icon"];
    
    [self setValue:[[BAITabBar alloc] init] forKey:@"tabBar"];
}

- (void)chideVc:(UIViewController *)vc title:(NSString *)title imgName:(NSString *)imgName selImgName:(NSString *)selImgName {
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage cz_originalImageName:imgName];
    vc.tabBarItem.selectedImage = [UIImage cz_originalImageName:selImgName];
    
    BAINavigationController *nav = [[BAINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
