//
//  HJHttpTool.m
//  Sina
//
//  Created by xhj on 15-3-20.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJHttpTool.h"

@implementation HJHttpTool


+(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id result))success fail:(void (^)(NSError * error))fail
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}



+(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id result))success fail:(void (^)(NSError *error))fail
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            fail(error);
        }
    }];

}
@end
