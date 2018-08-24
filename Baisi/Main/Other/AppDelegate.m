//
//  AppDelegate.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "AppDelegate.h"
#import "BAITabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] init];
    _window.frame = UIScreen.mainScreen.bounds;
    
    _window.rootViewController = [[BAITabBarController alloc] init];
    
    [_window makeKeyAndVisible];
    
    return YES;
}





@end
