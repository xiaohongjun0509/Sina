//
//  HJTooView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJTooView.h"

@implementation HJTooView
-(instancetype)init
{
    if (self =[super init])
    {
//        self.frame = CGRectMake(0, 0, SCREENWIDTH, 35);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 35)];
        label.backgroundColor = [UIColor blueColor];
        [self addSubview:label];
    }
    return self;
}

@end
