//
//  MyBaseShowCollectionViewController.m
//  BatDog
//
//  Created by 郑州聚义 on 2019/3/6.
//  Copyright © 2019 郑州聚义. All rights reserved.
//

#import "MyBaseShowCollectionViewController.h"

@interface MyBaseShowCollectionViewController ()

@end

@implementation MyBaseShowCollectionViewController

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        self.dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.FlowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight-KEVNScreenTabBarSafeBottomMargin) collectionViewLayout:self.FlowLayout];
    self.collectionView.backgroundColor = RGBA(245, 245, 245, 1);
    
    self.collectionView.alwaysBounceVertical = YES;

    [self.view addSubview:self.collectionView];
 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
