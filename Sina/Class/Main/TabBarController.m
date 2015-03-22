//
//  TabBarController.m
//  Sina
//
//  Created by xhj on 15-3-8.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "TabBarController.h"
#import "HomeController.h"
#import "MessageController.h"
#import "NavigationController.h"
#import "MeController.h"
#import "DiscoveryController.h"
#import "UITabBarController+Extention.h"
#import "Tabbar.h"
#import "ComposeMessageController.h"
#import "HJHttpTool.h"
#import "UnreadModal.h"

@interface TabBarController ()

@property(nonatomic,strong)UIViewController *lastSecectedController;
@property (nonatomic,strong) HomeController *home;
@end

@implementation TabBarController


-(void)repeatUpdateStatus
{
    NSTimer *timer= [NSTimer timerWithTimeInterval:2.0f target:self selector:@selector(updateStatus) userInfo:nil repeats:YES];
    [timer fire];
}

-(void)updateStatus
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:ACCESSTOKEN forKey:@"access_token"];
    [dict setValue:UID forKey:@"uid"];
    [HJHttpTool get:@"https://rm.api.weibo.com/2/remind/unread_count.json" params:dict success:^(id result) {
        UnreadModal *unreadModal = [[UnreadModal alloc] initWithDict:result];
        if (unreadModal.status) {
            self.home.tabBarItem.badgeValue =  unreadModal.status;
        }else{
            self.home.tabBarItem.badgeValue =  nil;
        }
    } fail:^(NSError *error) {
        
    }];
}


-(instancetype)init
{
   self = [super init];
    if (self) {
        
        self.home  = [[HomeController alloc] init];
        
        [self addChildController:self.home title:@"首页" norImg: @"tabbar_home" selectedImg:@"tabbar_home_selected"];
        
        MessageController *message = [[MessageController alloc] init];
        [self addChildController:message title:@"消息" norImg:@"tabbar_message_center" selectedImg:@"tabbar_message_center_selected"];
        
        DiscoveryController *disc = [[DiscoveryController alloc] init];
        
        
        [self addChildController:disc title:@"发现" norImg:@"tabbar_discover" selectedImg:@"tabbar_discover_selected"];
        MeController *me = [[MeController alloc] init];
        [self addChildController:me title:@"我" norImg:@"tabbar_profile" selectedImg:@"tabbar_profile_selected"];
        
        
        Tabbar *tabBar = [[Tabbar alloc] initWithFrame:[UIScreen mainScreen].bounds];
        tabBar.plusDelegate = self;
//        tabBar.backgroundColor = [UIColor redColor];
        tabBar.selectedImageTintColor = [UIColor grayColor];
        [self setValue:tabBar forKey:@"tabBar"];
        self.lastSecectedController = self.home;
        self.delegate = self;
        [self repeatUpdateStatus];
    }
    return self;
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self removeTabBarBackground];
}


-(void)removeTabBarBackground
{
    for (UIView *child in self.tabBar.subviews)
    {
        if (![child isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        
        BOOL selected  = NO;
        
        for (UIView  *childchild in child.subviews) {
            if ([childchild isKindOfClass:NSClassFromString(@"UITabBarSelectionIndicatorView")])
            {
                [childchild removeFromSuperview];
                selected = YES;
                
            }
            if ([childchild isKindOfClass:[UILabel class]])
            {
                UILabel *label = (UILabel *)childchild;
                if (selected) {
                    label.textColor = [UIColor redColor];
                }else{
                    label.textColor = [UIColor orangeColor];
                }
            }
        }
    }

    
   }

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    NSLog(@"%@",item);
//    NSInteger index = self.selectedIndex;
//    switch (index) {
//        case 0://选中的是首页
//            
//            break;
//            
//        default:
//            break;
//    }
    [self removeTabBarBackground];
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UINavigationController *nav = (UINavigationController *)viewController;//添加到TabBarController中的都是NC，所以可以进行类型的转换
    if (self.lastSecectedController == nav.topViewController) {
        //双击了首页，判断是回到第一行还是刷新数据。
         UIViewController *controller =  self.lastSecectedController;
        if([controller isKindOfClass:[HomeController class]])
        {
            //刷新数据的操作
           HomeController *castController =  (HomeController *)controller;
            if (self.lastSecectedController.tabBarItem.badgeValue != 0) {
                
                [castController showRefreshControl];
            }else{
                //回到第一行
                [castController UpToTop];
            }

        }
    }
    self.lastSecectedController = nav.topViewController;
}

-(void)plusButtonClick
{
//    Modal 弹出

    ComposeMessageController *controller = [[ComposeMessageController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
//    nav.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
//    controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
//
//    controller.navigationItem.title = @"发消息";
    //为什么leftBarButtonItem在这里设置会无效呢？
    [self presentViewController:nav animated:YES completion:nil];
    
}




@end
