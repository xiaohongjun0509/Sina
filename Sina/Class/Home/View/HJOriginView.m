//
//  HJOriginView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJOriginView.h"
#import "UIImageView+WebCache.h"
#import "TabBarController.h"
#import "ProfileController.h"
#import "HomeController.h"

@interface HJOriginView()
@property (nonatomic,strong)HJStatusModel *model;
@property (nonatomic,copy)void (^profileHandler)(void);
@end
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
    _model = originFrame.model;
    self.name.text = _model.user.name;
    self.time.text = _model.time;
    self.intro.text = _model.text;
    [self.head setImageWithURL:[NSURL URLWithString:_model.user.imageUrl] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]] ;
    
    [self.name setFrame:originFrame.nameFrame];
    [self.time setFrame:originFrame.timeFrame];
    [self.intro setFrame:originFrame.introFrame];
    [self.head setFrame:originFrame.headFrame];
//    [self.head.imageView setFrame:originFrame.headFrame];
    //设置照片现实模块的frame
    if (_model.imgs.count) {
        [self.photosView setPicFrame:originFrame.photosFrame model:_model];
        [self.photosView setFrame:originFrame.photoViewFrame];
        self.photosView.hidden = NO;
    }else{
        self.photosView.hidden = YES;
        [self.photosView setPicFrame:originFrame.photosFrame model:_model];
        [self.photosView setFrame:originFrame.photoViewFrame];
    }
    self.frame = originFrame.frame;
    self.head.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoPersonalProfileBadDesign)];
    [self.head addGestureRecognizer:tap];
//    self.profileHandler = 
}



#pragma  mark 不符合设计。后期改进
- (void)gotoPersonalProfileBadDesign
{
    NSLog(@"gotoPersonalProfile");
    ProfileController *controller  = [[ProfileController alloc] initWithModel:self.model];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:controller];
    TabBarController  *vc = (TabBarController *)self.window.rootViewController;
    HomeController *home = vc.selectedViewController;
    [home presentViewController:nv animated:YES completion:nil];
}


@end
