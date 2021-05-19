//
//  IOSChooseGoodsViewController.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSChooseGoodsViewController.h"
#import "IOSChooseGodsTBCell.h"

@interface IOSChooseGoodsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *choosedArr; //选择商品的数组

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
    self.navigationItem.title = @"选择商品";
    [self setNavbutton];
    [self initialData];

    [self CreatMainUI];
}
-(void)initialData{
//    self.NameArr =@[@"采购人",@"采购时间",@"采购商品"];
//    self.holderArr = @[@"请选择采购人员",@"请选择采购时间",@"请选择采购商品"];
//    for (int i=0; i<self.NameArr.count; i++) {
//        IOSCaiGouChooM *chooseM = [[IOSCaiGouChooM alloc] init];
//        chooseM.name = self.NameArr[i];
//        chooseM.holderStr = self.holderArr[i];
//        
//        [self.dataArr addObject:chooseM];
//        
//    }
    
}
//主视图
-(void)CreatMainUI{
    
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self creatBottomView];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSChooseGodsTBCell" bundle:nil] forCellReuseIdentifier:@"IOSChooseGodsTBCell"];
    
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:bottomView];
    
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(KDeviceWith-30-120, 10, 120, 60);
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:makeSureBtn];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:makeSureBtn.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    makeSureBtn.layer.mask = shapeLayer;
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-120-30-30, 20)];
    priceLabel.text = @"共0件商品";
    [bottomView addSubview:priceLabel];

}
#pragma mark ---delegate----

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 20;
    }
    return self.choosedArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return 100;
    }
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        IOSChooseGodsTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSChooseGodsTBCell"];
//        IOSCaiGouChooM *caigouModel = self.dataArr[indexPath.row];
//        cell.CaigouChooseModel = caigouModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
        
    }
    UITableViewCell *cell;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//设置导航栏
-(void)setNavbutton{
    UIBarButtonItem *leftTem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"guanbiicon"] style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popViewControllerAnimated:)];
    [self.navigationItem setLeftBarButtonItem:leftTem];
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"baiopan"] forState:UIControlStateNormal];


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
    if (self.chooseGodsBlock) {
        self.chooseGodsBlock(@[]);
    }
}
@end
