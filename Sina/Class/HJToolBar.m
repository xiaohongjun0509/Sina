//
//  HJToolBar.m
//  Sina
//
//  Created by xhj on 15-3-19.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJToolBar.h"
#import "UIImage+Extendion.h"
@implementation HJToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"compose_toolbar_background"]];
        
        // 添加所有的子控件
        [self addButtonWithIcon:@"compose_camerabutton_background" highIcon:@"compose_camerabutton_background_highlighted" tag:ToolButtonTypeCamera];
        [self addButtonWithIcon:@"compose_toolbar_picture" highIcon:@"compose_toolbar_picture_highlighted" tag:ToolButtonTypePicture];
        [self addButtonWithIcon:@"compose_mentionbutton_background" highIcon:@"compose_mentionbutton_background_highlighted" tag:ToolButtonTypeMention];
        [self addButtonWithIcon:@"compose_trendbutton_background" highIcon:@"compose_trendbutton_background_highlighted" tag:ToolButtonTypeTopic];
        [self addButtonWithIcon:@"compose_emoticonbutton_background" highIcon:@"compose_emoticonbutton_background_highlighted" tag:  ToolButtonTypeEmotion];
    }
    return self;
}

-(void)buttonDidClick:(UIButton *)button
{
    [self.delegate buttonDidClick:button];
}

-(void) addButtonWithIcon:(NSString *)img1 highIcon:(NSString *)img2 tag:(ToolButtonType)type
{
    UIButton *button = [[UIButton alloc] init];
    [button setContentMode:UIViewContentModeCenter];
    
    [button setImage:[UIImage imageWithName:img1] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:img2] forState:UIControlStateHighlighted];
    button.tag = type;
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = SCREENWIDTH / 5;
    NSArray *views = [self subviews];
    CGFloat height = [UIImage imageWithName:@"compose_emoticonbutton_background_highlighted"].size.height;
    if (views.count == 5) {
        for (int i = 0; i< views.count; i++) {
            UIButton *button  = [views objectAtIndex:i];
            CGRect frame = button.frame;
            frame.origin.x = i *width;
            frame.size.width = width;
            frame.size.height = 35;
            [button setFrame: frame];
            
        }
    }
    
}



@end
