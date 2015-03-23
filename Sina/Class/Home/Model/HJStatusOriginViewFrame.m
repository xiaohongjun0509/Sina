//
//  HJStatusOriginViewFrame.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusOriginViewFrame.h"

@implementation HJStatusOriginViewFrame

-(instancetype) initWithModel :(HJStatusModel*)model
{
    if (self = [super init]) {
        self.model = model;
        
        self.headFrame = CGRectMake(PaddingInset, PaddingInset, 44, 44);
        CGFloat nameX = CGRectGetMaxX(self.headFrame) + PaddingInset;
        CGSize strSize = [model.user.name sizeWithFont:NameFont constrainedToSize:CGSizeMake(200, 20)];
        self.nameFrame = CGRectMake(nameX, PaddingInset, strSize.width, strSize.height);
        CGSize timeSize = [model.time sizeWithFont:TimeFont constrainedToSize:CGSizeMake(200, 20)];
        self.timeFrame = CGRectMake(CGRectGetMaxX(self.headFrame)+PaddingInset, CGRectGetMaxY(self.nameFrame)+PaddingInset, timeSize.width, timeSize.height);
        CGSize sourceSize = [model.source sizeWithFont:SourceFont constrainedToSize:CGSizeMake(200, 20)];
        self.sourceFrame = CGRectMake(CGRectGetMaxX(self.timeFrame) + PaddingInset, CGRectGetMaxY(self.nameFrame)+PaddingInset, sourceSize.width, sourceSize.height);
        CGSize introSize = [model.text sizeWithFont:IntroFont constrainedToSize:CGSizeMake(SCREENWIDTH - 2 * PaddingInset, MAXFLOAT)];
        CGFloat introY = CGRectGetMaxY(self.sourceFrame) > CGRectGetMaxY(self.headFrame) ? CGRectGetMaxY(self.sourceFrame) + PaddingInset:CGRectGetMaxY(self.headFrame) + PaddingInset;
        self.introFrame = CGRectMake(PaddingInset, introY, introSize.width, introSize.height);
        self.ViewHeight =  CGRectGetMaxY(self.introFrame);
    }
    return self;
}




@end
