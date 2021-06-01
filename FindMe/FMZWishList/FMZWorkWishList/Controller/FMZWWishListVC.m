//
//  FMZWWishListVC.m
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import "FMZWWishListVC.h"
#import "FMWWishListM.h"
#import "FMZWListTBCell.h"
#import "FMZWEditWishVC.h"
@interface FMZWWishListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FMZWWishListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0,-KEVNScreenTopStatusNaviHeight , KDeviceWith, KDeviceHeight+KEVNScreenTopStatusNaviHeight) style:UITableViewStyleGrouped];
    self.tabelView.showsVerticalScrollIndicator = NO;
    self.tabelView.tableFooterView = [UIView new];
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tabelView];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.backgroundColor = FMWZMainColor;
    [self.tabelView registerNib:[UINib nibWithNibName:@"FMZWListTBCell" bundle:nil] forCellReuseIdentifier:@"FMZWListTBCell"];
    
    self.view.backgroundColor = FMWZMainColor;
//    UIImageView *bgVIew = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 20*100)];
//    bgVIew.image = ImageNamed(@"EMWLbgviewcell");
//    bgVIew.contentMode = UIViewContentModeScaleAspectFit;
//    [self.tabelView sendSubviewToBack:bgVIew];
//    [self.tabelView addSubview:bgVIew];
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self initData];
}
- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];


}
-(void)initData{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/selectWorkWish"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
            for (NSDictionary *dic in responseObject[@"data"]) {
                if ([dic[@"data"] isKindOfClass:[NSDictionary class]]) {
                    FMWWishListM *wishM = [[FMWWishListM alloc] initWithDictionary:dic[@"data"] error:nil];
                    
                    [mutArr addObject:wishM];
                }else{
                    FMWWishListM *wishM = [[FMWWishListM alloc] init];
                    wishM.name = dic[@"name"];

                    [mutArr addObject:wishM];

                }

            }
            self.dataSource = mutArr;
            [self.tabelView reloadData];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.dataSource removeAllObjects];
            [self.tabelView reloadData];

            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}

//设置导航栏
-(void)setNavbutton{
//    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    backButton.titleLabel.font = FONT(18);
//    backButton.frame = CGRectMake(0, 0, 60,35);
//    [backButton setTitle:@"物资领用历史" forState:0];
//    [backButton setTitleColor:[UIColor blackColor] forState:0];
//    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
//
//    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//
//    self.navigationItem.leftBarButtonItem = leftBarItem;

    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"EMWLjihua"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 80,30);

    [rightBtn addTarget:self action:@selector(personWishList) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;

}

-(void)personWishList{
    FMZWEditWishVC *pushVC = [[FMZWEditWishVC alloc] init];
    pushVC.type = 1;
    [self.navigationController pushViewController:pushVC animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FMZWListTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FMZWListTBCell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    FMWWishListM *wishM = self.dataSource[indexPath.row];
    cell.wishListM = wishM;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FMWWishListM *wishM = self.dataSource[indexPath.row];
    NSInteger type = 1;
    if (wishM.name.length==0) {
        return;
    }
    if ([wishM.name isEqualToString:@"本周"]) {
        type=2;
    }else if ([wishM.name isEqualToString:@"本月"]) {
        type=3;
    }else if ([wishM.name isEqualToString:@"本季度"]) {
        type=4;
    }else if ([wishM.name isEqualToString:@"本年"]) {
        type=5;
    }
    FMZWEditWishVC *pushVC = [[FMZWEditWishVC alloc] init];
    pushVC.type = type;
    [self.navigationController pushViewController:pushVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return KDeviceWith/1125*405;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return KDeviceWith/1125*502+20;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceWith/1125*405)];
    headerView.backgroundColor = FMWZMainColor;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceWith/1125*405)];
    imageView.image = ImageNamed(@"EMWLqingdan");
    [headerView addSubview:imageView];
    return headerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceWith/1125*502+20)];
    headerView.backgroundColor = FMWZMainColor;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, KDeviceWith, KDeviceWith/1125*405)];
    imageView.image = ImageNamed(@"EMWLFooterView");
    [headerView addSubview:imageView];
    return headerView;
}

@end
