//
//  CellModel.m
//  Sina
//
//  Created by xhj on 15-3-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.icon = dict[@"icon"];
        self.intro = dict[@"intro"];
        self.cellTitle = dict[@"cellTitle"];
        self.needShowDot = NO;
    }
    return self;
}

@end
