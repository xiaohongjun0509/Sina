//
//  HJStatusCell.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJStatusDetailView.h"
@interface HJStatusCell : UITableViewCell

@property (nonatomic,strong) HJStatusDetailView *detailView;


@property (nonatomic,strong) HJStatusModel *statusModel;
-(void)setStatusModel:(HJStatusModel *)statusModel;
@end
