//
//  HJImageCache.h
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJImageCache : NSObject
@property (nonatomic,copy) NSString *path;
+(instancetype) standardCache;
-(void)setData:(NSData *)data forKey:(NSString *)key;
-(NSData *)dataForKey :(NSString *)key;
@end
