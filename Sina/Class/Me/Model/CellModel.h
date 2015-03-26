//
//  CellModel.h
//  Sina
//
//  Created by xhj on 15-3-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *cellTitle;
@property(nonatomic,copy) NSString *intro;
@property (nonatomic,assign) BOOL needShowDot;


-(instancetype)initWithDict:(NSDictionary *)dict;
//@property (nonatomic,strong) type *name;

@end
