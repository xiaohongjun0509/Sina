//
//  HJStatusRetweetedView.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJStatusModel.h"
#import "HJStatusRetweetedViewFrame.h"
@interface HJStatusRetweetedView : UIView
@property (nonatomic,strong) HJStatusRetweetedViewFrame *viewFrame;
-(instancetype)initWithModel:(HJStatusModel *)model;

@end
