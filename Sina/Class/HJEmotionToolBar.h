//
//  HJEmotionToolBar.h
//  Sina
//
//  Created by xhj on 15-3-29.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HJEmotionToolBarDelegate <NSObject>

- (void)toolBarButtonClick:(UIButton *)button;

@end


@interface HJEmotionToolBar : UIView

@property (nonatomic,strong) UIButton *recent;
@property (nonatomic,strong) UIButton *def;
@property (nonatomic,strong) UIButton *emoji;
@property (nonatomic,strong) UIButton *lxh;


@end
