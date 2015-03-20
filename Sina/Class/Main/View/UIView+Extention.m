//
//  UIView+Extention.m
//  Sina
//
//  Created by xhj on 15-3-8.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "UIView+Extention.h"

@implementation UIView (Extention)

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    [self setFrame:frame];
}



-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    [self setFrame:frame];
}


-(CGFloat)height
{
    return self.frame.size.height;
}


-(CGFloat)width
{
    return self.frame.size.width;
}


@end
