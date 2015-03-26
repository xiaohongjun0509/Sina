//
//  ProfileCommonCell.m
//  Sina
//
//  Created by xhj on 15-3-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "ProfileCommonCell.h"


@interface ProfileCommonCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UIImageView *assory;

@end
@implementation ProfileCommonCell

-(void)setCellModel:(CellModel *)model
{
    self.icon.image = [UIImage imageNamed:model.icon];
    self.cellTitle.text = model.cellTitle;
    self.intro.text = model.intro;
    if (!model.needShowDot) {
        self.assory.image = [UIImage imageNamed:@"common_icon_arrow"];
    }else{
        self.assory.image = [UIImage imageNamed:@"new-dot"];
    }
    
}

@end
