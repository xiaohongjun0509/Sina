//
//  HJStatusToolBar.m
//  Sina
//
//  Created by xhj on 15-3-22.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJStatusToolBar.h"

@interface HJStatusToolBar ()
@property(nonatomic,strong)UILabel *label;
@end

@implementation HJStatusToolBar
//-(instancetype)init
//{
//    if (self = [super init] ) {
//        self.backgroundColor = [ UIColor blueColor];
//        self.frame= [[HJStatusToolBarFrams alloc] init];
//        HJStatusOriginViewFrame * frame = [[HJStatusOriginViewFrame alloc] initWithModel:nil];
//        [self setFrame:CGRectMake(0, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
//    }
//    return  self;
//}

-(instancetype) initWithModel :(HJStatusModel*)model;
{
    if (self = [super init] ) {
        self.backgroundColor = [ UIColor blueColor];
        HJStatusToolBarFrams *frame = [[HJStatusToolBarFrams alloc] initWithModel:model];
        [self setFrame:frame.toolBarFrame];
        
        
    }
    return  self;
}
@end
