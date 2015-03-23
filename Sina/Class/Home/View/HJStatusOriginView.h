//
//  HJStatusOriginView.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJStatusOriginViewFrame;
#import "HJStatusModel.h"
@interface HJStatusOriginView : UIView

@property (nonatomic,strong)HJStatusOriginViewFrame *frame;


- (instancetype)initWithModel:(HJStatusModel *)model;
@end
