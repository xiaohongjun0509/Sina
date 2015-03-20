//
//  UIViewController+Extention.h
//  Sina
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extention)


-(void)addLeftButton:(UIButton *)lButton nLeft:(NSString *)nLeft selectedLeft:(NSString *)sLeft rButton :(UIButton *)rButton norRight:(NSString *)nRight selRlght:(NSString *)sRight ;

-(void)addRightButton:(UIButton *)button norImg:(NSString *)norName selectedImg:(NSString *)name;

-(void)addRightButton:(UIButton *)button title:(NSString *)title;
@end
