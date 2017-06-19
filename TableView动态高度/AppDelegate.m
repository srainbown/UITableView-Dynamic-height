//
//  AppDelegate.m
//  TableView动态高度
//
//  Created by 李自杨 on 2017/4/26.
//  Copyright © 2017年 View. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DiscoverViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //首页
    MainViewController *mainVC = [[MainViewController alloc]init];
    UINavigationController *mainNavi = [[UINavigationController alloc]initWithRootViewController:mainVC];
    mainVC.tabBarItem.title = @"Main";
    mainVC.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_home_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //发现
    DiscoverViewController *disVC = [[DiscoverViewController alloc]init];
    UINavigationController *disNavi = [[UINavigationController alloc]initWithRootViewController:disVC];
    disVC.tabBarItem.title = @"Discover";
    disVC.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_discover_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    disVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_discover_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    mainVC.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_home_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //TabBar
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    tabBar.viewControllers = @[mainNavi,disNavi];
    
    self.window.rootViewController = tabBar;
    
    return YES;
}


@end
