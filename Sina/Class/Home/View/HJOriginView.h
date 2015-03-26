//
//  HJOriginView.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJOriginViewFrame.h"
#import "HJRemoteImageView.h"
#import "HJPhotosView.h"
#import "HJAvatorView.h"

@interface HJOriginView : UIView
@property (nonatomic,strong) HJOriginViewFrame *originFrame;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *time;
@property (nonatomic,strong) UILabel *source;
@property (nonatomic,strong) HJAvatorView *head;
@property (nonatomic,strong) UILabel *intro;
@property(nonatomic,strong) HJPhotosView *photosView;

@end
