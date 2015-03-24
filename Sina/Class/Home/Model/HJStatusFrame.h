//
//  HJStatusFrame.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJStatusModel.h"
#import "HJOriginViewFrame.h"
#import "HJRetweentedViewFrame.h"
#import "HJToolBarFrame.h"
#import "HJStatusDetailFrame.h"
@interface HJStatusFrame : NSObject
@property (nonatomic,strong) HJStatusModel *model;
@property (nonatomic,assign) CGRect  toolBarFrame;
@property (nonatomic,strong) HJStatusDetailFrame *detailFrame ;
@property (nonatomic,assign) CGFloat  cellHeight;

-(instancetype)initWithDict:(HJStatusModel *)model;
@end
