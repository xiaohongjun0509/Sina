//
//  HJRemoteImageView.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJRemoteImageView : UIView<NSURLConnectionDataDelegate>
{
    @public
    NSOperationQueue *queue;
}
@property (nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) NSMutableData *data;
@property (nonatomic,strong)UIImage *placeHolder;
@property (nonatomic,strong) NSString *urlString;
//-(void)SetImagePath:(NSString *)path;
@end
