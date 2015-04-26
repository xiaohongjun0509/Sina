//
//  HJEmotionList.m
//  Sina
//
//  Created by xhj on 15-3-29.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJEmotionList.h"
#import  "HJEmotionGridView.h"
#define kMaxCountPerPage 21

@implementation HJEmotionList

-(instancetype)init
{
    if (self =[super init]) {
        self.frame = CGRectMake(0, 0, SCREENWIDTH, 221);
        self.backgroundColor  = [UIColor redColor];
        self.pageControl = [[UIPageControl alloc] init];
//        self.pageControl.currentPage = [UIImage imageNamed:];
        [self addSubview:self.pageControl];
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator =YES;
        self.scrollView.bounces = YES;
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
//        self.emotions = [NSMutableArray array];
//        for (int i = 0; i<90; i ++) {
//            [_emotions addObject:[NSString stringWithFormat:@"%d",i]];
//        }
    }
    return self;
}


-(void)setEmotions:(NSArray *)emotions
{
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.numberOfPages = emotions.count;
   
    //设置键盘的表情
    NSInteger  pages = (emotions.count + kMaxCountPerPage  -1) /kMaxCountPerPage;
    NSInteger currentPageCount = self.scrollView.subviews.count;
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH *pages, 0);
    for (int i = 0; i < pages; i ++) {
        
        if (currentPageCount <= i) {//说明当前的显示的View不够，希望添加
            HJEmotionGridView *gridView = [[HJEmotionGridView alloc] initWithFrame:CGRectMake(i *SCREENWIDTH, 0, SCREENWIDTH, 210)];
            
            //设置每个gridView要现实的表情
            int start = i * kMaxCountPerPage;
            int len =  kMaxCountPerPage;
            if (start +len >emotions.count - 1) {
                len =emotions.count - start;
            }
            NSRange range = NSMakeRange(start, len);
            NSArray *subEmotions = [emotions subarrayWithRange:range];
            gridView.emotions = subEmotions;
            [self.scrollView addSubview:gridView];
        }else
        {
            int start = i * kMaxCountPerPage;
            int len =  kMaxCountPerPage;
            if (start +len >emotions.count - 1) {
                len =emotions.count - start;
            }
            NSRange range = NSMakeRange(start, len);
            NSArray *subEmotions = [emotions subarrayWithRange:range];
            
            HJEmotionGridView *gridView = [self.scrollView.subviews objectAtIndex:i];
            [gridView setFrame:CGRectMake(i *SCREENWIDTH, 0, SCREENWIDTH, 210)];
            gridView.emotions = subEmotions;
        }
    }
    
    if (currentPageCount > pages) {
        for (NSInteger i =pages; i < currentPageCount; i ++) {
            UIView *view= self.scrollView.subviews[i];
            if ([view isKindOfClass:[HJEmotionGridView class]]) {
                [view removeFromSuperview];
            }
            //移除多余的空View
        }

    }
   
}


- (void)layoutSubviews{
    [self.scrollView setFrame:CGRectMake(0, 0, SCREENWIDTH, 200)];
    [self.pageControl setFrame:CGRectMake(0, self.frame.size.height - self.scrollView.frame.size.height, SCREENWIDTH, 21)];
}


@end
