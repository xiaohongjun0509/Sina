//
//  HJStatusCell.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusCell.h"

@implementation HJStatusCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        HJStatusDetailView *detailView = [[HJStatusDetailView alloc] init];
        [self.contentView addSubview:detailView];
        self.detailView = detailView;
        
        HJTooView *toolView = [[HJTooView alloc] init];
        [self.contentView  addSubview:toolView];
        self.toolView = toolView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}




-(void)setStatusFrame:(HJStatusFrame *)statusFrame
{
    //在这里为什么detailFrame会是HJStatusModel
    self.detailView.detailFrame = statusFrame.detailFrame;
    self.toolView.frame = statusFrame.toolBarFrame;
//    CGRect selfFrame  = self.contentView.frame;
//    selfFrame.origin.y += 10;
//    self.contentView.frame = selfFrame;
}
@end
