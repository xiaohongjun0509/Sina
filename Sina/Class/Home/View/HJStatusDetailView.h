//
//  HJStatusDetailView.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HJRetweenedView.h"
#import "HJOriginView.h"
#import "HJStatusDetailFrame.h"
@interface HJStatusDetailView : UIView


@property (nonatomic,strong) HJStatusDetailFrame *detailFrame;

@property (nonatomic,strong) HJOriginView *originView;
@property (nonatomic,strong) HJRetweenedView *retView;

@end
