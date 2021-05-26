//
//  IOSChooseGoodsViewController.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSChooseGoodsViewController.h"
#import "IOSGodsDetailTBCell.h"
#import "IOSCaiGouListModel.h"

@interface IOSChooseGoodsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *choosedArr; //选择商品的数组
@property (nonatomic,strong) UILabel *priceLabel;
@end

@implementation IOSChooseGoodsViewController
-(NSMutableArray *)choosedArr{
    if (!_choosedArr) {
        _choosedArr = [NSMutableArray array];
    }
    return _choosedArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavbutton];
    [self initialData];

    [self CreatMainUI];
}
-(void)initialData{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCheck/getGoods"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSArray *dateArr= responseObject[@"data"][@"list"];
            self.dataSource = [IOSCaiGouListModel arrayOfModelsFromDictionaries:dateArr error:nil];
            [self.tabelView reloadData];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.dataSource removeAllObjects];
            [self.tabelView reloadData];

            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
}
//主视图
-(void)CreatMainUI{
    
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self creatBottomView];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSGodsDetailTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsDetailTBCell"];
    
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bottomView];
    
    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-30-120, 10, 120, 50)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 25;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, 120, 50);
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];

    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-120-30-30, 20)];
    priceLabel.text = @"共0件商品";
    self.priceLabel = priceLabel;
    [bottomView addSubview:priceLabel];

}
#pragma mark ---delegate----

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 130;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        IOSGodsDetailTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsDetailTBCell"];
        IOSCaiGouListModel *caigouModel = self.dataSource[indexPath.row];
        cell.caigouChooseGodsM = caigouModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.CaigouChooseModel = caigouModel;
        cell.godsListType = 2;
        return cell;
        
        
    }
    UITableViewCell *cell;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSCaiGouListModel *caigouModel = self.dataSource[indexPath.row];
    caigouModel.isSelected = !caigouModel.isSelected;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self reloadBottomView];
}
-(void)reloadBottomView{
    NSMutableArray *dateArr = [NSMutableArray arrayWithCapacity:0];
    NSInteger count =0;
    for (IOSCaiGouListModel *caigouModel in self.dataSource) {
        if (caigouModel.isSelected) {
            [dateArr addObject:caigouModel];
            count++;
        }
    }
    self.priceLabel.text = kStringFormat(@"已选择%li件商品",count);
}

//设置导航栏
-(void)setNavbutton{
    self.navigationItem.title = @"选择商品";
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"IOSGuanbi"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 35,35);

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"IOSsearchI"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}
#pragma mark ---点击事件----
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)searchButtonClicked{
    
}
-(void)makeSureBtnClicked{

    NSMutableArray *dateArr = [NSMutableArray arrayWithCapacity:0];
    for (IOSCaiGouListModel *caigouModel in self.dataSource) {
        if (caigouModel.isSelected) {
            [dateArr addObject:caigouModel];
        }
    }

    
    if (dateArr.count==0) {
        [self showHint:@"请先选择商品"];
        return;
    }
    if (dateArr.count>0&&self.chooseGodsBlock) {
        self.chooseGodsBlock(dateArr);
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
