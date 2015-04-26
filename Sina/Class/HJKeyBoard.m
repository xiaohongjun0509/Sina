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
        self.toolBar.delegate = self;
        [self addSubview:self.toolBar];
        self.emotionList.emotions = self.emotions;
    }
    return self;
}

-(void)toolBarButtonClick:(UIButton *)button
{
    switch (button.tag) {
        case HJEmotionButtonTypeRecent:
            self.emotionList.emotions = self.emotions;
            break;
        case HJEmotionButtonTypeLxh:
            self.emotionList.emotions = self.emotions;
            break;
        case HJEmotionButtonTypeDef:
            self.emotionList.emotions = self.emotions;
            break;
        case HJEmotionButtonTypeEmoji:
            self.emotionList.emotions = self.emotions;
            break;
        
    }
}


-(NSMutableArray *)emotions
{
    if (_emotions ==nil) {
        self.emotions = [NSMutableArray array];
        for (int i = 0; i<90; i ++) {
            [_emotions addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _emotions;
}
@end
