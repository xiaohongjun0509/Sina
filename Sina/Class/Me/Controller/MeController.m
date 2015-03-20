//
//  MeController.m
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "MeController.h"
#import "UIViewController+Extention.h"
@interface MeController ()

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *title = @"设置";
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:13.0]];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0,0,size.width,size.height)];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    //    button.backgroundColor = [UIColor redColor];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = buttonItem;
//    [self addRightButton:button title:title];
    
}



@end
