//
//  NSBundle+Load.m
//  Sina
//
//  Created by xhj on 15-3-18.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "NSBundle+Load.h"

@implementation NSBundle (Load)
+(instancetype)firstObjectFromNib:(NSString *)nibName ofClass:(Class)aClass
{
    NSArray *topLevelArray = [[self mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (id obj in topLevelArray) {
        if ([obj isKindOfClass:aClass]) {
            return obj;
        }
    }
    return nil;
}



+(instancetype)firstObjectOfClass:(Class)aClass{
    
    NSString *nibName  = NSStringFromClass(aClass);
    return [self firstObjectFromNib:nibName ofClass:aClass];
    
}
@end
