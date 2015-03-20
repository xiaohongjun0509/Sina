//
//  NewFeatureController.m
//  Sina
//
//  Created by xhj on 15-3-15.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#define PageCount 4

#import "NewFeatureController.h"

#import "TabBarController.h"

@interface NewFeatureController ()<UIScrollViewDelegate>
@property(nonatomic,strong) UIScrollView *scrollView ;
@property(nonatomic,strong) UIPageControl *pageControl;
@end

@implementation NewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    [self initScrollView];
    [self initPageControl];
}

-(void)initScrollView
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"new_feature_1"]];
    self.scrollView.contentSize = CGSizeMake(imageView.frame.size.width * PageCount,0);
    self.scrollView.showsHorizontalScrollIndicator  = NO;
    self.scrollView.pagingEnabled = YES;
    for (int i = 0; i < PageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:[NSString stringWithFormat :@"new_feature_%d",(i + 1)]]];
        [imageView setFrame:CGRectMake(imageView.frame.size.width*i , 0, imageView.frame.size.width, imageView.frame.size.height)];
        [self.scrollView addSubview:imageView];
        if (i == PageCount -1) {
//            imageView
            UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(130, self.view.frame.size.height -140, 80, 30)];
            [button setTitle:@"开启微博" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [UIColor redColor];
            //添加到ImageView上面的button为什么不能点击。
            [imageView setUserInteractionEnabled:YES];
            [imageView addSubview:button];
        }
    }
    self.scrollView.delegate = self;
}


-(void)start
{
    NSLog(@"start");
    TabBarController *controller = [[TabBarController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = controller;
}


-(void)initPageControl
{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, 10)];
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = PageCount;
    self.pageControl.currentPage = 0;
    self.pageControl.center = CGPointMake (self.view.frame.size.width *0.5,self.view.frame.size.height-30);
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    self.pageControl.tintColor = [UIColor blackColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat percent = scrollView.contentOffset.x / self.view.frame.size.width;
    int page = (int)(percent + 0.5);
    self.pageControl.currentPage = page;
}


@end
