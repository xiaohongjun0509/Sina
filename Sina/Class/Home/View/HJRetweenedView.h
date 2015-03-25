//
//  HJRetweenedView.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HJRetweentedViewFrame.h"
#import "HJPhotosView.h"

@interface HJRetweenedView : UIImageView
@property (nonatomic,strong) HJRetweentedViewFrame *retFrame;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *intro;
@property(nonatomic,strong) HJPhotosView *photosView;
@property (nonatomic,strong) NSMutableArray *retPic;
@end
