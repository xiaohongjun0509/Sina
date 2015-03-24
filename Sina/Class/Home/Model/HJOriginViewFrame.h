//
//  HJOriginViewFrame.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJStatusModel.h"
@interface HJOriginViewFrame : NSObject
@property (nonatomic,strong) HJStatusModel *model;
@property (nonatomic,assign) CGFloat originHeight;
@property (nonatomic,assign) CGRect frame;
@property (nonatomic,assign) CGRect headFrame;
@property (nonatomic,assign) CGRect nameFrame;
@property (nonatomic,assign) CGRect timeFrame;
@property (nonatomic,assign) CGRect sourceFrame;
@property (nonatomic,assign) CGRect introFrame;
@end
