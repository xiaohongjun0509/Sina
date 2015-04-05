//
//  HJEmotionToolBar.m
//  Sina
//
//  Created by xhj on 15-3-29.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJEmotionToolBar.h"

@implementation HJEmotionToolBar

-(instancetype)init
{
    if (self = [super init])
    {
        self.frame = CGRectMake(0, 0, SCREENWIDTH, 35);
        self.lxh  =[[ UIButton alloc] init];
        [self addSubview:self.lxh];
        [self.lxh setTitle:@"浪小花" forState:UIControlStateNormal];
        [self.lxh setBackgroundImage:[UIImage imageNamed:@"compose_toolbar_background_os7"] forState:UIControlStateNormal];
        
        self.def  =[[ UIButton alloc] init];
        [self addSubview:self.def];
        [self.def setTitle:@"默认" forState:UIControlStateNormal];
        [self.def setBackgroundImage:[UIImage imageNamed:@"compose_toolbar_background_os7"] forState:UIControlStateNormal];
        
        self.emoji  =[[ UIButton alloc] init];
        [self addSubview:self.emoji];
        [self.emoji setTitle:@"Emoji" forState:UIControlStateNormal];
        [self.emoji setBackgroundImage:[UIImage imageNamed:@"compose_toolbar_background_os7"] forState:UIControlStateNormal];
        
        self.recent  =[[ UIButton alloc] init];
        [self addSubview:self.recent];
        [self.recent setTitle:@"最近" forState:UIControlStateNormal];
        [self.recent setBackgroundImage:[UIImage imageNamed:@"compose_toolbar_background_os7"] forState:UIControlStateNormal];
//        [self.recent setBackgroundImage:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"] forState:UIControlStateHighlighted];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(void)layoutSubviews{
    
    CGFloat  buttonW = SCREENWIDTH / 4;
    CGFloat buttonH  = self.frame.size.height;
    [self.recent setFrame:CGRectMake(0, 0, buttonW, buttonH)];
    [self.def setFrame:CGRectMake(buttonW, 0, buttonW, buttonH)];
    [self.emoji setFrame:CGRectMake(buttonW * 2, 0, buttonW, buttonH)];
    [self.lxh setFrame:CGRectMake(buttonW * 3, 0, buttonW, buttonH)];
    
}

@end
