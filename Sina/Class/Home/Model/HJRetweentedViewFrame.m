//
//  HJRetweentedViewFrame.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJRetweentedViewFrame.h"

@implementation HJRetweentedViewFrame

-(void)setModel:(HJStatusModel *)model
{
    _model = model;
    CGSize nameSize = [model.user.name sizeWithFont:NameFont constrainedToSize:CGSizeMake(200, 20)];
    self.nameRect = CGRectMake(PaddingInset, PaddingInset, nameSize.width, nameSize.height);
    CGSize introSize = [model.text sizeWithFont:IntroFont constrainedToSize:CGSizeMake(300, MAXFLOAT)];
    self.introRect = CGRectMake(PaddingInset, CGRectGetMaxY(self.nameRect) + PaddingInset, introSize.width, introSize.height);
    self.frame = CGRectMake(0, 0, SCREENWIDTH, CGRectGetMaxY(self.introRect));
    
}


@end
