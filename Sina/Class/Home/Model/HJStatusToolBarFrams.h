//
//  HJStatusToolBarFrams.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJStatusModel.h"
#import "HJStatusOriginViewFrame.h"
#import "HJStatusDetailViewFrame.h"
@interface HJStatusToolBarFrams : NSObject

@property (nonatomic,assign) CGRect toolBarFrame;
-(instancetype) initWithModel :(HJStatusModel*)model;
@end
