//
//  DiscoveryController.m
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "DiscoveryController.h"
#import "UIViewController+Extention.h"
#import "SearchBar.h"
@interface DiscoveryController ()

@end

@implementation DiscoveryController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *title = @"系统设置";
//    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:13]];
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
//    [self addRightButton:button title:@"系统设置"];
    SearchBar *searchBar = [[SearchBar alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
   // searchBar.backgroundColor =[UIColor redColor];
    self.navigationItem.titleView = searchBar;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
