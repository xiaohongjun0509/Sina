//
//  HJOriginViewFrame.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJOriginViewFrame.h"

@implementation HJOriginViewFrame


-(void)setModel:(HJStatusModel *)model
{
    _model = model;
    self.headFrame = CGRectMake(PaddingInset, PaddingInset, 40, 40);
    CGSize nameSize  = [model.user.name sizeWithFont:NameFont
                                   constrainedToSize:CGSizeMake(200, 20)];
    self.nameFrame = CGRectMake(60, PaddingInset, nameSize.width, nameSize.height);
    CGSize timeSize  = [model.time sizeWithFont:TimeFont
                                   constrainedToSize:CGSizeMake(200, 20)];
    self.timeFrame = CGRectMake(CGRectGetMaxX (self.headFrame) + PaddingInset, nameSize.height+ 2 *PaddingInset, timeSize.width, timeSize.height);
    CGSize sourceSize  = [model.source sizeWithFont:SourceFont
                                   constrainedToSize:CGSizeMake(200, 20)];
    self.sourceFrame = CGRectMake(2 *PaddingInset + timeSize.width, PaddingInset, nameSize.width, nameSize.height);
    CGSize introSize  = [model.text sizeWithFont:IntroFont
                                  constrainedToSize:CGSizeMake(300, MAXFLOAT)];
    self.introFrame = CGRectMake(PaddingInset, CGRectGetMaxY(self.headFrame) +  PaddingInset, introSize.width, introSize.height);
    self.frame = CGRectMake(0, 10, SCREENWIDTH,CGRectGetMaxY(self.introFrame) );
    
}

@end
