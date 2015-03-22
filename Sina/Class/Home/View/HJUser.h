//
//  MainModal.h
//  Sina
//
//  Created by xhj on 15-3-18.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJUser : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *desc;

@property(nonatomic,copy) NSString *imageUrl;


- (instancetype)initWithDict:(NSDictionary *)dict;
@end
