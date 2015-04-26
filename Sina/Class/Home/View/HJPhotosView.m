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
//#import <AF>
@interface HJPhotosView ()
//@property (nonatomic,strong) HJStatusModel *model;
@end

@implementation HJPhotosView

-(instancetype)init
{
    if (self =[super init]) {
        self.imgArray = [[NSMutableArray alloc] init];
        for (int i =0; i < 9; i++) {
            UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
            photo.contentMode = UIViewContentModeScaleToFill;
            photo.backgroundColor = [UIColor blackColor];
            photo.userInteractionEnabled = YES;
            photo.tag = i;
            [self addSubview:photo];
            [self.imgArray addObject:photo];
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPhoto:)];
            [photo addGestureRecognizer:recognizer];
            
            
        }
        
    }
    return self;
}

- (void) tapPhoto:(UITapGestureRecognizer *) recognizer
{
    NSInteger tag = recognizer.view.tag;
    
    
    NSLog(@"%d",(int)tag);
}

-(void)setPicFrame:(NSMutableArray *)frameArray model:(HJStatusModel *)model
{
    //不停的set方法，不停的addSubView，最后越加越多。
    self.model = model;
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
