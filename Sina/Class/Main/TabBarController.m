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

@implementation TabBarController



-(instancetype)init
{
   self = [super init];
    if (self) {
        
        HomeController *home = [[HomeController alloc] init];
        
        [self addChildController:home title:@"首页" norImg: @"tabbar_home" selectedImg:@"tabbar_home_selected"];
        
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
    
    [self removeTabBarBackground];
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
