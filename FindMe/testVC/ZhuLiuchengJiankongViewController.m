//
//  JiGouMoreViewController.m
//  LedRoad
//
//  Created by 郑州聚义 on 16/8/10.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "ZhuLiuchengJiankongViewController.h"
#import "PhotoTitleCollectionViewCell.h"
#import "TittleDetailModel.h"
#import "EqualSpaceFlowLayout.h"
#import "QuxianLabelCollectionViewCell.h"
//#import "NSString+Extension.h"

@interface ZhuLiuchengJiankongViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,EqualSpaceFlowLayoutDelegate> {

}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,assign)NSInteger findStart;
@property (nonatomic, strong) EqualSpaceFlowLayout *flowLayout;
//权限
@property (nonatomic, strong) NSMutableArray *dataSource;
//特长
@property (nonatomic, strong) NSMutableArray *techangArr;

@property (nonatomic, strong) NSMutableArray *techangArr2;

@end

@implementation ZhuLiuchengJiankongViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试";
    self.view.backgroundColor = RGBA(245, 245, 245, 1);
    self.flowLayout = [[EqualSpaceFlowLayout alloc] init];

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, KDeviceWith, KDeviceHeight-200) collectionViewLayout:self.flowLayout];
    self.flowLayout.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.bounces = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView registerClass:[QuxianLabelCollectionViewCell class] forCellWithReuseIdentifier:@"QuxianLabelCollectionViewCell"];
    [self.view addSubview:self.collectionView];
    
    
    [self postDataSever];
}

//请求列表
- (void)postDataSever {
    self.dataSource = [NSMutableArray array];
    self.techangArr = [NSMutableArray array];

    self.techangArr2 = [NSMutableArray array];
    NSArray *roleList = @[@"审核合同",@"分配项目经理",@"分配设计师",@"添加公司员工",@"审核出账",@"请假审批",@"打卡审批",@"录入客户"];

    for (NSString *name in roleList) {
        TittleDetailModel *itemData = [TittleDetailModel new];
        itemData.tittle = name;
        itemData.size = [itemData.tittle sizeWithFont:[UIFont systemFontOfSize:8.0]];
        [self.dataSource addObject:itemData];
        [self.techangArr2 addObject:itemData];

    }
    
    NSArray *pskillListarr = @[@"篮球",@"美术",@"音乐",@"抬杠"];
    for (NSString *name in pskillListarr) {
        TittleDetailModel *itemData = [TittleDetailModel new];
        itemData.tittle = name;
        itemData.size = [itemData.tittle sizeWithFont:[UIFont systemFontOfSize:8.0]];
        [self.techangArr addObject:itemData];
        [self.techangArr2 addObject:itemData];

    }
    
}



#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

//元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return self.dataSource.count;
    }
    if (section==1) {
        return self.techangArr.count;
    }
    return 0;
}

//数据分配
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        QuxianLabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QuxianLabelCollectionViewCell" forIndexPath:indexPath];
        
        TittleDetailModel *itemData = self.dataSource[indexPath.row];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",itemData.tittle];
        cell.backgroundColor = RGBA(255, 245, 230,1);
        cell.titleLabel.textColor = RGBA(240, 211, 120,1);
        return cell;
    }
   
    QuxianLabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QuxianLabelCollectionViewCell" forIndexPath:indexPath];
    TittleDetailModel *itemData = self.techangArr[indexPath.row];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",itemData.tittle];
    cell.backgroundColor = RGBA(245, 245, 245,1);
    cell.titleLabel.textColor = RGBA(135, 135, 135,1);
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0) {
        TittleDetailModel *itemData = self.dataSource[indexPath.row];
        return CGSizeMake(itemData.size.width+30, 25);
    }
    TittleDetailModel *itemData = self.techangArr2[indexPath.row];
    return CGSizeMake(itemData.size.width+30, 25);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
