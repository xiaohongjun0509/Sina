//
//  HJRetweentedViewFrame.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJRetweentedViewFrame.h"

@implementation HJRetweentedViewFrame

-(void)setModel:(HJStatusModel *)model
{
    _model = model;
    CGSize nameSize = [model.user.name sizeWithFont:NameFont constrainedToSize:CGSizeMake(200, 20)];
    self.nameRect = CGRectMake(PaddingInset, PaddingInset, nameSize.width, nameSize.height);
    CGSize introSize = [model.text sizeWithFont:IntroFont constrainedToSize:CGSizeMake(300, MAXFLOAT)];
    self.introRect = CGRectMake(PaddingInset, CGRectGetMaxY(self.nameRect) + PaddingInset, introSize.width, introSize.height);
//    self.picArray = [NSMutableArray array];
    int h = CGRectGetMaxY(self.introRect);
    if (model.imgs.count) {
        //计算微博中图的数量。
        self.photosFrame = [[NSMutableArray alloc] init];
        for (int i = 0; i < model.imgs.count; i++) {
            
            int col = i/4;
            int row = i%4;
            CGFloat x= (row + 1) *PaddingInset + PhotoH *row;
            CGFloat y = col *PhotoH + PaddingInset *col;
            CGRect sframe = CGRectMake(x, y, PhotoH, PhotoH);
            NSValue * imgFrame =[NSValue valueWithCGRect:sframe];
            [self.photosFrame addObject:imgFrame];
            if (i ==  model.imgs.count - 1) {
                self.photoViewFrame = CGRectMake(0, h, SCREENWIDTH, CGRectGetMaxY(sframe));
                h = CGRectGetMaxY(self.photoViewFrame);
            }
        }
    }else{
        h = CGRectGetMaxY(self.introRect);
        self.photoViewFrame = CGRectMake(0, 0, 0, 0);
    }
    self.frame = CGRectMake(0, 0, SCREENWIDTH, h);

}




@end
