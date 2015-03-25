//
//  ComposeMessageController.m
//  Sina
//
//  Created by xhj on 15-3-15.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "ComposeMessageController.h"

#import "HJTextView.h"
#import "AFNetworking.h"
#import "HJHttpTool.h"
static  const NSString * url = @"https://api.weibo.com/2/statuses/update.json";
@interface ComposeMessageController ()
@property(nonatomic,strong)HJTextView *textView;
@property (nonatomic,strong) HJToolBar *toolBar;
@property (nonatomic,strong) NSMutableArray *imgArray;
@end

@implementation ComposeMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardChanged:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardChanged:) name:UIKeyboardWillHideNotification object:nil];
    self.imgArray = [NSMutableArray array];
}

-(void)keyBoardChanged:(NSNotification *)notification
{
//    NSLog(@"%@",notification);
    NSDictionary *dict = [notification userInfo];
    CGRect beginRect = [[dict objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat offset =  endRect.origin.y - beginRect.origin.y;
    CGFloat currentY= self.toolBar.frame.origin.y;
    if (offset < 0 ) {
        [UIView animateWithDuration:0.4 animations:^{
            self.toolBar.transform = CGAffineTransformMakeTranslation(0, offset);
        }completion:^(BOOL finished) {
            ;
        }];
    }else{
        [UIView animateWithDuration:0.4 animations:^{
            self.toolBar.transform = CGAffineTransformIdentity;
        }completion:^(BOOL finished) {
            ;
        }];
    }
    
    
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.textView resignFirstResponder];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- ( void)initController
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.title = @"发消息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(complete)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    self.view.backgroundColor = [UIColor grayColor];
     //这里哟啊采用自定义的TextView。
    self.textView = [[HJTextView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.textView setPlaceHolder:@"请输入你的微博信息"];
    [self.view addSubview:self.textView];
    self.textView.delegate = self;
    self.toolBar = [[HJToolBar alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT -35, SCREENWIDTH, 35)];
    self.toolBar.delegate =self;
    [self.view addSubview:self.toolBar];
//    [self.textView becomeFirstResponder];
}

-(void)complete
{
    NSLog(@"complete ------");
    if (self.imgArray.count) {
        //发布带图片的为微博数据
    }else
    {
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        NSMutableDictionary *params =[NSMutableDictionary dictionary];
        NSString *content = self.textView.text;
        [params setValue:ACCESSTOKEN forKey:@"access_token"];
        [params setValue:content forKey:@"status"];
        [HJHttpTool post:@"https://api.weibo.com/2/statuses/update.json" params:params success:nil];
        [self dismissViewControllerAnimated:self completion:nil];
        //         NSString *content = [self.textView.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        [mgr POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"%@",responseObject);
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"%@",error);
//        }];
        
//        NSURL * url = [NSURL URLWithString:@"https://api.weibo.com/2/statuses/update.json"];
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//        request.HTTPMethod = @"POST";
//        NSString *con  = @"access_token=2.001SzMnFuMVFSE8af71ec565zuLtzC&status=这是一个测试方法";
//        NSData *data = [con dataUsingEncoding:NSUTF8StringEncoding];
//        request.HTTPBody = data;
//        NSString *length = [NSString stringWithFormat:@"%lu",(unsigned long)data.length];
//        [request setValue:length forHTTPHeaderField:@"Content-Length"];
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
//        //发送请求的方法1.
////        [conn start];
//        //通过队列来发送数据请求
//        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//            NSLog(@"response :%@",response);
//        }];
        
        
    }
}





-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)textViewDidChange:(UITextView *)textView{

    [self.textView setPlaceHolderHidden:textView.text.length == 0? NO:YES];
    self.navigationItem.rightBarButtonItem.enabled = textView.text.length == 0? NO:YES;
}


#pragma mark HJToolBarDelegate

-(void)buttonDidClick:(UIButton *)button
{
    ToolButtonType type = button.tag;
    switch (type) {
        case ToolButtonTypeCamera:
            [self cameraButtonDidClick];
            break;
            
        case ToolButtonTypeEmotion:
            [self emotionButtonDidClick];
            break;
            
        case ToolButtonTypePicture:
            [self pictureButtonDidClick];
            break;
            
        case ToolButtonTypeTopic:
            [self topicButtonDidClick];
            break;
            
        case ToolButtonTypeMention:
            [self mentionButtonDidClick];
            break;
            
    }
}



-(void)cameraButtonDidClick
{
    NSLog(@"cameraButtonDidClick");
}


-(void)emotionButtonDidClick
{
    NSLog(@"cameraButtonDidClick");
}

-(void)pictureButtonDidClick
{
    NSLog(@"pictureButtonDidClick");
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    controller.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:controller animated:YES completion:nil];
}


-(void)topicButtonDidClick
{
    NSLog(@"topicButtonDidClick");
}


-(void)mentionButtonDidClick
{
    NSLog(@"mentionButtonDidClick");
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    NSLog(@"%@",image);
//    [self dismissViewController pickerAnimated:picker completion:nil];
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self.textView AddImage:image];
}

@end
