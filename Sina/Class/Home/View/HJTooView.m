//
//  HJTooView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJTooView.h"


@interface  HJTooView()
@property (nonatomic,strong) UIButton *share;
@property (nonatomic,strong) UIButton *comment;
@property (nonatomic,strong) UIButton *zan;
@property (nonatomic,strong) NSMutableArray * buttonArray;
@end

@implementation HJTooView
-(instancetype)init
{
    if (self =[super init])
    {

        self.frame = CGRectMake(0, 0, SCREENWIDTH, 35);
        UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 1)];
        imageView.image =[ UIImage imageNamed:@"common_lineLong_H"];
        [self addSubview:imageView];
//        self.buttonArray = @[@{@"icon":title:@""}];
        for (int i = 0; i < 3; i++) {
            
        }
        self.share =  [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, SCREENWIDTH/3, 35)];
        [self.share setImage:[UIImage imageNamed:@"timeline_icon_retweet"] forState:UIControlStateNormal];
        [self addSubview:self.share];
        
        
        self.comment =  [[UIButton alloc ]initWithFrame:CGRectMake(SCREENWIDTH/3, 0, SCREENWIDTH/3, 35)];
        [self.comment setImage:[UIImage imageNamed:@"timeline_icon_comment"] forState:UIControlStateNormal];
        [self addSubview:self.comment];
        
        self.zan =  [[UIButton alloc ]initWithFrame:CGRectMake( 2*SCREENWIDTH/3, 0, SCREENWIDTH/3, 35)];
        [self.zan setImage:[UIImage imageNamed:@"timeline_icon_retweet"] forState:UIControlStateNormal];
        [self addSubview:self.zan];
        
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}




@end
