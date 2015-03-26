//
//  MeController.m
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "MeController.h"
#import "UIViewController+Extention.h"
#import "ProfileCommonCell.h"
@interface MeController ()
@property(strong,nonatomic)UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *title = @"设置";
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:13.0]];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0,0,size.width,size.height)];
    [button.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = buttonItem;
    [self addRightButton:button title:title];
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
   UIEdgeInsets inset = self.tableView.separatorInset;
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //初始化数据   二维数组
    self.dataArray  =@[
                       @[@{@"icon" : @"new_friend",@"cellTitle" : @"新的好友",@"intro":@"",@"needShowDot" : @"0"},
                       @{@"icon" : @"vip",@"cellTitle" : @"微博等级",@"intro":@"Lv4",@"needShowDot" : @"0"}],
                       @[@{@"icon" : @"album",@"cellTitle" : @"我的相册",@"intro":@"(1)",@"needShowDot" : @"0"},
                       @{@"icon" : @"collect",@"cellTitle" : @"我的收藏",@"intro":@"(0)",@"needShowDot" : @"0"},
                       @{@"icon" : @"like",@"cellTitle" : @"赞",@"intro":@"(0)",@"needShowDot" : @"0"}],
                       @[@{@"icon" : @"pay",@"cellTitle" : @"微博支付",@"intro":@"",@"needShowDot" : @"0"},
                       @{@"icon" : @"card",@"cellTitle" : @"个性化",@"intro":@"个性化设置",@"needShowDot" : @"0"}]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor grayColor];
//    [self.tableView registerClass:[ProfileCommonCell class] forCellReuseIdentifier:@"common"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProfileCommonCell" bundle:nil] forCellReuseIdentifier:@"common"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *data = self.dataArray[section];
    return data.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"common"];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
       NSArray * views = [bundle loadNibNamed:@"ProfileCommonCell" owner:self options:nil];
        
        cell = [views firstObject];
    }
    
    NSDictionary *dict = self.dataArray[indexPath.section][indexPath.row];
    CellModel *model = [[CellModel alloc] initWithDict:dict];
    [cell setCellModel:model];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = [[UIViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
//    [self presentViewController:nav animated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:indexPath];
}

@end
