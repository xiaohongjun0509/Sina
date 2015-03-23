//
//  HJStatusDetailView.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJStatusOriginView.h"
#import "HJStatusRetweetedView.h"
#import "HJStatusToolBar.h"
#import "HJStatusModel.h"
#import "HJStatusDetailViewFrame.h"
@interface HJStatusDetailView : UIView
@property (nonatomic,strong) HJStatusOriginView *originView;
@property (nonatomic,strong) HJStatusToolBar *toolbar;
@property (nonatomic,strong) HJStatusRetweetedView *retweetedView;
@property (nonatomic,strong) HJStatusDetailViewFrame *detailFrame;
@property (nonatomic,strong) HJStatusModel *model;

-(instancetype)initWithModel:(HJStatusModel *)model;


@end
