//
//  Tabbar.h
//  Sina
//
//  Created by xhj on 15-3-15.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlusButtonDelegate <NSObject>

-(void)plusButtonClick;

@end

@interface Tabbar : UITabBar

@property(nonatomic,weak) id <PlusButtonDelegate> plusDelegate;

@end
