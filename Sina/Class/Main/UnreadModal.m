//
//  NotificationModal.m
//  Sina
//
//  Created by xhj on 15-3-20.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "UnreadModal.h"

@implementation UnreadModal
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self =[super init]) {
        //这里有一个坑。。。。。。NSDictionary 里面存放的都是对象，基本的数据类型
        NSNumber *i= dict[@"status"];
        self.status =[NSString stringWithFormat:@"%d", i.intValue ];
       
    }
    return self;
}
@end
