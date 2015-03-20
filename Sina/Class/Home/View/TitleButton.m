//
//  TitleButton.m
//  Sina
//
//  Created by xhj on 15-3-8.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "TitleButton.h"
//#import ""

@implementation TitleButton

//在这里不要在这里数据相关的设置工作。。。。。
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
//        self.titleLabel.backgroundColor =[UIColor redColor];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

/**
 *  重写BUtton的布局的方法
 *
 *  @param contentRect <#contentRect description#>
 *
 *  @return <#return value description#>
 */

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
   
    CGFloat imageY = 0;
    CGFloat imageH = self.frame.size.height;
    CGFloat imageW = imageH;
     CGFloat imageX = self.frame.size.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat imageY = 0;
    CGFloat imageH = self.frame.size.height;
    CGFloat imageW = self.frame.size.width - imageH;
    CGFloat imageX = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}


-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    CGSize size = [title sizeWithFont:self.titleLabel.font];
    CGRect frame = self.frame;
    frame.size.width = size.height + self.frame.size.width + 10;
    [self setFrame:frame];
    
}

@end






