//
//  AppDelegate.m
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "AppDelegate.h"
#import "UITabBarController+Extention.h"
#import "HomeController.h"
#import "MessageController.h"
#import "NavigationController.h"
#import "MeController.h"
#import "DiscoveryController.h"
#import "AuthorizationController.h"
#import "TabBarController.h"
#import "NewFeatureController.h"
@interface AppDelegate ()

@end
NSString *versionKey = @"CFBundleVersion";
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //成为主窗口
    [self.window makeKeyAndVisible];
//    NSLog(@"app window %@",self.window);
//    [self loadAuthorizationController];
    
    
    //不同的版本需要现实版本的新特性。利用版本号来判断
  
  /*  NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",userDefault);
    NSString * lastVersion = [userDefault objectForKey:versionKey];
    
    NSString * newVersion =  [NSBundle mainBundle].infoDictionary[versionKey];
    if (![newVersion isEqualToString:lastVersion]) {
        [self loadNewFeatureController];
    }else{
        [self loadTabBarController];
    }
   */
    [self loadTabBarController];
    return YES;
}




/**
 *  加载TabBarController
 */
-(void)loadTabBarController{
    TabBarController *controller = [[TabBarController alloc] init];
    
//    HomeController *home = [[HomeController alloc] init];
//    
//    [controller addChildController:home title:@"首页" norImg: @"tabbar_home" selectedImg:@"tabbar_home_selected"];
//    
//    MessageController *message = [[MessageController alloc] init];
//    [controller addChildController:message title:@"消息" norImg:@"tabbar_message_center" selectedImg:@"tabbar_message_center_selected"];
//    
//    DiscoveryController *disc = [[DiscoveryController alloc] init];
//    
//    
//    [controller addChildController:disc title:@"发现" norImg:@"tabbar_discover" selectedImg:@"tabbar_discover_selected"];
//    MeController *me = [[MeController alloc] init];
//    [controller addChildController:me title:@"我" norImg:@"tabbar_profile" selectedImg:@"tabbar_profile_selected"];
//    
//    
//    
//    
//    
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];

}


-(void)loadNewFeatureController
{
     NewFeatureController *controller  = [[NewFeatureController alloc] init];
    self.window.rootViewController = controller;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [self.window makeKeyAndVisible];
     [userDefaults setObject:[NSBundle mainBundle].infoDictionary[versionKey] forKey:versionKey];
    //确保马上写入
    [userDefaults synchronize];
}


-(void)addSearchBar
{
    
}

-(void)loadAuthorizationController
{
    
    self.window.rootViewController  =[[AuthorizationController alloc] init];
//    [self.window makeKeyAndVisible];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
