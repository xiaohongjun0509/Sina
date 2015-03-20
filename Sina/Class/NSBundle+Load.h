//
//  NSBundle+Load.h
//  Sina
//
//  Created by xhj on 15-3-18.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Load)

+(instancetype) firstObjectFromNib:(NSString *)nibName ofClass:(Class)aClass;

+(instancetype)firstObjectOfClass:(Class)aClass;


@end
