//
//  HJRetweentedViewFrame.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJStatusModel.h"
#import "HJOriginViewFrame.h"
@interface HJRetweentedViewFrame : NSObject
@property (nonatomic,strong) HJStatusModel *model;
@property (nonatomic,assign) CGRect retFrame;
@property (nonatomic,assign) CGRect frame;
@property (nonatomic,assign) CGRect nameRect;
@property (nonatomic,assign) CGRect introRect;
@end
