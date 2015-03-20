//
//  UITabBarController+Extention.h
//  Sina
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Extention)
-(void )addChildController :(UIViewController *)controller title:(NSString *)title norImg:(NSString *)img selectedImg:(NSString *)sImg;
@end
