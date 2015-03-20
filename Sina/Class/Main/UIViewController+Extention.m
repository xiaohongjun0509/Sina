//
//  UIViewController+Extention.m
//  Sina
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "UIViewController+Extention.h"

@implementation UIViewController (Extention)

    


-(void)addLeftButton:(UIButton *)lButton nLeft:(NSString *)nLeft selectedLeft:(NSString *)sLeft rButton :(UIButton *)rButton norRight:(NSString *)nRight selRlght:(NSString *)sRight {
    UIImage *image = [UIImage imageNamed:nLeft];
    [lButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [lButton setImage:[UIImage imageNamed:nLeft] forState:UIControlStateNormal];
    [lButton setImage:[UIImage imageNamed:sLeft] forState:UIControlStateHighlighted];

    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    
    image = [UIImage imageNamed:nRight];
    [rButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rButton setImage:[UIImage imageNamed:nRight] forState:UIControlStateNormal];
    [rButton setImage:[UIImage imageNamed:sRight] forState:UIControlStateHighlighted];
       UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    self.navigationItem.rightBarButtonItem = rightButton;


}



-(void)addRightButton:(UIButton *)button title:(NSString *)title
{

//    UIFont *font = [UIFont systemFontOfSize:13.0f];
//    CGSize frame  = [title sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 50)];
//     CGSize frame  = [title sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 50) lineBreakMode:NSLineBreakByTruncatingTail];
//    [button setFrame:CGRectMake (0,0,frame.width +10,frame.height+5)]; 这句话计算出来的Frame为什么不对
//    [button setFrame:CGRectMake (0,0,frame.width,frame.height)];
//    NSLog(@"%f",button.frame.size.width);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = buttonItem;

}



@end
