//
//  HJEmotionGridView.m
//  Sina
//
//  Created by xhj on 15/4/6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJEmotionGridView.h"

#define kMaxCountPerPage  21
#define padding 5
#define EmotionW 40
#define kMaxCountPerLine 7
@implementation HJEmotionGridView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        for (int  i = 0; i < kMaxCountPerPage; i++) {
            HJEmotionView *view = [[HJEmotionView alloc] init];
            [self addSubview:view];
        }
    }
    return self;
}




-(void)setEmotions:(NSArray *)emotions
{
    for (int i = 0; i < emotions.count; i ++) {
        UILabel  *view = [self.subviews objectAtIndex:i];
        view.backgroundColor = [UIColor yellowColor];
        view.text = [NSString stringWithFormat:@"%d",i];
    }
    
    for (int i = (int)emotions.count; i < kMaxCountPerPage; i ++) {
        ((UIView *)[self.subviews objectAtIndex:i]).hidden = YES;
    }
    [self layoutIfNeeded];
}

-(void)layoutSubviews
{
    
    for (int i = 0; i < kMaxCountPerPage; i ++) {
        //col 列   row 行
        int row = i / kMaxCountPerLine;
        int col = i % kMaxCountPerLine;
        CGFloat x = padding *(col + 1) + EmotionW * col;
        CGFloat y = padding *(row + 1) +EmotionW * row;
        UILabel *label = [self.subviews objectAtIndex:i];
        [label setFrame:CGRectMake(x, y, EmotionW, EmotionW)];
    }
}


@end
