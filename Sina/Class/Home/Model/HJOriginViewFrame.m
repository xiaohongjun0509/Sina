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
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //含警告的代码,如下,btn为UIButton类型的指针
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
                                  constrainedToSize:CGSizeMake(SCREENWIDTH - 2*PaddingInset, MAXFLOAT)];
    self.introFrame = CGRectMake(PaddingInset, CGRectGetMaxY(self.headFrame) +  PaddingInset, introSize.width, introSize.height);
    CGFloat h = CGRectGetMaxY(self.introFrame);
#pragma clang diagnostic pop


//    CGFloat h = 0;
//    NSArray * array = model.imgs;
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
        h = CGRectGetMaxY(self.introFrame);
        self.photoViewFrame = CGRectMake(0, 0, 0, 0);
    }
    self.frame = CGRectMake(0, 10, SCREENWIDTH,h);
}

@end
