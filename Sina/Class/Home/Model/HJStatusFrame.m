//
//  HJStatusFrame.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusFrame.h"



@implementation HJStatusFrame

-(void)setModel:(HJStatusModel *)model
{
    _model = model;
    
    [self setupDetailFrame];
    
    
    [self setupToolbarFrame];
    
}

-(instancetype)initWithDict:(HJStatusModel *)model{
    if (self =[super init]) {
        _model = model;
        
        [self setupDetailFrame];
        
        
        [self setupToolbarFrame];
    }
    return self;
}

- (void)setupDetailFrame
{
    HJStatusDetailFrame *detailFrame = [[HJStatusDetailFrame alloc] init];
    detailFrame.model = _model;
    self.detailFrame = detailFrame;
}


-(void)setupToolbarFrame
{
    CGFloat x = 0;
    CGFloat y = self.detailFrame.detailHeight ;
    CGFloat w = SCREENWIDTH;
    CGFloat h = 35;
    self.toolBarFrame = CGRectMake(x, y, w, h);
    self.cellHeight = CGRectGetMaxY(self.toolBarFrame);
}

@end
