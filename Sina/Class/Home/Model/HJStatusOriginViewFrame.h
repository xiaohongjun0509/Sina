//
//  HJStatusOriginViewFrame.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJStatusModel.h"
@interface HJStatusOriginViewFrame : NSObject


@property (nonatomic,assign) CGRect headFrame;

@property (nonatomic,assign) CGRect nameFrame;

@property (nonatomic,assign) CGRect timeFrame;

@property (nonatomic,assign) CGRect sourceFrame;
@property (nonatomic,assign) CGRect vipFrame;

@property (nonatomic,assign) CGRect introFrame;

@property (nonatomic,strong) HJStatusModel *model;
@property (nonatomic,assign) CGFloat  ViewHeight;

-(instancetype) initWithModel :(HJStatusModel*)model;

@end
