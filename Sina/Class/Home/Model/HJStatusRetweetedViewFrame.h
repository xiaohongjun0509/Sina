//
//  HJStatusRetweetedViewFrame.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJStatusOriginViewFrame.h"
@interface HJStatusRetweetedViewFrame : NSObject
@property (nonatomic,assign) CGRect  nameFrame;
@property (nonatomic,assign) CGRect introFrame;
@property (nonatomic,assign) CGFloat retweentedHeight;
-(instancetype)initWithModel  :(HJStatusModel *)model;
@end
