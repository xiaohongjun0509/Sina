//
//  HJStatusDetailView.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusDetailView.h"

@implementation HJStatusDetailView



-(instancetype)initWithModel:(HJStatusModel *)model{
    if (self = [super init]) {
        
        self.originView = [[HJStatusOriginView alloc] initWithModel:model];
        [self addSubview:self.originView];
        self.toolbar = [[HJStatusToolBar alloc]initWithModel:model];
        [self addSubview:self.toolbar];
        //判断是否有转发的数据
        if (model.retweeted_status != nil) {
            self.retweetedView = [[HJStatusRetweetedView alloc] initWithModel:model.retweeted_status];
            HJStatusDetailViewFrame *frame = [[HJStatusDetailViewFrame alloc] initWithModel:model];
            
            [self addSubview:self.retweetedView];
            [self.retweetedView setFrame:frame.rewteenedFrame];
        }
        
        
//        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



@end
