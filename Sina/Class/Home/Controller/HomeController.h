//
//  HomeController.h
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Extention.h"
@interface HomeController : UIViewController<UITableViewDataSource,UITableViewDelegate>

-(void)showRefreshControl;


-(void)UpToTop;

@end
