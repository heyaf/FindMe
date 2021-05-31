//
//  FMZWEditWishVC.m
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import "FMZWEditWishVC.h"

@interface FMZWEditWishVC ()
//tableView头部视图
@property(nonatomic, assign)NSInteger       imageHeight;
@end

@implementation FMZWEditWishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageHeight = kScreenW/1125*895;// 背景图片的高度
    [self createTableViewHeaderView];

//    [self CreatTableview];
    
}
#pragma mark - 创建头视图
- (void)createTableViewHeaderView
{
//    UIImageView *headerBackView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, _imageHeight)];
    // 背景图
    UIImageView *headerBackView = [[UIImageView alloc] init];
    headerBackView.backgroundColor = FMWZMainColor;
    headerBackView.frame = CGRectMake(0, 0, kScreenW, _imageHeight);
    headerBackView.contentMode = UIViewContentModeScaleAspectFill;
    headerBackView.image = ImageNamed(@"EMWLjishuabgview");
    [self.view addSubview:headerBackView];
}
-(void)CreatTableview{
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];


}

@end
