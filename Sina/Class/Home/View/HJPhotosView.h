//
//  HJPhotosView.h
//  Sina
//
//  Created by xhj on 15-3-25.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HJStatusModel.h"

@interface HJPhotosView : UIView
@property (nonatomic,strong) HJStatusModel *model;
@property (nonatomic,strong) NSMutableArray *imgFrame;
@property (nonatomic,strong) NSMutableArray *imgArray;
-(void) setPicFrame:(NSMutableArray *)frameArray model:(HJStatusModel *)model;

@end
