//
//  UIImage+Extendion.m
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "UIImage+Extendion.h"
#import "Utility.h"
@implementation UIImage (Extendion)

+(UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if ([Utility IOS7]) {
        image = [UIImage imageNamed:[name stringByAppendingString:@"_os7"]];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+(UIImage *)resizeImage:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
  
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    
    
//    return image;
}
@end
