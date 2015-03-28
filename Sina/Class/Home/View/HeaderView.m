//
//  HeaderView.m
//  Sina
//
//  Created by xhj on 15-3-27.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HeaderView.h"
#import "UIImageView+WebCache.h"


@interface HeaderView()

@property (nonatomic,strong) UIImageView *head;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *guanzhu;
@property (nonatomic,strong) UILabel *fans;
@property (nonatomic,strong) UIButton *sixinButton;
@property (nonatomic,strong) UIButton *yiguanzhuButton;
@property (nonatomic,strong) UILabel *intro;
@property (nonatomic,strong) UIImageView *gender;
@property (nonatomic,strong) UIImageView *vip;
@property (nonatomic,strong) UIView *headerView;
@end


@implementation HeaderView




-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)setModel:(HJStatusModel *)model
{
    _model = model;
    self.backgroundColor = [UIColor whiteColor];
    self.headerView = [[UIView alloc]init];
    self.head =  [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH/2 - 30, 0, 60, 60)];
    [self.head setImageWithURL:model.user.imageUrl placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    [self.headerView addSubview:self.head];
    //添加gender
    
    self.gender =  [[UIImageView alloc] initWithFrame:CGRectMake(230, 30, 20, 20)];
    self.gender.backgroundColor = [UIColor redColor];
    [self.headerView addSubview:self.gender];
    
    
    //添加gender
    
    self.vip =  [[UIImageView alloc] initWithFrame:CGRectMake(220, 30, 20, 20)];
    self.gender.backgroundColor = [UIColor redColor];
    [self.headerView addSubview:self.vip];
    
    self.name  = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.head.frame) + PaddingInset, SCREENWIDTH, 20)];
    self.name.text = model.user.name;
    self.name.font = NameFont;
    self.name.textAlignment = UITextAlignmentCenter;
    [self.headerView addSubview:self.name];
    
    self.intro  = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.name.frame) + 0.5 *PaddingInset, SCREENWIDTH, 12)];
    self.intro.textColor = [UIColor grayColor];
    
    self.intro.text = model.user.desc;
    self.intro.font = [UIFont systemFontOfSize:10];
    self.intro.textAlignment = UITextAlignmentCenter;
    [self.headerView addSubview:self.intro];
    
    self.sixinButton  = [[UIButton alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(self.intro.frame) + PaddingInset, 80, 30)];
    [self.sixinButton setTitle:@"私信" forState:UIControlStateNormal];
    self.sixinButton.backgroundColor = [UIColor redColor];
    [self.sixinButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.headerView addSubview:self.sixinButton];
    self.yiguanzhuButton  = [[UIButton alloc] initWithFrame:CGRectMake(180, CGRectGetMaxY(self.intro.frame) + PaddingInset, 80, 30)];
    [self.yiguanzhuButton setTitle:@"已关注" forState:UIControlStateNormal];
    [self.yiguanzhuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.yiguanzhuButton.backgroundColor = [UIColor redColor];
    [self.headerView addSubview:self.yiguanzhuButton];
    
    [self.headerView setFrame:CGRectMake(0, 0, SCREENWIDTH, CGRectGetMaxY(self.yiguanzhuButton.frame))];
    self.headerView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.headerView];
        
   
}

@end
