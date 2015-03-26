//
//  HJRetweenedView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJRetweenedView.h"
#import "HJStatusPhoto.h"
#import "HJRemoteImageView.h"
#import "UIImageView+WebCache.h"
@implementation HJRetweenedView

-(instancetype)init
{
    if (self = [super init]) {
        
        
        self.image = [UIImage imageNamed:@"timeline_retweet_background"];
        self.name = [[UILabel alloc] init];
        self.name.numberOfLines = 1;
        self.name.font = NameFont;
        [self addSubview:self.self.name];
        
        
        self.intro = [[UILabel alloc] init];
        self.intro.numberOfLines = 0;
        self.intro.font = IntroFont;
        [self addSubview:self.intro];
        self.photosView = [[HJPhotosView alloc] init];
        [self addSubview:self.photosView];
    }
    return self;
}


-(void)setRetFrame:(HJRetweentedViewFrame *)retFrame
{
    if (retFrame != nil) {
        self.frame = retFrame.frame;
        HJStatusModel *model = retFrame.model;
        self.name.text = model.user.name;
        self.intro.text = model.text;
        [self.name setFrame:retFrame.nameRect];
        [self.intro setFrame: retFrame.introRect];
        [self.photosView setFrame:retFrame.photoViewFrame];
        if(model.imgs.count)
        {
            for (int i = 0; i < model.imgs.count; i++) {
               UIImageView *photo = self.photosView.imgArray[i];
                NSString *path = (model.imgs[i])[@"thumbnail_pic"];

                [photo setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
;
                [photo setFrame:[retFrame.photosFrame[i] CGRectValue]];
                photo.hidden = NO;
            }
            for (int i = (int)model.imgs.count; i <9 ; i++) {
                HJStatusPhoto *photo = self.photosView.imgArray[i];
                photo.hidden = YES;
            }
            
        }else{
            for (int i = 0; i <9 ; i ++) {
                ( (HJStatusPhoto *)(self.photosView.imgArray[i])).hidden = YES;
            }
        }
        
    }
    else{
        self.frame = CGRectMake(0, 0, 0, 0);
        for (int i = 0; i <9 ; i ++) {
           ( (HJStatusPhoto *)(self.photosView.imgArray[i])).hidden = YES;
        }
        HJStatusModel *model = nil;
        self.name.text = model.user.name;
        self.intro.text = model.text;
        [self.name setFrame:retFrame.nameRect];
        [self.intro setFrame: retFrame.introRect];
    }
    
    
    
}

@end
