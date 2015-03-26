//
//  HJHttpTool.m
//  Sina
//
//  Created by xhj on 15-3-20.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJHttpTool.h"

//#import ""

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

+(void)post:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler
{
    if (params !=nil) {
        NSURL *url = [NSURL URLWithString:urlStr];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        request.HTTPMethod = @"POST";
        NSMutableString *content =[[NSMutableString alloc] init];
        for (NSString *key in params.allKeys) {
            id obj = params[key];
            if ([obj isKindOfClass:[NSString class]]) {
                [content appendString:[NSString stringWithFormat:@"%@=%@",key,params[key]]];
                if (![key isEqualToString:[params.allKeys lastObject]]) {
                    [content appendString:@"&"];
            }else if([obj isKindOfClass:[NSData class]])
            {
                
            }
            }
        }
        NSLog(@"content %@",content);
        NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
        request.HTTPBody = data;
        [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)data.length] forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            if (handler) {
                handler(response,data,error);
            }
            
        }];
    }
   
    
    
}


+(void)post:(NSString *)urlStr params:(NSDictionary *)params  data:(NSData *)data success:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"pic" fileName:@"status.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject ----%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error -- %@",error);
    }];
    
}


@end
