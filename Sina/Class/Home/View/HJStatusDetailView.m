//
//  HJStatusDetailView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusDetailView.h"

@implementation HJStatusDetailView

-(instancetype)init
{
    if (self =[super init]) {
        HJOriginView *originView = [[HJOriginView alloc] init];
        [self addSubview:originView];
        self.originView = originView;
        HJRetweenedView *retView  = [[HJRetweenedView alloc] init];
        [self addSubview:retView];
        self.retView  = retView ;

    }
    return self;
}


-(void)setDetailFrame:(HJStatusDetailFrame *)detailFrame
{
    //这里也报错。
    if (detailFrame.retFrame != nil) {
        self.retView.retFrame = detailFrame.retFrame;
    }else{
        self.retView.retFrame = nil;
    }
    self.originView.originFrame = detailFrame.originFrame;
    self.frame = detailFrame.frame;
}

@end
