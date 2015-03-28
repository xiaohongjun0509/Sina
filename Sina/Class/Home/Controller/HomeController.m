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
#import "HJUser.h"
#import "NSBundle+Load.h"
#import "HJLoadMore.h"
#import "HJHttpTool.h"
#import "UnreadModal.h"
#import "HJStatusModel.h"
#import "HJStatusFrame.h"
#import "HJStatusCell.h"
static const NSString *GetParams = @"https://api.weibo.com/2/statuses/friends_timeline.json";

@interface HomeController ()

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) TitleButton *titleButton ;
@property(assign)BOOL isClicked;
@property (nonatomic,strong)NSMutableArray *statusFrame;
@property (nonatomic,strong) UIRefreshControl  *refresh;
@property (nonatomic,strong) HJLoadMore *loadMore;
@property (nonatomic,assign) BOOL isFooterShowing;
//@property (nonatomic,strong) NSMutableArray *name;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadViewController];

    //从网络加载数据
    [self showRefreshControl];
//    [self loadDataFromServer];
    [self setFooterView];
    
    [self.tableView registerClass:[HJStatusCell class] forCellReuseIdentifier:@"cell"];
}


- (void)setFooterView
{

    HJLoadMore *loadMore = [[HJLoadMore alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.loadMore = loadMore;
    self.tableView.tableFooterView =loadMore;
    self.tableView.tableFooterView.hidden = YES;
    
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
//从服务器加载数据
- (void)loadDataFromServer
{
    AFHTTPRequestOperationManager *arom = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:ACCESSTOKEN forKey:@"access_token"];
    if (self.statusFrame.count) {
        HJStatusFrame *modalFrame = [self.statusFrame firstObject];
        //用since——id来标记微博消息的顺序，但是，从服务器返回的消息中用id来标记的。
        dict[@"since_id"] = modalFrame.model.lastStatusId;
    }
    [arom GET:GetParams parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
       NSArray *newStatusFrame = [self statusFromModelArray:responseObject[@"statuses"]];
        //将更新的数据加到最前面
        NSRange range = NSMakeRange(0, newStatusFrame.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.statusFrame insertObjects:newStatusFrame atIndexes:indexSet];
        [self.tableView reloadData];
        [self.refresh endRefreshing];
        [self sendNewStatues:newStatusFrame.count];
        //在合适的地方添加上自动刷新的功能。。。。这里现在不做处理
//        self.tableView.tableFooterView  = [[HJLoadMore alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
        //数据加载完之后，发送提示。
        //将TabBar badgeValue上的值进行设置
        self.tabBarItem.badgeValue = nil;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];
}





-(NSMutableArray *)statusFrame
{
    if(_statusFrame == nil)
    {
        _statusFrame = [NSMutableArray array];
    }
    return  _statusFrame;
}

//加载最新的数据
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


- (NSArray *)statusFromModelArray:(NSArray *)rawArray
{
    NSMutableArray *mArray = [NSMutableArray array];
    for (id dict in rawArray) {
        HJStatusModel *model = [[HJStatusModel alloc] initWithDict:dict];

        HJStatusFrame *frame = [[HJStatusFrame alloc] initWithDict:model];

        [mArray addObject:frame];
        
        
    }
    
    return mArray;
}

-(void) loadViewController
{
    
    self.statusFrame = [NSMutableArray array];
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
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.style = UITableViewStylePlain;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    /**
     *  1.获得下载文件的长度
     2.想POST请求头中分别写入要下在文件的长度，再来下载
     3.
     
     *
     *  @return <#return value description#>
     */
    
    NSURL * url = [NSURL URLWithString:@"http://www.sinaimg.cn/dy/slidenews/4_img/2015_11/704_1575962_849639.jpg"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"HEAD";
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connect start];
    
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    //如果多个网络请求的代理都是这个方法，如何区分这么多的请求的response呢。。。NSURLConnection -> NSURLRequest ->NSURL >absoluteString.
    long long len = response.expectedContentLength;
    [self startDownload:response.URL length:len];
//    [self];
//    NSLog(@"response ------ %@",response);
}


- (void)startDownload:(NSURL *)url length:(long long)len
{
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSString *picName  =[url.absoluteString substringFromIndex:(url.absoluteString.length - 10)];
    [self setCachePath:picName];
    //判断文件是否存在
        NSFileManager *filemanager = [NSFileManager defaultManager] ;
        if ([filemanager fileExistsAtPath:_cachePath]) {
            NSLog(@" 数据存在");
            return;
        }
    long long fromPos,toPos = 0;
    long long count  =20000;
    long long rest = 0;
    int threadCount = (int)len /count;
    rest = len % count;
    NSMutableData *content = [[NSMutableData alloc] init];
    for (int i = 0; i <= threadCount; i++) {
        fromPos = i * count;
        toPos = (i + 1) *count - 1;
        if (i == threadCount) {
            toPos = fromPos + rest;
        }
        NSString *range = [[NSString alloc]initWithFormat:@"Bytes=%lld - %lld",fromPos,toPos];
        NSMutableURLRequest *request  = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10000];
        [request setValue:range forHTTPHeaderField:@"Range"];
        NSLog(@"range %@",range);
        //这里采用的是同步下载的方式
        NSURLResponse *response  = nil;
        NSData *data =[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
        [self appendData:data];

    }
    //将文件直接写入到桌面的路径上。
    [content writeToFile:@"/Users/MLS/Desktop/1.png" atomically:YES];
}




- (void)appendData :(NSData *)data
{
    NSFileHandle *fp = [NSFileHandle fileHandleForWritingAtPath:self.cachePath];
    if (!fp) {
//        [[NSFileManager defaultManager] createFileAtPath:self.cachePath contents:data attributes:nil];
        if ([data writeToFile:self.cachePath atomically:YES]) {
            NSLog(@"create a file and write success");
        }else{
             NSLog(@"write failed ");
        }
       
    }else
    {
        NSLog(@"file exist");
        [fp seekToEndOfFile];
        [fp writeData:data];
        [fp closeFile];
    }
    
}


-(void)setCachePath:(NSString *)cachePath
{
    //获得下载的路径
    NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    _cachePath = [cacheDir stringByAppendingPathComponent:cachePath];
    NSLog(@"%@",_cachePath);

    
}

//为什么下面的路径名会导致创建不成功呢？
///Users/MLS/Library/Developer/CoreSimulator/Devices/8037529A-31D2-49EF-B452-0B511F681591/data/Containers/Data/Application/6E5AF9AE-0813-4C01-9625-948D1FDD27CF/Library/Caches/http:/www.sinaimg.cn/dy/slidenews/4_img/2015_11/704_1575962_849639.jpg
-(void)rightButtonClick
{
    NSLog(@"rightButtonClick");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.tableView.tableFooterView.hidden = self.statusFrame.count == 0 ? YES:NO;
    return self.statusFrame.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HJStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell =[[HJStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];;
    }
    HJStatusFrame *frame = [self.statusFrame objectAtIndex:indexPath.row];
    [cell setStatusFrame:frame];
    return cell;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

   HJStatusFrame *frame = [self.statusFrame objectAtIndex:indexPath.row];
    return frame.cellHeight ;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewController1 *controller = [HomeViewController1 alloc];
    [self.navigationController pushViewController:controller animated:YES];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.statusFrame.count <= 0 || self.loadMore.refreshing) return ;
    CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    
    CGFloat sawFooterH = self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height;
    
    if (delta <= sawFooterH) {
        [self.loadMore beginRefreshing];
        [self loadMoreStatuses];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 加载更多的微博数据
//            [self loadMoreStatuses];
//        });
    }
    


}

- (void)loadMoreStatuses
{
    NSString *url = @"https://api.weibo.com/2/statuses/home_timeline.json";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    HJStatusFrame *modelFrame = [self.statusFrame lastObject];
    [dict setValue:ACCESSTOKEN forKey:@"access_token"];
    [dict setValue:modelFrame.model.lastStatusId forKey:@"max_id"];
    [HJHttpTool get:url params:dict success:^(id  result) {
        NSArray *newStatusArray = [self statusFromModelArray:result[@"statuses"]];
        [self.statusFrame addObjectsFromArray:newStatusArray];
        [self.tableView reloadData];
        [self.loadMore endRefreshing];
        
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}



-(void)UpToTop
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
