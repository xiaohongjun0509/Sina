//
//  HJTextView.h
//  Sina
//
//  Created by xhj on 15-3-19.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJToolBar.h"
@interface HJTextView : UITextView

-(void)setPlaceHolder:(NSString *)text;
-(void)setPlaceHolderHidden :(BOOL) hidden;
-(void)AddImage:(UIImage *)image;

@end
