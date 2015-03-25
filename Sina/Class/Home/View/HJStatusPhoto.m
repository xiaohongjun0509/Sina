//
//  HJStatusPhoto.m
//  Sina
//
//  Created by xhj on 15-3-25.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusPhoto.h"

@implementation HJStatusPhoto

-(instancetype)init
{
    if (self =[super init]) {
        self.imageView = [[HJRemoteImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
        [self addSubview:self.imageView];
        
    }
    return self;
}

@end
