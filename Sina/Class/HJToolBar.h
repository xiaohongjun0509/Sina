//
//  HJToolBar.h
//  Sina
//
//  Created by xhj on 15-3-19.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ToolButtonType) {
    ToolButtonTypeCamera = 1000,
    ToolButtonTypePicture,
    ToolButtonTypeTopic,
    ToolButtonTypeEmotion,
    ToolButtonTypeMention
};

@protocol HJToolBarDelegate <NSObject>

-(void) buttonDidClick:(UIButton *)button;

@end


@interface HJToolBar : UIView

@property(nonatomic,weak) id<HJToolBarDelegate> delegate;

@end
