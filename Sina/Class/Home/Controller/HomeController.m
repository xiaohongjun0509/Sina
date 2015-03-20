//
//  HomeController.m
//  模仿微博
//
//  Created by xhj on 15-3-6.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HomeController.h"
#import "HomeViewController1.h"
#import "TitleButton.h"
#import "AFNetworking.h"
#import "MainModal.h"
#import "ModalCell.h"
#import "NSBundle+Load.h"
#import "HJLoadMore.h"
static const NSString *GetParams = @"https://api.weibo.com/2/statuses/friends_timeline.json";

@interface HomeController ()

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) TitleButton *titleButton ;
@property(assign)BOOL isClicked;
@property (nonatomic,strong)NSMutableArray *status;
@property (nonatomic,strong) UIRefreshControl  *refresh;
@property (nonatomic,assign) BOOL isFooterShowing;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadViewController];
    
    
    //从网络加载数据
    [self showRefreshControl];
//    [self loadDataFromServer];
    [self setFooterView];
    
}


- (void)setFooterView
{
    self.isFooterShowing = NO;
    
}

-  (void)showRefreshControl
{
     self.refresh= [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [self.tableView addSubview:self.refresh];
    [self.refresh addTarget:self action:@selector(refreshControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.refresh beginRefreshing];//不会出发refreshControlValueChanged，因为是代码刷新的
    [self loadDataFromServer];
}

/**
 *  上拉刷新
 */
- (void) refreshControlValueChanged:(UIRefreshControl *)control
{
    
       [self loadDataFromServer];
    
}

- (void)loadDataFromServer
{
    AFHTTPRequestOperationManager *arom = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:ACCESSTOKEN forKey:@"access_token"];
    if (self.status.count) {
        MainModal *modal = [self.status firstObject];
        //用since——id来标记微博消息的顺序，但是，从服务器返回的消息中用id来标记的。
        dict[@"since_id"] = modal.since_id;
    }
    [arom GET:GetParams parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSArray *newStatusArray = responseObject[@"statuses"];
       NSArray *newStatusArray = [self parseArrayToModal:responseObject[@"statuses"]];
        //将更新的数据加到最前面
        NSRange range = NSMakeRange(0, newStatusArray.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.status insertObjects:newStatusArray atIndexes:indexSet];
        [self.tableView reloadData];
        [self.refresh endRefreshing];
        [self sendNewStatues:newStatusArray.count];
        //在合适的地方添加上自动刷新的功能。。。。这里现在不做处理
//        self.tableView.tableFooterView  = [[HJLoadMore alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
        //数据加载完之后，发送提示。
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];
}

-(NSMutableArray *)status
{
    if(_status == nil)
    {
        _status = [NSMutableArray array];
    }
    return  _status;
}


- (void)sendNewStatues:(NSUInteger)count
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 34, self.view.frame.size.width, 30)];
    label.backgroundColor = [UIColor orangeColor];
    label.textAlignment = UITextAlignmentCenter;
    if(count)
    {
        [label setText:[NSString stringWithFormat:@"更新%d条微博数据",count]];
    }else{
        [label setText:@"没有新的微博数据。。。"];
    }
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    [UIView animateWithDuration:1.0 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, 30);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f delay:2.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished)
         {
             label.hidden = YES;
         }];
    }];
    
    
}


- (NSArray *)parseArrayToModal:(NSArray *)rawArray
{
    NSMutableArray *mArray = [NSMutableArray array];
    for (id dict in rawArray) {
        MainModal *modal = [[MainModal alloc] initWithDict:dict];
        [mArray addObject:modal];
    }
    
    return mArray;
}

-(void) loadViewController
{
    
    self.status = [NSMutableArray array];
    UIButton *leftButton = [[UIButton alloc] init];
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addLeftButton:leftButton nLeft:@"navigationbar_friendsearch" selectedLeft:@"navigationbar_friendsearch_highlighted" rButton:rightButton norRight:@"navigationbar_pop" selRlght:@"navigationbar_pop_highlighted"];
    
    _titleButton = [[TitleButton alloc] initWithFrame:CGRectMake(0,0,60,35)];
    [_titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [_titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down" ] forState:UIControlStateNormal];
    //    [_titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up" ] forState:UIControlStateSelected];
    [_titleButton setBackgroundImage:[UIImage resizeImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    _titleButton.adjustsImageWhenHighlighted = NO;
    [_titleButton addTarget:self action:@selector(titleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _titleButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.isFooterShowing = NO;

}

-(void)titleButtonClicked
{
    
    [UIView animateWithDuration:0.5 animations:^()
     {
      
         if (_isClicked) {
             _isClicked =!_isClicked;
         self.titleButton.imageView.transform = CGAffineTransformMakeRotation(2*M_PI_2);
         }else{
             _isClicked =!_isClicked;
             self.titleButton.imageView.transform = CGAffineTransformMakeRotation(0);
         }
     }];
    
}


-(void)leftButtonClick
{
    NSLog(@"leftButtonClick");
}



-(void)rightButtonClick
{
    NSLog(@"rightButtonClick");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    self.tableView.tableFooterView =
    return self.status.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    MainModal *modal = [self.status objectAtIndex:indexPath.row];
    cell.textLabel.text =  modal.text;
    //在主线程进行网络操作会阻塞当前的线程。所以要放在子线程里面。
//    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:modal.imageUrl ]];
//    cell.imageView.image = [UIImage imageWithData:data];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewController1 *controller = [HomeViewController1 alloc];
    [self.navigationController pushViewController:controller animated:YES];
}






@end
