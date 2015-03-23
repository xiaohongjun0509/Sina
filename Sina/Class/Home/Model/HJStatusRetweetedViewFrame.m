//
//  HJStatusRetweetedViewFrame.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusRetweetedViewFrame.h"

@implementation HJStatusRetweetedViewFrame


-(instancetype)initWithModel:(HJStatusModel *)model
{
    if (self = [super init]) {
        //为什么在这里闪退
        
        NSLog(@"name---- %@",model.user.name);
        CGSize nameSize  = [model.user.name sizeWithFont:NameFont constrainedToSize:CGSizeMake(100, 20)];
        self.nameFrame = CGRectMake(PaddingInset, PaddingInset, nameSize.width, nameSize.height);
        CGSize introSize = [model.text sizeWithFont:IntroFont constrainedToSize:CGSizeMake(SCREENWIDTH - 20, MAXFLOAT)];
        self.introFrame = CGRectMake(PaddingInset, CGRectGetMaxY(self.nameFrame)+10, introSize.width, introSize.height);
        self.retweentedHeight = CGRectGetMaxY(self.introFrame);
    }
    return self;
}

@end
