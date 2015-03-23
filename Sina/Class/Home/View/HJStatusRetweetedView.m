//
//  HJStatusRetweetedView.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusRetweetedView.h"



@interface HJStatusRetweetedView ()
@property(nonatomic,strong) UILabel *name;
@property ( nonatomic,strong)UILabel *intro;
@property (nonatomic,strong) HJStatusModel *statusModel;


@end
@implementation HJStatusRetweetedView

-(instancetype)initWithModel:(HJStatusModel *)model
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        self.statusModel = model;
        
        self.viewFrame = [[HJStatusRetweetedViewFrame alloc] initWithModel:model];
        self.name = [[UILabel alloc] init];
        [self.name setFont:NameFont];
        self.name.numberOfLines = 1;
        self.intro = [[UILabel alloc] init];
        [self.intro setFont:IntroFont];
        self.intro.numberOfLines  = 0;
        [self addSubview:self.name];
        [self addSubview:self.intro];
        [self setDate];
        [self setViewsFrame];
    }
    return self;
}


-(void) setViewsFrame
{
    [self.name setFrame:self.viewFrame.nameFrame];
    [self.intro setFrame: self.viewFrame.introFrame];
}

 - (void)setDate
{
    self.name.text = self.statusModel.user.name;
    self.intro.text = self.statusModel.text;
    
}
@end
