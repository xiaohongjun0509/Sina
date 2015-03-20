//
//  UITabBarController+Extention.m
//  Sina
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "UITabBarController+Extention.h"
#import "NavigationController.h"
#import "UIImage+Extendion.h"
@implementation UITabBarController (Extention)


-(void )addChildController :(UIViewController *)controller title:(NSString *)title norImg:(NSString *)img selectedImg:(NSString *)sImg
{
    controller.title = title;
    controller.tabBarItem.image =[UIImage imageWithName:img];
    controller.tabBarItem.selectedImage = [UIImage imageWithName:sImg];
    NavigationController *nc = [[NavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nc];
//    return [[NavigationController alloc] initWithRootViewController:controller];
    
}

@end
