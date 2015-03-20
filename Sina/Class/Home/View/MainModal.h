//
//  MainModal.h
//  Sina
//
//  Created by xhj on 15-3-18.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModal : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *text;

@property(nonatomic,copy) NSString *imageUrl;

@property (nonatomic,copy) NSString *source;


@property(nonatomic,copy) NSString *time;

@property(nonatomic,copy) NSString *since_id;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
