//
//  HJLoadMore.h
//  Sina
//
//  Created by xhj on 15-3-19.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJLoadMore : UIView


@property(nonatomic,assign) BOOL refreshing;
-(void)setText:(NSString *)str;

-(void)endRefreshing;
-(void)beginRefreshing;



@end
