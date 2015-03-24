//
//  HJRetweenedView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJRetweenedView.h"

@implementation HJRetweenedView

-(instancetype)init
{
    if (self = [super init]) {
        
        
        self.image = [UIImage imageNamed:@"timeline_retweet_background"];
        self.name = [[UILabel alloc] init];
        self.name.numberOfLines = 1;
        self.name.font = NameFont;
        [self addSubview:self.self.name];
        
        
        self.intro = [[UILabel alloc] init];
        self.intro.numberOfLines = 0;
        self.intro.font = IntroFont;
        [self addSubview:self.intro];
        
    }
    return self;
}


-(void)setRetFrame:(HJRetweentedViewFrame *)retFrame
{
    if (retFrame != nil) {
        self.frame = retFrame.frame;
        HJStatusModel *model = retFrame.model;
        self.name.text = model.user.name;
        self.intro.text = model.text;
        [self.name setFrame:retFrame.nameRect];
        [self.intro setFrame: retFrame.introRect];
    }
    else{
        self.frame = CGRectMake(0, 0, 0, 0);
        HJStatusModel *model = nil;
        self.name.text = model.user.name;
        self.intro.text = model.text;
        [self.name setFrame:retFrame.nameRect];
        [self.intro setFrame: retFrame.introRect];
    }
    
    
    
}

@end
