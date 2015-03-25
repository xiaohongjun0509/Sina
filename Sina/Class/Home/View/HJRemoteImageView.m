//
//  HJRemoteImageView.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJRemoteImageView.h"
#import "HJImageCache.h"
@implementation HJRemoteImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView  =[[ UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        self.imageView.backgroundColor = [UIColor redColor];
        self.placeHolder = [UIImage imageNamed:@"avatar_default"];
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.image = self.placeHolder;
        [self addSubview:self.imageView];
        if (queue == nil) {
            queue = [[NSOperationQueue alloc]init];
        }
        
    }
    return self;
}


-(void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    [self downLoadPic:urlString];
}

- (void)downLoadPic:(NSString *)urlStr
{
    //先从内存中来加载
    //从内村中加载有问题，我的这个写法不对。
    NSData *picData = [[HJImageCache standardCache] dataForKey:_urlString];
    if (picData != nil) {
        self.imageView.image = [UIImage imageWithData:picData];
//        NSLog(@"loadfromdisk");
        return ;
    }
    
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

 
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = [[NSMutableData alloc] init];
//    NSLog(@"%@",response);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
//    NSLog(@"data----%@",data);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//    NSLog(@"loadfronserver");
    UIImage *image = [[UIImage alloc] initWithData:self.data];
    [[HJImageCache standardCache] setData:self.data forKey:self.urlString];
    self.imageView.image = image;
}







@end
