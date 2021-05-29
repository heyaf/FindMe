//
//  IOSGodsHisDetailVC.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSGodsHisDetailVC.h"
#import "IOSInStoreHisVC.h"
#import "IOSGodsDetailTBCell.h"
#import "IOSCaiGouHeaderTBCell.h"
#import "IOSCaiGouListModel.h"
#import "IOSCaiGouEditM.h"
@interface IOSGodsHisDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *headerButArr;
@property (nonatomic,strong) UIView *cellHeaderView;

@property (nonatomic,strong) NSDictionary *headerDic;
@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,strong) UILabel *priceLabel;

@property (nonatomic,strong) NSMutableArray *editArr; //记录更改过价格的model数组

@property (nonatomic,strong) NSMutableArray *allDataArr; //记录所有数据
@end

@implementation IOSGodsHisDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectIndex = 0;
    [self CreatMainUI];
    [self getListDatawithType:0];
}
-(NSMutableArray *)editArr{
    if (!_editArr) {
        _editArr = [NSMutableArray array];
    }
    return _editArr;
}

-(void)getListDatawithType:(NSInteger)type{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdPurch/list"];
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"purchId":self.purchId
    };
    NSMutableDictionary *MutparamDic = [NSMutableDictionary
                                     dictionaryWithDictionary:paramDic];

    if (self.selectIndex>0) {
        [MutparamDic setObject:self.selectIndex==1?@(2):@(1) forKey:@"isRecycle"];
    }
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:MutparamDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSDictionary *datdic = responseObject[@"data"];

            self.headerDic = datdic;
            self.dataSource = [IOSCaiGouListModel arrayOfModelsFromDictionaries:datdic[@"list"] error:nil];
            if (type==1) {
                [self.tabelView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
            }else{
                [self.tabelView reloadData];
                [self ChargePriceWithData:self.dataSource];
                self.allDataArr = self.dataSource;

            }
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
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
}
//主视图
-(void)CreatMainUI{
    
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self creatBottomView];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSGodsDetailTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsDetailTBCell"];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSCaiGouHeaderTBCell" bundle:nil] forCellReuseIdentifier:@"IOSCaiGouHeaderTBCell"];
    [self setNavBackStr:@"采购单"];

    
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bottomView];
    if (self.type==1) {
        CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-30-120, 10, 120, 50)];
        bgView.borderTopLeftRadius = 10;
        bgView.borderTopRightRadius = 25;
        bgView.borderBottomLeftRadius = 10;
        bgView.borderBottomRightRadius = 10;
        [bottomView addSubview:bgView];
        UIButton *makeSureBtn = [UIButton buttonWithType:0];
        makeSureBtn.frame = CGRectMake(0, 0, 120, 50);
        [makeSureBtn setTitle:@"入库" forState:0];
        makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
        [bgView addSubview:makeSureBtn];
        [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];

        
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, KDeviceWith-120-30-30, 20)];
        priceLabel.text = @"待入库0件，实际入库0件";
        self.priceLabel = priceLabel;
        [bottomView addSubview:priceLabel];
    }else{
        CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, 0, KDeviceWith-40, 60)];
        bgView.borderTopLeftRadius = 10;
        bgView.borderTopRightRadius = 30;
        bgView.borderBottomLeftRadius = 10;
        bgView.borderBottomRightRadius = 10;
        bgView.backgroundColor = IOSCancleBtnColor;
        [bottomView addSubview:bgView];
        


        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-40-40, 20)];
        priceLabel.text = @"查看入库单";
        priceLabel.font = kBOLDFONT(16);
        priceLabel.textColor = IOSMainColor;
        priceLabel.textAlignment = NSTextAlignmentCenter;
        
        [bgView addSubview:priceLabel];
        
        UIButton *chakanBtn = [UIButton buttonWithType:0];
        chakanBtn.frame = CGRectMake(0, 0, bgView.width, bgView.height);
        [chakanBtn addTarget:self action:@selector(chakanBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:chakanBtn];
        
       
    }


}
-(void)chakanBtnClicked{
    IOSInStoreHisVC *pushVC = [[IOSInStoreHisVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
-(void)ChargePriceWithData:(NSArray *)dataArr{
    NSInteger count =0;
    for (IOSCaiGouListModel *caigouModel in dataArr) {
        count+=caigouModel.inNum;
    }
    NSString *priceStr =kStringFormat(@"待入库%li件，实际入库%li件",count,count);
    NSString *countStr = kStringFormat(@"%li",count);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
  
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(9+countStr.length, countStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(3, countStr.length)];

    self.priceLabel.attributedText = attriStr;

}
-(void)makeSureBtnClicked{
    NSMutableArray *listArr = [NSMutableArray arrayWithCapacity:0];
    
    for (IOSCaiGouListModel *godsM in self.self.allDataArr) {
        for (IOSCaiGouListModel *editM in self.editArr) {
            if ([editM.godsId isEqualToString:godsM.godsId]) {
                godsM.price = editM.price;
            }
        }
        CGFloat floatValue = [godsM.price floatValue];
        CGFloat floatValue1 = round(floatValue*100)/100;
        NSDictionary *dic = @{@"goodsName":godsM.goodsName,
                              @"goodsId":godsM.goodsId,
                              @"img":godsM.img,
                              @"inStockNum":@(godsM.inNum),
                              @"price":@(floatValue1),
                              @"isRecycle":@(godsM.isRecycle)
        };

        [listArr addObject:dic];
    }
    NSString *listStr = [self zhuzuZhuangjson:listArr];
    
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdPurch/inStock"];

    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"purchUserId":self.headerDic[@"purchUserId"],
                               @"purchUserName":self.headerDic[@"purchUserName"],
                               @"purchTime":self.headerDic[@"purchTime"],
                               @"purchId":self.headerDic[@"purchId"],
                               @"list":listStr
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSString *titleStr = @"入库成功";
            NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
            [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(18),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, titleStr.length)];
            IOSMessageAlertView *alertView = [[IOSMessageAlertView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight) type:IOSMesAlertTypeMessage titleStr:attriStr cancleBtnName:@"" sureBtnName:@"好的，我知道了" DetailBtnName:@"可在采购历史-已完成中查看"];
            alertView.makeSureBtnClick = ^{
                [self.navigationController popViewControllerAnimated:YES];
            };
            [alertView show];
        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 133;
    }
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        IOSCaiGouHeaderTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSCaiGouHeaderTBCell"];
        [cell setcaigoudanHeadView:self.headerDic];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    IOSGodsDetailTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsDetailTBCell"];
    IOSCaiGouListModel *caigouModel = self.dataSource[indexPath.row];
    for (IOSCaiGouListModel *editM in self.editArr) {
        if ([editM.godsId isEqualToString:caigouModel.godsId]) {
            caigouModel.price = editM.price;
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.editPriceBtnClicked = ^{
        [self editPriceWithModel:caigouModel];
    };
    cell.caigouDetailGodsM = caigouModel;
    return cell;
}
-(void)editPriceWithModel:(IOSCaiGouListModel *)listModel{
    NSString *titleStr = kStringFormat(@"将￥%.2f改为",[listModel.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(18),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, titleStr.length)];
    [attriStr addAttributes: @{NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(titleStr.length-2, 2)];
    IOSMessageAlertView *alertView = [[IOSMessageAlertView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight) type:IOSMesAlertTypeTF titleStr:attriStr cancleBtnName:@"取消" sureBtnName:@"确认" DetailBtnName:@"请输入价格"];
    kWeakSelf(self)
    alertView.TFSureBtnClick = ^(NSString * _Nonnull str) {
        [weakself editPriceWithModel1:listModel andStr:str];
        };
    [alertView show];

    
}
-(void)editPriceWithModel1:(IOSCaiGouListModel *)listModel andStr:(NSString *)str{
    BOOL hascontent = NO;
    for (IOSCaiGouListModel *model in self.editArr) {
        if ([model.godsId isEqualToString:listModel.godsId]) {
            model.price = str;
            hascontent = YES;
        }
    }
    if (!hascontent) {
        listModel.price = str;
        [self.editArr addObject:listModel];
    }
    [self.tabelView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
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
        [but setBackgroundImage:[UIImage imageWithColor:RGBA(250, 250, 250, 1) size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
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
    [self getListDatawithType:1];
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
@end
