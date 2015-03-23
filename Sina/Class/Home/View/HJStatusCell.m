//
//  HJStatusCell.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusCell.h"

@implementation HJStatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
//        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setStatusModel:(HJStatusModel *)statusModel
{
    self.detailView = [[HJStatusDetailView alloc] initWithModel:statusModel];
   CGRect frame = self.contentView.frame;
    frame.origin.y = 10;
    self.contentView.frame = frame;
    [self.contentView addSubview:self.detailView];
}

@end
