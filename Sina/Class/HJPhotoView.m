//
//  HJPhotoView.m
//  Sina
//
//  Created by xhj on 15-3-19.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJPhotoView.h"

static  const CGFloat padding = 10;
static const int countPerCols =4;
@implementation HJPhotoView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        ;
    }
    return self;
}

// 只负责添加图片，布局的任务交给layoutSubviews来完成
-(void)addImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    imageView.clipsToBounds =YES;
    [self addSubview:imageView];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    NSArray *array = self.subviews;
    
    for (int i =0;i < array.count; i++) {
        int row = i / countPerCols;
        int col = i %countPerCols;
        UIImageView *imageView = [array objectAtIndex:i];
        CGRect frame = imageView.frame;
        CGFloat width =(SCREENWIDTH - 5 *padding)/4;
        frame.origin.x= (col+1)*padding + col*width ;
        frame.origin.y= row *width +row *padding ;
        frame.size.width= width;
        frame.size.height= width ;
        [imageView setFrame:frame];

    }
}


@end
