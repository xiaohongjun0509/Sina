//
//  HJStatusDetailFrame.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJRetweentedViewFrame.h"
#import "HJOriginViewFrame.h"
#import "HJStatusModel.h"
@interface HJStatusDetailFrame : NSObject
@property (nonatomic,strong) HJStatusModel *model;
@property (nonatomic,assign) CGFloat detailHeight;
@property (nonatomic,strong) HJRetweentedViewFrame *retFrame;
@property (nonatomic,strong) HJOriginViewFrame *originFrame;
@property (nonatomic,assign) CGRect frame;
@end
