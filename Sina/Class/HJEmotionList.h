//
//  HJEmotionList.h
//  Sina
//
//  Created by xhj on 15-3-29.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJEmotionList : UIView

@property (nonatomic,strong)NSMutableArray *emotions;


@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,strong) UIScrollView *scrollView;
@end
