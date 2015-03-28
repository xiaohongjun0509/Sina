//
//  ProfileController.h
//  Sina
//
//  Created by xhj on 15-3-27.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJStatusModel.h"
@interface ProfileController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (instancetype)initWithModel:(HJStatusModel *)model;
@end
