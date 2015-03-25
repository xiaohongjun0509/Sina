//
//  HJImageCache.m
//  Sina
//
//  Created by xhj on 15-3-23.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJImageCache.h"

@implementation HJImageCache


//NSNumber




+(instancetype)standardCache
{
    static HJImageCache * cache  = nil;
    if (cache == nil) {
        cache = [[HJImageCache alloc] initWithName:@"HJImageCache"];
    }
    return cache;
}

-(instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        //获得缓存的路径
         NSString *cacheDir = [self applicationCacheDictionary];
        self.path = [cacheDir stringByAppendingPathComponent:name];
    }
    return self;
}

-(NSString *)applicationCacheDictionary
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
}

-(void)setData:(NSData *)data forKey:(NSString *)key
{
    static NSOperationQueue *setDataQueue = nil;
    if (setDataQueue == nil) {
        setDataQueue = [[NSOperationQueue alloc] init];
    }
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:data,@"data",key,@"key", nil];
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(saveDataOperation:) object:dict];
    [setDataQueue addOperation:op];
}


-(void)saveDataOperation :(NSDictionary *)dict
{
    NSMutableData *data = [dict valueForKey:@"data"];
    NSString *key = [dict valueForKey:@"key"];
    NSString *dataPath = [self dataPathForKey:key];
    if (dataPath) {
        NSFileManager *manager  = [NSFileManager defaultManager];
        [manager createFileAtPath:dataPath contents:data attributes:nil];
    }
}

- (NSString *)dataPathForKey:(NSString *)key
{
    NSString *dataPath = nil;
    if (key) {
        dataPath = [self.path stringByAppendingPathComponent:key];
    }
    return dataPath;
}


-(NSData *)dataForKey :(NSString *)key
{
    NSData *data = nil;
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *dataPath =[self dataPathForKey:key];
    if (dataPath && [manager fileExistsAtPath:dataPath]) {
        data = [[NSData alloc] initWithContentsOfFile:dataPath];
    }
    return data;
}

@end
