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
        
        
        self.head = [[HJRemoteImageView alloc] init];
        self.head.contentMode = UIViewContentModeScaleAspectFill;
        self.head.imageView.image = [UIImage imageNamed:@"avatar_default"];
        
        [self addSubview:self.head];
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
    self.head.urlString = model.user.imageUrl;
    [self.name setFrame:originFrame.nameFrame];
    [self.time setFrame:originFrame.timeFrame];
    [self.intro setFrame:originFrame.introFrame];
    [self.head setFrame:originFrame.headFrame];
    self.frame = originFrame.frame;
    
}


@end
