//
//  HJStatusModel.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusModel.h"

@implementation HJStatusModel



- (instancetype)initWithDict:(NSDictionary *)dict
{
    if(self == [super init])
    {
//        self.name = dict[@"user"][@"name"];
        self.user = [[HJUser alloc]initWithDict:dict[@"user"]];
        self.text = dict[@"text"];
        self.lastStatusId = dict[@"id"];
        self.time = dict[@"created_at"];
//        dict[@"retweeted_status"]取出来的是NSDictionary
        if (dict[@"retweeted_status" ] != nil) {
            self.retweeted_status = [[HJStatusModel alloc]initWithDict:dict[@"retweeted_status"]];
        }
        self.imgs = dict[@"pic_urls"];

    }
    return self;
}
@end
