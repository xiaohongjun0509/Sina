//
//  HJStatusToolBarFrams.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusToolBarFrams.h"

@implementation HJStatusToolBarFrams



-(instancetype)initWithModel:(HJStatusModel *)model
{
    if (self =[super init]) {
        HJStatusDetailViewFrame *frame = [[HJStatusDetailViewFrame alloc]initWithModel:model];
        self.toolBarFrame = CGRectMake(0, frame.detailViewHeight, SCREENWIDTH , 35);
    }
    return self;
}
@end
