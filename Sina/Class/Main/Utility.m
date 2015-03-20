//
//  Utility.m
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "Utility.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@implementation Utility


+(BOOL)IOS7
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >=7.0? YES:NO;
}


@end
