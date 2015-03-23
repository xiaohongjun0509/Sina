//
//  HJStatusDetailViewFrame.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJStatusOriginViewFrame.h"
#import "HJStatusRetweetedViewFrame.h"
#import "HJStatusModel.h"
@interface HJStatusDetailViewFrame : NSObject
@property (nonatomic,assign) CGFloat detailViewHeight;
@property (nonatomic,assign) CGRect  originFrame;
@property (nonatomic,assign) CGRect rewteenedFrame;
-(instancetype)initWithModel:(HJStatusModel *)model;
@end
