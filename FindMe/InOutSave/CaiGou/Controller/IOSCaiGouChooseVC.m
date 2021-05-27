//
//  IOSCaiGouChooseVC.m
//  BatDog
//
//  Created by mac on 2021/5/18.
//  Copyright © 2021 郑州聚义. All rights reserved.
//

#import "IOSCaiGouChooseVC.h"
#import "UIView+Frame.h"
#import "IOSCaiGouChoTBCell.h"
#import "IOSCaiGouChooM.h"
#import "BRPickerView.h"
#import "BRDatePickerView.h"
#import "IOSChooseGoodsViewController.h"
#import "IOSGodsDetailTBCell.h"
#import "IOSGodsHistoryListVC.h"
#import "IOSCaiGouListModel.h"
@interface IOSCaiGouChooseVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSArray *NameArr;
@property (nonatomic,strong) NSArray *holderArr;
@property (nonatomic,strong) NSMutableArray *choosedArr; //选择商品的数组

@property (nonatomic,strong) NSString *caigouyuanID; //采购员ID
@property (nonatomic,strong) NSString *caigouyuanName; //采购员姓名

@property (nonatomic,strong) NSMutableArray *headerButArr;
@property (nonatomic,strong) UIView *cellHeaderView;
@property (nonatomic,assign) NSInteger seletedIndex; //选中的buttonindex

@property (nonatomic,strong) UILabel *priceLabel;

@end

@implementation IOSCaiGouChooseVC
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(NSMutableArray *)choosedArr{
    if (!_choosedArr) {
        _choosedArr = [NSMutableArray array];
    }
    return _choosedArr;
}
//-(NSArray *)NameArr{
//    if (!_NameArr) {
//        _NameArr = [NSArray array];
//    }
//    return _NameArr;
//}
//-(NSArray *)holderArr{
//    if (!_holderArr) {
//        _holderArr = [NSArray array];
//    }
//    return _holderArr;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.seletedIndex = 0;
    [self setNavbutton];
    [self initialData];

    [self CreatMainUI];
}
-(void)initialData{
    self.NameArr =@[@"采购人",@"采购时间",@"采购商品"];
    self.holderArr = @[@"请选择采购人员",@"请选择采购时间",@"请选择采购商品"];
    for (int i=0; i<self.NameArr.count; i++) {
        IOSCaiGouChooM *chooseM = [[IOSCaiGouChooM alloc] init];
        chooseM.name = self.NameArr[i];
        chooseM.holderStr = self.holderArr[i];
        
        [self.dataArr addObject:chooseM];
        
    }
    
}
//主视图
-(void)CreatMainUI{
    
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self creatBottomView];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSCaiGouChoTBCell" bundle:nil] forCellReuseIdentifier:@"IOSCaiGouChoTBCell"];
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
    self.priceLabel = priceLabel;
    [bottomView addSubview:priceLabel];
    NSString *priceStr =@"共0件商品,合计0.00元";
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(8, 4)];
    self.priceLabel.attributedText = attriStr;
}
#pragma mark ---delegate----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.choosedArr.count>0) {
        return 2;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return self.NameArr.count;
    }
    return [self manageChooseDate].count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return 110;
    }
    return 130;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        IOSCaiGouChoTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSCaiGouChoTBCell"];
        IOSCaiGouChooM *caigouModel = self.dataArr[indexPath.row];
        cell.CaigouChooseModel = caigouModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.inputTF.userInteractionEnabled = NO;

        return cell;
        
    }
    IOSGodsDetailTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsDetailTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSCaiGouListModel *caigouModel = [self manageChooseDate][indexPath.row];
    cell.caigouListGodsM = caigouModel;
    cell.godsListType = 3;
    kWeakSelf(self)
    kWeakSelf(cell)
    cell.unAddBtnClicked = ^{
        [weakself unaddBtnClicked:caigouModel indexPath:indexPath cell:weakcell];
    };
    cell.AddBtnClicked = ^{
        [weakself addBtnClicked:caigouModel indexPath:indexPath cell:weakcell];
    };
    
    return cell;
}
//减按钮点击
-(void)unaddBtnClicked:(IOSCaiGouListModel *)caigouM indexPath:(NSIndexPath*)indexPath cell:(IOSGodsDetailTBCell *)cell{
    if (caigouM.selectCount==1) {
        return;
    }
    caigouM.selectCount--;

    [self.tabelView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self ChargePrice];
}
//加按钮点击
-(void)addBtnClicked:(IOSCaiGouListModel *)caigouM indexPath:(NSIndexPath*)indexPath cell:(IOSGodsDetailTBCell *)cell{

    caigouM.selectCount++;

    [self.tabelView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self ChargePrice];
}
-(void)ChargePrice{
    NSInteger count =0;
    CGFloat Price = 0.00;
    for (IOSCaiGouListModel *caigouModel in self.choosedArr) {
        count+=caigouModel.selectCount;
        Price+=[caigouModel.price floatValue]*caigouModel.selectCount;
    }
    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",count,Price);
    NSString *countStr = kStringFormat(@"%li",count);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+countStr.length, 6)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-4, 3)];
    self.priceLabel.attributedText = attriStr;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1) {
        return;
    }
    switch (indexPath.row) {
        case 0: {
            [self postallBumeninfoDataFromSever];
        }
            break;

        case 1:{
            [self selelctBRPickView];
        }
            break;

        case 2:{
            [self chooseGodsAction];
        }
            
            break;
            
        default:
            break;
    }
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"采购" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"IOSDengDai"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(goCaigouHistory) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //第二组可以左滑删除
    if (indexPath.section == 1) {
        return YES;
    }
    
    return NO;
}
 
// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
//iOS 11.0之后改变滑动删除按钮样式
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)){
    //删除
    if (@available(iOS 11.0, *)) {
        UIContextualAction *delete = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
            //[self.arr removeObjectAtIndex:indexPath.row];
            completionHandler (YES);
            [self deleteRowIndexPath:indexPath];
            //[self.mainTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
        
        delete.backgroundColor = [UIColor whiteColor];
        delete.image = ImageNamed(@"IOSDelete");

        UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[delete]];
        //performsFirstActionWithFullSwipe 禁止左滑完全滑动事件，只能点击触发
        config.performsFirstActionWithFullSwipe = NO;
        return config;
    } else {
        

        return nil;
        // Fallback on earlier versions
        
    }
}
-(void)deleteRowIndexPath:(NSIndexPath *)indexPath{
    NSString *titleStr = @"确定删除吗？";
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:18],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, titleStr.length)];
    IOSMessageAlertView *alertView = [[IOSMessageAlertView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight) type:IOSMesAlertTypeChoose titleStr:attriStr cancleBtnName:@"确认" sureBtnName:@"取消" DetailBtnName:@""];
    kWeakSelf(self)
    alertView.makeSureBtnClick = ^{
        IOSCaiGouListModel *caigouModel = [weakself manageChooseDate][indexPath.row];
        [weakself.choosedArr removeObject:caigouModel];
        [weakself ChargePrice];
        [weakself.tabelView reloadData];
    };
    [alertView show];
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if (indexPath.section == 1) {
            
           
            
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 44;
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
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
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
    self.seletedIndex = button.tag-521;
    [self.tabelView reloadData];
}
-(NSArray *)manageChooseDate{
    if (self.seletedIndex==0) {
        return self.choosedArr;
    }
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
        for (IOSCaiGouListModel *listModel in self.choosedArr) {
            if (listModel.isRecycle!=self.seletedIndex) {
                [mutArr addObject:listModel];
            }
        }
        return mutArr;
    
}
#pragma mark ---点击事件----
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
//选择商品
-(void)chooseGodsAction{
    IOSChooseGoodsViewController *pushVC = [[IOSChooseGoodsViewController alloc] init];
    pushVC.chooseGodsBlock = ^(NSArray * _Nonnull godsArr) {
        self.choosedArr = [NSMutableArray arrayWithArray:godsArr];
        [self.tabelView reloadData];
        [self ChargePrice];
    };
    [self.navigationController pushViewController:pushVC animated:YES];
}
//请求所有的部门信息
- (void)postallBumeninfoDataFromSever {
//    [self showHudInView:self.view hint:@"加载数据"];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    IOSCaiGouChooM *caigouModel = self.dataArr[0];
    caigouModel.ChooseStr = @"一一";
    self.caigouyuanName = @"一一";
    self.caigouyuanID = @"390";
    [self.dataArr replaceObjectAtIndex:indexPath.row withObject:caigouModel];
    [self.tabelView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: User_Companyid,@"companyId",@"0",@"parentId",KUser_ComType,@"type",nil];
//    NSString *url = [NSString stringWithFormat:@"%@/d/api/department/list",AppServerURL];
//    NSMutableArray *bumenarr = [NSMutableArray array];
//    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:params sucess:^(id responseObject) {
//
//        MyLog(@"%@", responseObject);
//        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
//
//
//
//
//        } else {
//            [self showHint:responseObject[@"msg"]];
//
//        }
//        [self hideHud];
//
//    } failure:^(NSError *error) {
//        [self showHint:@"稍后重试"];
//        [self hideHud];
//    }];
    
}
-(void)selelctBRPickView{
    // 1.创建日期选择器
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDateAndTime defaultSelValue:nil minDateStr:nil maxDateStr:nil isAutoSelect:YES resultBlock:^(NSString *selectValue) {
            
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:0];
        IOSCaiGouChooM *caigouModel = self.dataArr[1];
        caigouModel.ChooseStr = selectValue;
            [self.dataArr replaceObjectAtIndex:indexPath.row withObject:caigouModel];
            [self.tabelView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }];
}
//采购历史
-(void)goCaigouHistory{
    IOSGodsHistoryListVC *pushVC = [[IOSGodsHistoryListVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
-(void)makeSureBtnClicked{

    IOSCaiGouChooM *caigouModel = self.dataArr[0];
    IOSCaiGouChooM *caigouModel1 = self.dataArr[1];
    if (caigouModel.ChooseStr.length==0) {
        [self showHint:@"请选择采购人员"];
        return;
    }
    if (caigouModel1.ChooseStr.length==0) {
        [self showHint:@"请选择采购日期"];
        return;
    }
    if (self.choosedArr.count==0) {
        [self showHint:@"请选择采购商品"];
        return;
    }

    NSMutableArray *listArr = [NSMutableArray arrayWithCapacity:0];
    
    for (IOSCaiGouListModel *godsM in self.choosedArr) {
        CGFloat floatValue = [godsM.price floatValue];
        CGFloat floatValue1 = round(floatValue*100)/100;
        NSDictionary *dic = @{@"goodsName":godsM.goodsName,
                              @"goodsId":godsM.godsId,
                              @"img":godsM.img,
                              @"num":@(godsM.selectCount),
                              @"price":@(floatValue1),
                              @"isRecycle":@(godsM.isRecycle)
        };

        [listArr addObject:dic];
    }
    NSString *listStr = [self zhuzuZhuangjson:listArr];
    
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdPurch/addPurch"];

    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"purchUserId":self.caigouyuanID,
                               @"purchUserName":self.caigouyuanName,
                               @"purchTime":caigouModel1.ChooseStr,
                               @"list":listStr
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            [self showHint:@"新增采购成功"];
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
