//
//  HJHttpTool.h
//  Sina
//
//  Created by xhj on 15-3-20.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

@interface HJHttpTool : NSObject


+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id result))success fail:(void (^)(NSError * error))fail;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id result))success fail:(void (^)(NSError * error))fail;
+(void)post:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler;
+(void)post:(NSString *)urlStr params:(NSDictionary *)params  data:(NSData *)data success:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler;
@end
