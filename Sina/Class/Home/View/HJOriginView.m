//
//  HJOriginView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJOriginView.h"
#import "UIImageView+WebCache.h"
@implementation HJOriginView
-(instancetype)init
{
    if (self = [super init]) {
        self.name = [[UILabel alloc] init];
        self.name.font = NameFont;
        self.name.numberOfLines = 1;
        [self addSubview:self.name];
        
        self.time = [[UILabel alloc] init];
        self.time.font = TimeFont;
        self.time.numberOfLines = 1;
        [self addSubview:self.time];
        
        self.intro = [[UILabel alloc] init];
        self.intro.font = IntroFont;
        self.intro.numberOfLines = 0;
        [self addSubview:self.intro];
        
        
        self.head = [[HJAvatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        self.head.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.head];
       //添加图片显示
        self.photosView = [[HJPhotosView alloc] init];
        [self addSubview:self.photosView];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)setOriginFrame:(HJOriginViewFrame *)originFrame
{
    HJStatusModel *model = originFrame.model;
    self.name.text = model.user.name;
    self.time.text = model.time;
    self.intro.text = model.text;
    [self.head setImageWithURL:[NSURL URLWithString:model.user.imageUrl] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]] ;
    
    [self.name setFrame:originFrame.nameFrame];
    [self.time setFrame:originFrame.timeFrame];
    [self.intro setFrame:originFrame.introFrame];
    [self.head setFrame:originFrame.headFrame];
//    [self.head.imageView setFrame:originFrame.headFrame];
    //设置照片现实模块的frame
    if (model.imgs.count) {
//        for (int i = 0; i< model.imgs.count; i++) {
//            [self.photosView setPicFrame:originFrame.photosFrame model:model];
//            [self.photosView setFrame:originFrame.photoViewFrame];
//            self.photosView.hidden = NO;
//        }
//        for (int i = (int)model.imgs.count; i< 9; i++) {
//            [self.photosView setPicFrame:originFrame.photosFrame model:model];
//            [self.photosView setFrame:originFrame.photoViewFrame];
//            self.photosView.hidden = YES;
//        }
        [self.photosView setPicFrame:originFrame.photosFrame model:model];
        [self.photosView setFrame:originFrame.photoViewFrame];
        self.photosView.hidden = NO;
    }else{
        self.photosView.hidden = YES;
        [self.photosView setPicFrame:originFrame.photosFrame model:model];
        [self.photosView setFrame:originFrame.photoViewFrame];

        
//        self.photosView = nil;
    }
    self.frame = originFrame.frame;
    
}


@end
