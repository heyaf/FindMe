//
//  IOSGodsDetailVC.m
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import "IOSGodsDetailVC.h"
#import "IOSGodsListM.h"
#import "IOSGodsDetailView.h"
#import "IOSGodDetailSubView.h"
#import "IOSAddGodsVC.h"
@interface IOSGodsDetailVC ()<IOSMessageAlertViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSGodsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-100;

    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    

    [self creatBottomView];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabelView reloadData];
}
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backButton.titleLabel.font = FONT(18);
    [backButton setTitle:@"商品详情" forState:0];
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitleColor:[UIColor blackColor] forState:0];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"IOSDeleteIcon"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(deleteItem) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBarItem;

  

}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-100-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 100+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = RGBA(250, 250, 250, 1);

    [self.view addSubview:bottomView];

    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, 10, KDeviceWith-40, 60)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, KDeviceWith-40, 60);
    [makeSureBtn setTitle:@"编辑" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)deleteItem{
    NSString *titleStr = @"确定删除吗？";
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:18],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, titleStr.length)];
    IOSMessageAlertView *alertView = [[IOSMessageAlertView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight) type:IOSMesAlertTypeChoose titleStr:attriStr cancleBtnName:@"确认" sureBtnName:@"取消" DetailBtnName:@""];
    alertView.delegate = self;
    [alertView show];
}
-(void)makeSureBtnClicked{
    IOSAddGodsVC *pushVC = [[IOSAddGodsVC alloc] init];
    pushVC.godsModel = self.godsModel;
    kWeakSelf(self)
    pushVC.ChangeBlock = ^(IOSGodsListM * _Nonnull godsModel) {
        weakself.godsModel = godsModel;
    };
    [self.navigationController pushViewController:pushVC animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        IOSGodsDetailView *detailView = [[IOSGodsDetailView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100) andModel:self.godsModel];
        return detailView.height;
    }
    IOSGodDetailSubView *subView = [[IOSGodDetailSubView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100) withStr:self.godsModel.detail];
    return subView.height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    [cell.contentView removeAllSubviews];
    if (indexPath.row==0) {
        IOSGodsDetailView *detailView = [[IOSGodsDetailView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100) andModel:self.godsModel];
        [cell.contentView addSubview:detailView];
        return cell;

    }
    IOSGodDetailSubView *subView = [[IOSGodDetailSubView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100) withStr:self.godsModel.detail];
    [cell.contentView addSubview:subView];
    return cell;
}
#pragma mark ---delegate----
-(void)makeSureBtnClickWithinputStr:(NSString *)inputStr{

    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdGoods/remove"];
    NSDictionary *paramDic = @{@"id":self.godsModel.GodsId};
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            [self showHint:@"删除成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [self showHint:responseObject[@"msg"]];

        }
        [self hideHud];


    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];

    }];
}
@end
