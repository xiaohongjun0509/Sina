//
//  MainModal.m
//  Sina
//
//  Created by xhj on 15-3-18.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJUser.h"

@implementation HJUser

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if(self == [super init])
    {
        self.name = dict[@"name"];
        self.imageUrl = dict[@"avatar_large"];
        self.desc  = dict[@"description"];
        self.profileImg = dict[@"profile_image_url"];
       
    }
    return self;
}


@end
