//
//  HJStatusDetailViewFrame.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusDetailViewFrame.h"

@implementation HJStatusDetailViewFrame
-(instancetype)initWithModel:(HJStatusModel *)model
{
    if (model != nil) {
        
   
    if (self = [super init]) {
    HJStatusOriginViewFrame *frame = [[HJStatusOriginViewFrame alloc] initWithModel:model];
    self.originFrame = CGRectMake(0, 0, SCREENWIDTH, frame.ViewHeight);
    self.detailViewHeight = CGRectGetMaxY(self.originFrame);
    if (model.retweeted_status != nil) {
        HJStatusRetweetedViewFrame *frames = [[HJStatusRetweetedViewFrame alloc] initWithModel:model.retweeted_status];
        self.rewteenedFrame = CGRectMake(0, CGRectGetMaxY(self.originFrame)+ PaddingInset, SCREENWIDTH, frames.retweentedHeight);
        self.detailViewHeight = CGRectGetMaxY(self.rewteenedFrame);
        
    }
}
         }
    return self;
}
@end
