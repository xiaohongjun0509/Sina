//
//  HJEmotionList.m
//  Sina
//
//  Created by xhj on 15-3-29.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJEmotionList.h"

@implementation HJEmotionList

-(instancetype)init
{
    if (self =[super init]) {
        self.frame = CGRectMake(0, 0, SCREENWIDTH, 221);
        self.backgroundColor  = [UIColor redColor];
        self.pageControl = [[UIPageControl alloc] init];
//        self.pageControl.currentPage = [UIImage imageNamed:];
        [self addSubview:self.pageControl];
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.frame.size.height)];
        
        
        
    }
    return self;
}




-(void)setEmotions:(NSArray *)emotions
{
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.numberOfPages = emotions.count;
    //设置键盘的表情
}

@end
