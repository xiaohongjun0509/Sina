//
//  HJStatusModel.h
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJUser.h"
@interface HJStatusModel : NSObject



@property (nonatomic,strong) HJUser *user;
@property(nonatomic,copy) NSString *lastStatusId;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *source;
@property(nonatomic,copy) NSString *titleString;


-(instancetype)initWithDict:(NSDictionary *)dict;

@end
