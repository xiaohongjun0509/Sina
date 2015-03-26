//
//  HJAvatorView.m
//  Sina
//
//  Created by xhj on 15-3-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJAvatorView.h"



@interface HJAvatorView()



@end


@implementation HJAvatorView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.avatorIcon = [[UIImageView alloc] initWithFrame:CGRectMake(35, 35, 5, 5)];
        self.avatorIcon.hidden = YES;
        [self addSubview:self.avatorIcon];
    }
    return self;
}




@end
