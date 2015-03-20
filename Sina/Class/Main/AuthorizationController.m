//
//  AuthorizationController.m
//  Sina
//
//  Created by xhj on 15-3-8.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "AuthorizationController.h"

#import "AFNetworking.h"

#import "TabBarController.h"


#define ID @"3931816980"
#define SECRET @"9b58bd8116b0d5728f7600ece3b9edb8"
#define TOKEN @"2.001SzMnFuMVFSE8af71ec565zuLtzC"


@interface AuthorizationController()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webView;


@end

@implementation AuthorizationController




-(void)viewDidLoad
{
    //第三方应用无法获得用户的账号和密码，登陆操作实在
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    self.webView.delegate =self;
    [self.view addSubview:self.webView];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=3931816980&redirect_uri=http://www.baidu.com"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
                            
                             
    
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *urlRequest = request.URL.absoluteString;
    NSRange range = [urlRequest rangeOfString:@"code="];
    if (range.length > 0) {
        //获取到code
        NSUInteger index = range.location + range.length;
        NSString *code = [urlRequest substringFromIndex:index];
//        NSLog(@"code   %@",code);
        
        
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        dict[@"client_id"] =@"3931816980";
        dict[@"client_secret"] =@"9b58bd8116b0d5728f7600ece3b9edb8";
        dict[@"grant_type"] =@"authorization_code";
        dict[@"code"] =code;
        dict[@"redirect_uri"] =@"http://www.baidu.com";
//      如何将字典转化为NSString
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        
        [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:dict success:^(AFHTTPRequestOperation *operation, NSDictionary *accountDict) {
            NSLog(@"成功 %@",accountDict);
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            TabBarController *controller  = [[TabBarController alloc] init];
            window.rootViewController = controller;
            NSLog(@"aythor%@",window);
            
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"失败%@",error);
        }];
        
        
        
        
        
        
        
        
#pragma warning 这段代码有问题   但是自己不知道问题出现在什么地方
//        NSString *command  = [[NSString alloc] initWithFormat:@"http://open.weibo.com/wiki/Oauth2/access_token?client_id=3931816980&client_secret=9b58bd8116b0d5728f7600ece3b9edb8&grant_type=authorization_code&code=%@&redirect_uri=http://www.baidu.com",code];
//        NSLog(@"command   %@",command);
//        NSURLRequest * request = [NSURLRequest requestWithURL:[[NSURL alloc] initWithString:command]];
//        [self.webView loadRequest:request];
        return NO;
        
        
        
    }
    
    return YES;
}

//http://open.weibo.com/wiki/Oauth2/access_token
//App Key：3931816980
//App Secret：9b58bd8116b0d5728f7600ece3b9edb8

/*
 
 "access_token" = "2.001SzMnFuMVFSE8af71ec565zuLtzC";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 5307800180;

 
 */

@end
