//
//  MyBaseShowCollectionViewController.h
//  BatDog
//
//  Created by 郑州聚义 on 2019/3/6.
//  Copyright © 2019 郑州聚义. All rights reserved.
//

#import "MyBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBaseShowCollectionViewController : MyBaseViewController
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *FlowLayout;


@end

NS_ASSUME_NONNULL_END
