//
//  IOSGodsHisDetailVC.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSGodsHisDetailVC.h"

@interface IOSGodsHisDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSGodsHisDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreatMainUI];
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
    [makeSureBtn setTitle:@"入库" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:makeSureBtn];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:makeSureBtn.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    makeSureBtn.layer.mask = shapeLayer;
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-120-30-30, 20)];
    priceLabel.text = @"待入库30件，实际入库30件";
    [bottomView addSubview:priceLabel];

}
-(void)makeSureBtnClicked{

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    return cell;
}

@end
