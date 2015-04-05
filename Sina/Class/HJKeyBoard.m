//
//  HJKeyBoard.m
//  Sina
//
//  Created by xhj on 15-3-29.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJKeyBoard.h"

@implementation HJKeyBoard

-(instancetype)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, SCREENWIDTH, 256);
        self.emotionList = [[HJEmotionList alloc]init];
        [self addSubview:self.emotionList];
        self.toolBar = [[HJEmotionToolBar alloc] init];
        [self.toolBar setFrame:CGRectMake(0, self.frame.size.height - self.toolBar.frame.size.height, SCREENWIDTH, self.toolBar.frame.size.height)];
        
        [self addSubview:self.toolBar];
    }
    return self;
}

@end
