//
//  HJLoadMore.m
//  Sina
//
//  Created by xhj on 15-3-19.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJLoadMore.h"


@interface HJLoadMore()
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;
@end

@implementation HJLoadMore

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.label = [[UILabel alloc] init];
        [self.label setTextAlignment:NSTextAlignmentCenter];
        [self.label setTextColor:[UIColor grayColor]];
        [self addSubview:self.label];
        self.indicatorView = [[UIActivityIndicatorView alloc] init];
        [self.indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:self.indicatorView];
        self.indicatorView.hidesWhenStopped =YES;
       
        
    }
    return self;
}

//WithFrame:CGRectMake(0, 0, frame.size.width, 44)

- (void)layoutSubviews{
    [self.label setFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
    [self.indicatorView setFrame:CGRectMake(270, 7, 30, 30)];
    [self.indicatorView startAnimating];
    
}



-(void)endRefreshing
{
    [self.indicatorView stopAnimating];
    self.refreshing = NO;
    self.label.text = @"上拉可以加载更多的数据。。。";
    
}

-(void)beginRefreshing
{
    [self.indicatorView startAnimating];
    self.refreshing = YES;
    self.label.text = @"正在拼了命加载。。。";
}



@end
