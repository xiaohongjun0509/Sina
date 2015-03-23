//
//  HJStatusOriginView.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusOriginView.h"
#import "HJStatusModel.h"
#import "HJStatusOriginViewFrame.h"
@interface HJStatusOriginView ()

@property (nonatomic,strong) UIImageView *head;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *time;
@property (nonatomic,strong) UILabel *source;
@property (nonatomic,strong) UIImageView *vipLogo;
@property (nonatomic,strong) UILabel *introLabel;

@end
@implementation HJStatusOriginView



- (instancetype)initWithModel:(HJStatusModel *)model{
    if(self = [super init])
    {
         //为什么将该背景色设置为白色不起作用？
        self.backgroundColor = [UIColor whiteColor];
        self.frame = [[HJStatusOriginViewFrame alloc] initWithModel:model];
        [self initSubViews];
        [self setData];
        [self setViewsFrame];
    }
    return self;
}

-(void)setData
{
    HJStatusModel *model = self.frame.model;
//    NSLog(@"model ------ %@",model);
    self.head.backgroundColor = [UIColor redColor];
    self.name.text = model.user.name;
    [self formatTime:model.time];
    self.time.text  = model.time;
    self.source.text = model.source;
    self.introLabel.text = model.text ;
    
}

- (NSString *)formatTime :(NSString *)time
{
    
    
    NSString *oldTime  = @"Mon Mar 23 09:05:25 +0800 2015";
    NSLog(@"time ---- %@",time);
    NSDateFormatter * nfr = [[NSDateFormatter alloc] init];
//    nfr.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //时间的格式要和你所给定的时间的字符串的格式要对应起来。
    nfr.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *createDate = [nfr dateFromString:time];
//    [createDate ];
    NSLog(@"CReate timr %@",createDate);
    return nil;
}





- (void)setViewsFrame
{
    [self.head setFrame:self.frame.headFrame];
    [self.time setFrame:self.frame.timeFrame];
    [self.source setFrame:self.frame.sourceFrame];
    [self.name setFrame:self.frame.nameFrame];
    [self.introLabel setFrame:self.frame.introFrame];
   
}

 - (void)initSubViews
{
    self.head = [[UIImageView alloc] init];
    [self addSubview:self.head];
    self.name = [[UILabel alloc] init];
    self.name.numberOfLines = 0;
    [self.name setFont:NameFont];
    [self addSubview:self.name];
    self.time = [[UILabel alloc] init];
    self.time.numberOfLines = 0;
    [self.time setFont:TimeFont];
    [self addSubview:self.time];
    self.source = [[UILabel alloc] init];
    self.source.numberOfLines = 0;
    [self.source setFont:SourceFont];
    [self addSubview:self.source];
    self.vipLogo = [[UIImageView alloc] init];
    [self addSubview:self.vipLogo];
    self.introLabel = [[UILabel alloc] init];
    self.introLabel.numberOfLines = 0;
    [self.introLabel setFont:IntroFont];
    [self addSubview:self.introLabel];
}




@end
