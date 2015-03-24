//
//  HJStatusDetailFrame.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusDetailFrame.h"

@implementation HJStatusDetailFrame


-(void)setModel:(HJStatusModel *)model
{
    _model = model;
    HJOriginViewFrame *originFrame = [[HJOriginViewFrame alloc] init];
    originFrame.model = _model;
    self.originFrame = originFrame;
    CGFloat h = 0;
    if (model.retweeted_status) {
        //计算转发的微博frame
        HJRetweentedViewFrame *retFrame = [[HJRetweentedViewFrame alloc] init];
        retFrame.model = _model.retweeted_status;
        CGRect frame =retFrame.frame;
        frame.origin.y = CGRectGetMaxY(self.originFrame.frame);
        retFrame.frame = frame;
        self.retFrame = retFrame;
        h = CGRectGetMaxY(self.retFrame.frame);
    }else{
        self.retFrame = nil;
         h = CGRectGetMaxY(self.originFrame.frame);
    }
   
    self.detailHeight = h;
    self.frame = CGRectMake(0, 0, SCREENWIDTH, h);
    
}




@end
