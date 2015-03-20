//
//  MainModal.m
//  Sina
//
//  Created by xhj on 15-3-18.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "MainModal.h"

@implementation MainModal

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if(self == [super init])
    {
        self.name = dict[@"user"][@"name"];
        self.imageUrl = dict[@"user"][@"avatar_large"];
        self.text = dict[@"text"];
        self.since_id = dict[@"id"];
    }
    return self;
}


@end
