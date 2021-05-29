//
//  IOSSunHaoAddDetailVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSSunHaoAddDetailVC.h"
#import "IOSCaiGouHeaderTBCell.h"
#import "IOSGodsDetailTBCell.h"
#import "IOSSunHaoListVC.h"
#import "IOSAddHuiShouM.h"
@interface IOSSunHaoAddDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *headerButArr;
@property (nonatomic,strong) UIView *cellHeaderView;
@property (nonatomic,strong) NSDictionary *headerDic;
@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,strong) UILabel *priceLabel;

@end

@implementation IOSSunHaoAddDetailVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatMainUI];
    self.selectIndex = 0;
    [self getListDatawithType:0];
}
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
}
-(void)getListDatawithType:(NSInteger)type{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdLoss/mateList"];
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"mateId":self.mateId
    };
    NSMutableDictionary *MutparamDic = [NSMutableDictionary
                                     dictionaryWithDictionary:paramDic];


    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:MutparamDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSDictionary *datdic = responseObject[@"data"];

            self.dataSource = [IOSAddHuiShouM arrayOfModelsFromDictionaries:datdic[@"list"] error:nil];
            NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:datdic];
            
            [mutDic setValue:@([self managernum1]) forKey:@"totalNum"];
            [mutDic setValue:[self managerPrice] forKey:@"totalPrice"];

            self.headerDic = mutDic;
            [self managerData];
            [self ChargePrice];

            [self.tabelView reloadData];

        }else {
            [self showHint:responseObject[@"msg"]];

            [self.dataSource removeAllObjects];
            [self.tabelView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];

            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];

    
}
-(void)managerData{
    for (IOSAddHuiShouM *shouM in self.dataSource) {
        shouM.selectCount = shouM.outStockNum;
    }
}
-(NSInteger)managernum1{
    NSInteger count = 0;
    for (IOSAddHuiShouM *listModel in self.dataSource) {
//            count+=listModel.num;
        count++;
    }
    return count;
}
-(NSString *)managerPrice{
    CGFloat count = 0.00;
    for (IOSAddHuiShouM *listModel in self.dataSource) {
            count+=[listModel.price floatValue];
    }
    return kStringFormat(@"%.2f",count);
}
-(NSArray *)manageChooseDate{
    if (self.selectIndex==0) {
        return self.dataSource;
    }
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
        for (IOSAddHuiShouM *listModel in self.dataSource) {
            if (listModel.isRecycle!=self.selectIndex) {
                [mutArr addObject:listModel];
            }
        }
        return mutArr;

}
//主视图
-(void)CreatMainUI{
    

    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-100;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSGodsDetailTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsDetailTBCell"];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSCaiGouHeaderTBCell" bundle:nil] forCellReuseIdentifier:@"IOSCaiGouHeaderTBCell"];
    [self setNavBackStr:@"新增"];
    [self creatBottomView];

    
}
//设置导航栏
-(void)setNavBackStr:(NSString *)backTitle{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:backTitle forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
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

    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, KDeviceWith-120-30-30, 20)];
    self.priceLabel = priceLabel;
    [bottomView addSubview:priceLabel];
    NSString *priceStr =@"出库0件,损耗0件";
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(3, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(8, 1)];
    self.priceLabel.attributedText = attriStr;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return [self manageChooseDate].count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 110;
    }
    return 160;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        IOSCaiGouHeaderTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSCaiGouHeaderTBCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setaddhuishoudanHeadView:self.headerDic];
        return cell;
    }
    IOSGodsDetailTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsDetailTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSAddHuiShouM *instoreModel = [self manageChooseDate][indexPath.row];
    cell.addSunHaoM = instoreModel;
    kWeakSelf(self)
    kWeakSelf(cell)
    cell.unAddBtnClicked = ^{
        [weakself unaddBtnClicked:instoreModel indexPath:indexPath cell:weakcell];
    };
    cell.AddBtnClicked = ^{
        [weakself addBtnClicked:instoreModel indexPath:indexPath cell:weakcell];
    };
    cell.editRemarkBtnClicked = ^{
        [weakself addtextViewClicked:instoreModel indexPath:indexPath];
    };
    return cell;
}
-(void)addtextViewClicked:(IOSAddHuiShouM *)caigouM indexPath:(NSIndexPath*)indexPath{
    NSString *titleStr = @"添加备注";
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:18],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 4)];
    IOSMessageAlertView *slertView = [[IOSMessageAlertView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight) type:IOSMesAlertTypeTV titleStr:attriStr cancleBtnName:@"取消" sureBtnName:@"提交" DetailBtnName:@"请输入备注..."];
    slertView.TXSureBtnClick = ^(NSString * _Nonnull str) {
        caigouM.remark = str;
        [self.tabelView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    [slertView show];
}

//减按钮点击
-(void)unaddBtnClicked:(IOSAddHuiShouM *)caigouM indexPath:(NSIndexPath*)indexPath cell:(IOSGodsDetailTBCell *)cell{
    if (caigouM.selectCount==1) {
        return;
    }
    caigouM.selectCount--;

    [self.tabelView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self ChargePrice];
}
//加按钮点击
-(void)addBtnClicked:(IOSAddHuiShouM *)caigouM indexPath:(NSIndexPath*)indexPath cell:(IOSGodsDetailTBCell *)cell{

    caigouM.selectCount++;

    [self.tabelView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self ChargePrice];
}
-(void)ChargePrice{
    NSInteger count =0;
    NSInteger outCount =0;
    for (IOSAddHuiShouM *caigouModel in self.dataSource) {
        count+=caigouModel.outStockNum;
        outCount+=caigouModel.selectCount;
    }
    NSString *priceStr =kStringFormat(@"出库%li件，损耗%li件",count,outCount);
    NSString *countStr = kStringFormat(@"%li",count);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 2)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(2+countStr.length, 4)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(2, countStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    self.priceLabel.attributedText = attriStr;

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0.001)];
        return view;
    }
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 44)];
    [headView addSubview:self.cellHeaderView];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 44;
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
        
        [but setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
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
    self.selectIndex = button.tag -521;
    [self.tabelView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

-(void)makeSureBtnClicked{
    
    NSMutableArray *listArr = [NSMutableArray arrayWithCapacity:0];
    
    for (IOSAddHuiShouM *godsM in self.dataSource) {
        CGFloat floatValue = [godsM.price floatValue];
        CGFloat floatValue1 = round(floatValue*100)/100;
        NSDictionary *dic = @{@"goodsName":godsM.goodsName,
                              @"goodsId":godsM.goodsId,
                              @"img":godsM.img,
                              @"num":@(godsM.num),
                              @"price":@(floatValue1),
                              @"lossNum":@(godsM.selectCount),
                              
        };
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        if (godsM.remark.length>0) {
            [mutDic setValue:godsM.remark forKey:@"remark"];
        }

        [listArr addObject:mutDic];
    }
    NSString *listStr = [self zhuzuZhuangjson:listArr];
    
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdLoss/saveLoss"];

    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"getTime":self.headerDic[@"getTime"],
                               @"getUserName":self.headerDic[@"getUserName"],
                               @"getUserId":self.headerDic[@"getUserId"],
                               @"mateId":self.headerDic[@"mateId"],
                               @"mateName":self.headerDic[@"mateName"],
                               @"list":listStr
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSString *titleStr = @"新增成功";
            NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
            [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:18],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 4)];
            IOSMessageAlertView *slertView = [[IOSMessageAlertView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight) type:IOSMesAlertTypeMessage titleStr:attriStr cancleBtnName:@"" sureBtnName:@"好的,我知道了" DetailBtnName:@"可以在”物资损耗“中查看"];
            slertView.makeSureBtnClick = ^{
                [self makeSureBtnClic];
            };
            [slertView show];
        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
}
-(void)makeSureBtnClic{
    for (UIViewController *temp in self.navigationController.viewControllers) {
               if ([temp isKindOfClass:[IOSSunHaoListVC class]]) {
                  [self.navigationController popToViewController:temp animated:YES];
               }
    }
}
@end
