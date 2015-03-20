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
        [self addSubview:self.label];
        self.indicatorView = [[UIActivityIndicatorView alloc] init];
        [self addSubview:self.indicatorView];
        self.indicatorView.hidesWhenStopped =YES;
        self.label.backgroundColor = [UIColor redColor];
        
    }
    return self;
}

//WithFrame:CGRectMake(0, 0, frame.size.width, 44)

- (void)layoutSubviews{
    [self.label setFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
    [self.indicatorView setFrame:CGRectMake(270, 7, 30, 30)];
    [self.indicatorView startAnimating];
    
}

-(void)setText:(NSString *)str
{
    [self.label setText:str];
}

-(void)endRefreshing
{
    [self.indicatorView stopAnimating];
    
}

@end
