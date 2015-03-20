//
//  SearchBar.m
//  Sina
//
//  Created by xhj on 15-3-8.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "SearchBar.h"

#import"UIView+Extention.h"

@implementation SearchBar


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self =[super initWithFrame:frame])
    {
//        UIImage *image = [[UIImage alloc] init];
        UIImage *image = [UIImage imageWithName:@"searchbar_textfield_search_icon"];
        UIImageView *leftView = [[UIImageView alloc] initWithImage:image];
        leftView.contentMode = UIViewContentModeCenter;
        leftView.width = image.size.width+10;
        leftView.height = image.size.height;
        self.leftView = leftView;
        
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.background = [UIImage resizeImage:@"searchbar_textfield_background"];
        
        self.contentVerticalAlignment =  UIControlContentVerticalAlignmentCenter;
        
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        self.rightViewMode = UITextFieldViewModeAlways;
        
    }
    
    return self;
}


@end
