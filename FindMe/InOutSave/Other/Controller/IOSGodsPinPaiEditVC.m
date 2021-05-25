//
//  IOSGodsPinPaiEditVC.m
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import "IOSGodsPinPaiEditVC.h"
#import "IOSCaiGouChoTBCell.h"
#import "IOSGodspinpaiM.h"
#import "IOSGodsChoosePinPaiVC.h"
@interface IOSGodsPinPaiEditVC ()<UITableViewDelegate,UITableViewDataSource,IOSMessageAlertViewDelegate>

@end

@implementation IOSGodsPinPaiEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-100;

    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSCaiGouChoTBCell" bundle:nil] forCellReuseIdentifier:@"IOSCaiGouChoTBCell"];
    [self creatBottomView];
}
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backButton.titleLabel.font = FONT(18);
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

    if (self.status==1&&self.type ==1) {
        [backButton setTitle:@"新增品牌" forState:0];

    }else if (self.status==1&&self.type ==2){
        [backButton setTitle:@"修改品牌" forState:0];
        self.navigationItem.rightBarButtonItem = rightBarItem;

    }else if (self.status==3&&self.type ==2){
        [backButton setTitle:@"修改单位" forState:0];
        self.navigationItem.rightBarButtonItem = rightBarItem;

    }else if (self.status==1&&self.type ==2){
        [backButton setTitle:@"新增单位" forState:0];

    }

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
    [makeSureBtn setTitle:@"确认" forState:0];
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
    NSString *inputStr = [self getCellTextFieldStr];
    if (inputStr.length==0) {
        return;
    }

    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCode/editSave"];
    NSMutableDictionary *paramDic = [NSMutableDictionary
                                     dictionaryWithDictionary:@{@"name":inputStr,
                                                                                    @"status":@(self.status),
                                                                                    @"empId":kUser_id
    }];
    if (self.type==2) {
        [paramDic setObject:self.pinpaiModel.pinpaiId forKey:@"id"];
    }
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            [self poptoViewController];


        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];}

-(NSString *)getCellTextFieldStr{
    NSArray *cellsArr = [self.tabelView visibleCells];
    IOSCaiGouChoTBCell *tbCell = cellsArr[0];
    return tbCell.inputTF.text;
}
-(void)poptoViewController{
    for (UIViewController *temp in self.navigationController.viewControllers) {
               if ([temp isKindOfClass:[IOSGodsChoosePinPaiVC class]]) {
                  [self.navigationController popToViewController:temp animated:YES];
               }
    }
}
#pragma mark ---delegate----
-(void)makeSureBtnClickWithinputStr:(NSString *)inputStr{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCode/remove"];
    NSDictionary *paramDic = @{@"id":self.pinpaiModel.pinpaiId};
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            [self poptoViewController];
        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 1;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 110;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSCaiGouChoTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSCaiGouChoTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.rightArrowImageV.hidden = YES;
    if (self.status==1) {
        cell.NameLabel.text = @"品牌名称";
        cell.inputTF.placeholder = @"请输入品牌名称";
        if (self.type==2) {
            cell.inputTF.text = self.pinpaiModel.name;
        }
    }else if (self.status ==3){
        cell.NameLabel.text = @"单位名称";
        cell.inputTF.placeholder = @"请输入单位名称";
        if (self.type==2) {
            cell.inputTF.text = self.pinpaiModel.name;
        }
    }
    return cell;
}
@end
