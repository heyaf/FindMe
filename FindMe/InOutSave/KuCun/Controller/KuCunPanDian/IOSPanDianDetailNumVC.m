//
//  IOSPanDianDetailNumVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSPanDianDetailNumVC.h"
#import "IOSGodsDetailTBCell.h"
#import "IOSPanDianChoDetailVC.h"
@interface IOSPanDianDetailNumVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *headerButArr;
@property (nonatomic,strong) UIView *cellHeaderView;
@end

@implementation IOSPanDianDetailNumVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatMainUI];
    [self creatBottomView];
    [self setNavbutton];
    [self popParentVC];

}
//主视图
-(void)CreatMainUI{
    

    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSGodsDetailTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsDetailTBCell"];
    
}
//-(UITableView *)tableView{
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight-KEVNScreenTopStatusNaviHeight-80) style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        [_tableView
//        _tableView.dataSource = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
//        //刷新
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    }
//    return _tableView;
//}

- (void)loadNewData {

}
//加载更多
- (void)loadMoreData {
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSGodsDetailTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsDetailTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 44)];
    [headView addSubview:self.cellHeaderView];
    return headView;
}

//设置导航栏
-(void)setNavbutton{
    self.navigationItem.title = @"盘点数量";
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"addPhotoSet"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 35,35);

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;


}

-(UIView *)cellHeaderView{
    if (!_cellHeaderView) {
        _cellHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 44)];
        _cellHeaderView.backgroundColor = RGBA(245, 245, 245, 245);
        [self addHeaderSubViews];
    }
    return _cellHeaderView;
}
-(void)addHeaderSubViews{
    NSArray *titleArr = @[@"全部",@"可回收",@"不可回收"];
    for (int i =0; i<titleArr.count; i++) {
        UIButton *but = [UIButton buttonWithType:0];
        but.frame = CGRectMake(KDeviceWith/3*i, 0, KDeviceWith/3, 44);
        [but setTitle:titleArr[i] forState:0];
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:RGBA(245, 245, 245, 1) size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
        but.titleLabel.font = kFONT(16);
        if (i==0) {
            [but setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
            [but setTitleColor:[UIColor blackColor] forState:0];
            but.titleLabel.font = FONT(18);
        }
        
        but.tag = 521+i;
        [but addTarget:self action:@selector(buttonClikced:) forControlEvents:UIControlEventTouchUpInside];
         
        [self.headerButArr addObject:but];
        [self.cellHeaderView addSubview:but];
        
    }
}
-(void)buttonClikced:(UIButton *)button{
    for (UIButton *but in self.headerButArr) {
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
        but.titleLabel.font = kFONT(16);
    }
    [button setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    button.titleLabel.font = FONT(18);
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor redColor];

    [self.view addSubview:bottomView];

    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-30-120, 10, 120, 60)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, 120, 60);
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];


    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-120-30-30, 20)];
    priceLabel.text = @"共0件商品，共计0.00元";
    [bottomView addSubview:priceLabel];

}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pandiansearch{

}
-(void)makeSureBtnClicked{

}
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
}
//父级视图出栈
- (void)popParentVC
{
    if (self.navigationController.viewControllers.count >= 3) {//viewControllers.count大于3 才有中间页面
        NSMutableArray *array = self.navigationController.viewControllers.mutableCopy;
    
        NSMutableArray *arrRemove = [NSMutableArray array];

        for (UIViewController *vc in array) {
        //判断需要销毁的控制器 加入数组
        if ([vc isKindOfClass:[IOSPanDianChoDetailVC class]]||[vc isKindOfClass:[IOSPanDianChoDetailVC class]]) {
            
        }else{
            [arrRemove addObject:vc];
        }
    }
    
    if (arrRemove.count) {
        [self.navigationController setViewControllers:arrRemove animated:NO];
    }
    
   }
    self.hidesBottomBarWhenPushed = YES;

}
@end
