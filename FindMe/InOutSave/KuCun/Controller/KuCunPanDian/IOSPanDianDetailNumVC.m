//
//  IOSPanDianDetailNumVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSPanDianDetailNumVC.h"
#import "IOSGodsDetailTBCell.h"
#import "IOSPanDianChoDetailVC.h"
#import "IOSCaiGouListModel.h"
#import "IOSPanDianVC.h"
@interface IOSPanDianDetailNumVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *headerButArr;
@property (nonatomic,strong) UIView *cellHeaderView;
@property (nonatomic,assign) NSInteger seletedIndex; //选中的buttonindex
@property (nonatomic,strong) UILabel *priceLabel;

@end

@implementation IOSPanDianDetailNumVC

//设置导航栏
-(void)setNavbutton{
    self.navigationItem.title = @"盘点数量";
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"IOSGuanbi"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 35,35);

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatMainUI];
    [self creatBottomView];
    [self setNavbutton];
//    [self popParentVC];

}
//主视图
-(void)CreatMainUI{
    

    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSGodsDetailTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsDetailTBCell"];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self manageChooseDate].count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
    [self reloadBottomView];
}
//加按钮点击
-(void)addBtnClicked:(IOSCaiGouListModel *)caigouM indexPath:(NSIndexPath*)indexPath cell:(IOSGodsDetailTBCell *)cell{

    caigouM.selectCount++;

    [self.tabelView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self reloadBottomView];
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
-(void)reloadBottomView{
    NSMutableArray *dateArr = [NSMutableArray arrayWithCapacity:0];
    NSInteger count =0;
    for (IOSCaiGouListModel *caigouModel in self.choosedArr) {
        if (caigouModel.isSelected) {
            [dateArr addObject:caigouModel];
            count+=caigouModel.selectCount;
        }
    }
    NSString *textStr = kStringFormat(@"本单合计 %li 件商品",count);
    NSString *countStr = kStringFormat(@"%li",count);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:textStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(6, countStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, textStr.length)];
   
    self.priceLabel.attributedText = attriStr;
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:bottomView];

    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-30-120, 10, 120, 50)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, 120, 50);
    [makeSureBtn setTitle:@"保存" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];


    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, KDeviceWith-120-30-30, 20)];
    NSString *textStr = kStringFormat(@"本单合计 0 件商品");
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:textStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(5, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, textStr.length)];
    priceLabel.attributedText = attriStr;
    self.priceLabel = priceLabel;
    [bottomView addSubview:priceLabel];
    [self reloadBottomView];


}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pandiansearch{

}
-(void)makeSureBtnClicked{

    NSMutableArray *listArr = [NSMutableArray arrayWithCapacity:0];
    
    for (IOSCaiGouListModel *godsM in self.choosedArr) {
        CGFloat floatValue = [godsM.price floatValue];
        CGFloat floatValue1 = round(floatValue*100)/100;
        NSDictionary *dic = @{@"goodsName":godsM.goodsName,
                              @"goodsId":godsM.godsId,
                              @"img":godsM.img,
                              @"checkNum":@(godsM.selectCount),
                              @"stockNum":@(godsM.stockNum),
                              @"price":@(floatValue1),
                              @"isRecycle":@(godsM.isRecycle)
        };

        [listArr addObject:dic];
    }
    NSString *listStr = [self zhuzuZhuangjson:listArr];
    
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCheck/saveCheck"];

    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"list":listStr
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            [self showHint:@"保存盘点成功"];
            [self poptoViewController];
//            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
-(void)poptoViewController{
    for (UIViewController *temp in self.navigationController.viewControllers) {
               if ([temp isKindOfClass:[IOSPanDianVC class]]) {
                  [self.navigationController popToViewController:temp animated:YES];
               }
    }
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
