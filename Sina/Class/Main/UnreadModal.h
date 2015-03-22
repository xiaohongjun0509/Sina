//
//  NotificationModal.h
//  Sina
//
//  Created by xhj on 15-3-20.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnreadModal : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *cmt;
@property (nonatomic,copy) NSString *dm;
@property (nonatomic,copy) NSString *mention_status;
//@property (nonatomic,strong) type *name;
//@property (nonatomic,strong) type *name;
//@property (nonatomic,strong) type *name;



-(instancetype)initWithDict:(NSDictionary *)dict;
@end
