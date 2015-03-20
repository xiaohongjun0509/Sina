//
//  Tabbar.m
//  Sina
//
//  Created by xhj on 15-3-15.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "Tabbar.h"

@implementation Tabbar

-(instancetype)init
{
    if(self = [super init])
    {
//        [self addPlusTabBarButton];
    }
    return self;
    
}

//-(void)addPlusTabBarButton
//{
//    UIButton *button = [];
//}


-(void)layoutSubviews{
    //重写layoutSubview方法时千万别忘记[super layoutSubviews];
    [super layoutSubviews];
    NSArray *items = self.items;
    float itemW = [UIScreen mainScreen].bounds.size.width/(items.count+1);
    int index = 0;
   for(UIView * view in self.subviews)
   {
       if (![view isKindOfClass:NSClassFromString(@"UITabBarButton")])continue;
       CGRect frame = view.frame;
       if (index >= 2) {
           frame.origin.x = (index + 1) * itemW;
          
       }else{
           frame.origin.x = index  * itemW;
          
       }
       
       view.frame = frame;
       index++;
   }
    
//    UIImage *image = [];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(itemW*2, 0, itemW, self.frame.size.height)];
    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName: @"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(plusButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

-(void)plusButtonDidClick
{
    [self.plusDelegate plusButtonClick];
}

@end
