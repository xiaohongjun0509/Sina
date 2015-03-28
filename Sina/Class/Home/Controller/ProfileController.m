//
//  ProfileController.m
//  Sina
//
//  Created by xhj on 15-3-27.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "ProfileController.h"

#import "HJStatusModel.h"
#import "UIImageView+WebCache.h"
#import "HeaderView.h"
@interface ProfileController ()

@property (nonatomic,strong) HJStatusModel *model;
@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) UITableView *tableView;
@end


@implementation ProfileController


- (instancetype)initWithModel:(HJStatusModel *)model
{
    if (self = [super init])
    {
        _model = model;
        
//        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:0];
//        // 透明度设置为0.3
//        self.navigationController.navigationBar.alpha = 0.3;
//        // 设置为半透明
//        self.navigationController.navigationBar.translucent = YES;
        
        UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *buttomItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = buttomItem;
        //个人页的背景
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT )];
        self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
        [self.view addSubview:self.tableView];
        self.headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENHEIGHT, 150)];
        [self.headerView setModel:model];
//        self.tableView.tableHeaderView = self.headerView;
        [self.tableView setTableHeaderView:self.headerView];
        UIImageView *backImage =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 264)];
        [backImage setImageWithURL:[NSURL URLWithString:model.user.profileImg] placeholderImage:nil];
        [self.view addSubview:backImage];
        self.tableView.delegate = self;
        self.tableView.dataSource =self;
      
    }
    return self;
}




- (void)dismissSelf
{
    [self dismissViewControllerAnimated:self completion:nil];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = @"data";
    return  cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  20;
}



- (void)viewDidLoad {
    [super viewDidLoad];

}



@end
