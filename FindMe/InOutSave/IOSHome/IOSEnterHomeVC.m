//
//  IOSEnterHomeVC.m
//  BatDog
//
//  Created by mac on 2021/5/18.
//  Copyright © 2021 郑州聚义. All rights reserved.
//

#import "TittleDetailModel.h"
#import "IOSEnterHomeVC.h"
#import "EntersHomeCollectionViewCell.h"
#import "EntersHomeHeaderCollectionReusableView.h"
#import "IOSHomeHeadCollectionReusableV.h"
#import "IOSCaiGouChooseVC.h"
#import "IOSGodsHistoryListVC.h"

//库存
#import "IOSInStoreHisVC.h"
#import "IOSOutStoreHisVC.h"
#import "IOSPanDianVC.h"
#import "IOSPanDianHisVC.h"

//物资
#import "IOSLingYongListVC.h"
#import "IOSHuiShouListVC.h"


@interface IOSEnterHomeVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSource;//区头
@property (nonatomic, strong) NSMutableArray *caigouArr;//采购1
@property (nonatomic, strong) NSMutableArray *kucunArr; //库存2
@property (nonatomic, strong) NSMutableArray *wuziArr;//物资3
@property (nonatomic, strong) NSMutableArray *tongjiArr;//统计4
@property (nonatomic, strong) NSMutableArray *OtherArr; //其他5

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *FlowLayout;



@end

@implementation IOSEnterHomeVC

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        self.dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)caigouArr {
    if (_caigouArr == nil) {
        self.caigouArr = [NSMutableArray array];
    }
    return _caigouArr;
}
- (NSMutableArray *)kucunArr {
    if (_kucunArr == nil) {
        self.kucunArr = [NSMutableArray array];
    }
    return _kucunArr;
}
- (NSMutableArray *)wuziArr {
    if (_wuziArr == nil) {
        self.wuziArr = [NSMutableArray array];
    }
    return _wuziArr;
}
- (NSMutableArray *)OtherArr {
    if (_OtherArr == nil) {
        self.OtherArr = [NSMutableArray array];
    }
    return _OtherArr;
}
- (NSMutableArray *)tongjiArr {
    if (_tongjiArr == nil) {
        self.tongjiArr = [NSMutableArray array];
    }
    return _tongjiArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setBackTitle:@"进销存"];
    [self setbackbutton];
    NSArray *tittlearr = @[@"采购", @"库存",@"物资",@"统计", @"其他", ];
    NSArray *imgarr = @[@"caigou",@"xiaoshou", @"kucun",@"tongji", @"caiwu"];
    
    for (int i=0; i<tittlearr.count; i++) {
        TittleDetailModel *model = [TittleDetailModel new];
        model.tittle = tittlearr[i];
        model.detail = imgarr[i];
        [self.dataSource addObject:model];
    }
    //采购
    NSArray *tittlearr0 = @[@"采购单", @"采购历史"];
    NSArray *imgarr0 = @[@"caigoudan",@"caigoulishi"];
    for (int i=0; i<tittlearr0.count; i++) {
        TittleDetailModel *model = [TittleDetailModel new];
        model.tittle = tittlearr0[i];
        model.detail = imgarr0[i];
        [self.caigouArr addObject:model];
    }
    //库存
    NSArray *tittlearr2 = @[@"入库历史",@"出库历史",@"盘点单", @"盘点历史",  ];
    NSArray *imgarr2 = @[@"kucunliushui",@"kucunrukulishi",@"kucunpandiandan",@"kucunpandianlishi",  @"kucunchukulishi", ];
    for (int i=0; i<tittlearr2.count; i++) {
        TittleDetailModel *model = [TittleDetailModel new];
        model.tittle = tittlearr2[i];
        model.detail = imgarr2[i];
        [self.kucunArr addObject:model];
    }
    
    //物资
    NSArray *tittlearr1 = @[@"物资领用", @"办公物资回收",@"物资损耗单"];
    NSArray *imgarr1 = @[@"xiaoshoudan",@"xiaoshoulishi", @"xiaoshoutuihuo"];
    for (int i=0; i<tittlearr1.count; i++) {
        TittleDetailModel *model = [TittleDetailModel new];
        model.tittle = tittlearr1[i];
        model.detail = imgarr1[i];
        [self.wuziArr addObject:model];
    }

    //统计
    NSArray *tittlearr4 = @[@"采购明细", @"入库明细",@"出库明细", @"盈亏明细",];
    NSArray *imgarr4 = @[@"tongjibaobiao",@"tongjicaigoubaobiao", @"tongjijiangying", @"tongjitubiao"];
    for (int i=0; i<tittlearr4.count; i++) {
        TittleDetailModel *model = [TittleDetailModel new];
        model.tittle = tittlearr4[i];
        model.detail = imgarr4[i];
        [self.tongjiArr addObject:model];
    }
    
    //其他
    NSArray *tittlearr3 = @[@"商品管理"];
    NSArray *imgarr3 = @[@"caiwukehuduizhang"];
    for (int i=0; i<tittlearr3.count; i++) {
        TittleDetailModel *model = [TittleDetailModel new];
        model.tittle = tittlearr3[i];
        model.detail = imgarr3[i];
        [self.OtherArr addObject:model];
    }
    

    
    self.FlowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight-KEVNScreenTabBarSafeBottomMargin) collectionViewLayout:self.FlowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.alwaysBounceVertical = YES;
    self.FlowLayout.itemSize = CGSizeMake((KDeviceWith -35)/4, 100);
    self.FlowLayout.minimumInteritemSpacing = 5;
    self.FlowLayout.minimumLineSpacing = 5;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:@"EntersHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"EntersHomeCollectionViewCell"];
    //注册表头
    [self.collectionView registerNib:[UINib nibWithNibName:@"IOSHomeHeadCollectionReusableV" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"IOSHomeHeadCollectionReusableV"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionFootReusableView"];
    self.collectionView.autoresizingMask = NO;
    self.collectionView.allowsMultipleSelection = YES;
    [self.view addSubview:self.collectionView];
}
-(void)setbackbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"进销存" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - collectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataSource.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    switch (section) {
        case 0: {
            return self.caigouArr.count;
        }
            break;
        case 1: {
            return self.kucunArr.count;
        }
            break;
        
        case 2: {
            return self.wuziArr.count;
        }
            break;
        case 4: {
            return self.OtherArr.count;
        }
            break;
        case 3: {
            return self.tongjiArr.count;
        }
            break;
        default:
            break;
    }
    return 0;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EntersHomeCollectionViewCell *mCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EntersHomeCollectionViewCell" forIndexPath:indexPath];
    TittleDetailModel *model;
    switch (indexPath.section) {
        case 0: {
            model = self.caigouArr[indexPath.row];
        }
            break;
        case 1: {
            model = self.kucunArr[indexPath.row];
        }
            break;
        case 2: {
            model = self.wuziArr[indexPath.row];
        }
            break;
        case 3: {
            model = self.tongjiArr[indexPath.row];
        }
            break;
        case 4: {
            model = self.OtherArr[indexPath.row];
        }
            break;
        default:
            break;
    }
    [mCell showData:model];
    return mCell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        IOSHomeHeadCollectionReusableV *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"IOSHomeHeadCollectionReusableV" forIndexPath:indexPath];
    
        TittleDetailModel *model = self.dataSource[indexPath.section];
        [header showData:model];
        return  header;
        
    }else if(kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionFootReusableView" forIndexPath:indexPath];
        return  footer;
    }else{
        return nil;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(KDeviceWith, 10);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(KDeviceWith, 60);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //采购
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0: {
                [self caigou];
            }
                break;
            case 1: {//采购历史
                IOSGodsHistoryListVC *pushVC = [[IOSGodsHistoryListVC alloc] init];
                [self.navigationController pushViewController:pushVC animated:YES];
            }
                break;
                
            case 2: {//采购退货单
                
            }
                break;
            case 3: {
            }
                break;
            default:
                break;
        }
        return;
    }
    //库存
    if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0: { //入库历史
                IOSInStoreHisVC *pushVC = [[IOSInStoreHisVC alloc] init];
                [self.navigationController pushViewController:pushVC animated:YES];
            }
                break;
            case 1: {//出库历史
                IOSOutStoreHisVC *pushVC = [[IOSOutStoreHisVC alloc] init];
                [self.navigationController pushViewController:pushVC animated:YES];
            }
                break;
                
            case 2: {//盘点单
                IOSPanDianVC *pushVC = [[IOSPanDianVC alloc] init];
                [self.navigationController pushViewController:pushVC animated:YES];
            }
                break;
            case 3: {//盘点历史
                IOSPanDianHisVC *pushVC = [[IOSPanDianHisVC alloc] init];
                [self.navigationController pushViewController:pushVC animated:YES];
            }
                break;
            default:
                break;
        }
        return;
    }
    
    //物资
    if (indexPath.section==2) {
        switch (indexPath.row) {
            case 0: { //物资领用

                IOSLingYongListVC *pushVC = [[IOSLingYongListVC alloc] init];
                [self.navigationController pushViewController:pushVC animated:YES];
            }
                break;
            case 1: {//办公物资回收
                IOSHuiShouListVC *pushVC = [[IOSHuiShouListVC alloc] init];
                [self.navigationController pushViewController:pushVC animated:YES];
            }
                break;
                
            case 2: {//物资损耗单
                
            }
                break;
            
            default:
                break;
        }
        return;
    }
    
    //统计
    if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0: { //采购明细
           
            }
                break;
            case 1: {//入库明细
               
            }
                break;
                
            case 2: {//出库明细
                
            }
                break;
            case 3: {//盈亏明细
            }
                break;
            default:
                break;
        }
        return;
    }
    //其他
    if (indexPath.section==3) {
        switch (indexPath.row) {
            case 0: { //商品管理
           
            }
                break;
            
            default:
                break;
        }
        return;
    }
}
//跳转采购人员VC
-(void)caigou{
    IOSCaiGouChooseVC *pushVC = [[IOSCaiGouChooseVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
@end
