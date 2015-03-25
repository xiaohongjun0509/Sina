//
//  HJStatusPhoto.h
//  Sina
//
//  Created by xhj on 15-3-25.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "HJRemoteImageView.h"
@interface HJStatusPhoto : UIImageView
@property (nonatomic,strong) HJRemoteImageView *imageView;
@end
