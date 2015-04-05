//
//  HJKeyBoard.h
//  Sina
//
//  Created by xhj on 15-3-29.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HJEmotionList.h"
#import "HJEmotionToolBar.h"
@interface HJKeyBoard : UIView
@property (nonatomic,strong) HJEmotionList *emotionList;
@property (nonatomic,strong) HJEmotionToolBar *toolBar;
@end
