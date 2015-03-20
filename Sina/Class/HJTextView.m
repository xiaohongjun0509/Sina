//
//  HJTextView.m
//  Sina
//
//  Created by xhj on 15-3-19.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HJTextView.h"
#import "HJToolBar.h"
#import "HJPhotoView.h"
@interface HJTextView()

@property(nonatomic,strong)UILabel *label;
@property (nonatomic,strong) HJPhotoView *photoView;

@end

@implementation HJTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        self.label = [[UILabel alloc] init];
        self.label.hidden = NO;
        self.label.textColor = [UIColor grayColor];
        [self addSubview:self.label];
        self.photoView = [[HJPhotoView alloc]init];
        [self addSubview:self.photoView];
        //这里为什么要-99而不是减去35那？  为什么要加上64
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.label setFrame:CGRectMake(0, 0, SCREENWIDTH, 30)];
}

-(void)setPlaceHolder:(NSString *)text
{
    [self.label setText:text];
    [self.label sizeToFit];
    [self.photoView setFrame:CGRectMake(0, 150, SCREENWIDTH, SCREENHEIGHT)];
}

-(void)setPlaceHolderHidden:(BOOL)hidden
{
    self.label.hidden = hidden;
}

//通过setText的方式来设置文本，不为触发textViewDidChange，所以可以手动重写setText方法来手动触发。
//还可以通过广播的方式来实现。
-(void)setText:(NSString *)text
{
    [super setText:text];
    if ([self.delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [self.delegate textViewDidChange:self];
    };
}

-(void)AddImage:(UIImage *)image
{
    [self.photoView addImage:image];
}



@end
