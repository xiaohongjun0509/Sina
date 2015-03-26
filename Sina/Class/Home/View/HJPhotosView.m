//
//  HJPhotosView.m
//  Sina
//
//  Created by xhj on 15-3-25.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJPhotosView.h"
#import "HJStatusPhoto.h"
#import "UIImageView+WebCache.h"
@implementation HJPhotosView

-(instancetype)init
{
    if (self =[super init]) {
        self.imgArray = [[NSMutableArray alloc] init];
        for (int i =0; i < 9; i++) {
//            HJRemoteImageView *photo = [[HJRemoteImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
            UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
            photo.contentMode = UIViewContentModeScaleToFill;
//            [photo setFrame:CGRectMake(0, 0, 70, 70)];
            photo.backgroundColor = [UIColor blackColor];
            [self addSubview:photo];
            [self.imgArray addObject:photo];
        }
        
    }
    return self;
}



-(void)setPicFrame:(NSMutableArray *)frameArray model:(HJStatusModel *)model
{
    //不停的set方法，不停的addSubView，最后越加越多。
    if (model.imgs.count) {
        for (int i = 0; i < frameArray.count; i++) {
            UIImageView *photo = self.imgArray[i];
            photo.hidden = NO;
            NSDictionary *picDict = model.imgs[i];
            [photo setImageWithURL:[NSURL URLWithString:picDict[@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
            [photo setFrame:[frameArray[i] CGRectValue]];
            [self addSubview:photo];
            
        }
        for (int i = (int)frameArray.count; i <9; i++) {
            UIImageView *photo = self.imgArray[i];
            photo.hidden = YES;
        }
    }
}

@end
