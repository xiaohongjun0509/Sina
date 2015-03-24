//
//  HJStatusCell.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJStatusDetailView.h"
#import "HJTooView.h"
#import "HJStatusDetailFrame.h"
#import "HJStatusFrame.h"
@interface HJStatusCell : UITableViewCell
@property (nonatomic,strong) HJStatusDetailView *detailView;
@property (nonatomic,strong) HJTooView *toolView;
@property (nonatomic,strong) HJStatusFrame * statusFrame;
@end
