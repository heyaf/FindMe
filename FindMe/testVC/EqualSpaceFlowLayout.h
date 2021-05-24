//
//  EqualSpaceFlowLayout.h
//  UICollectionViewDemo
//
//  Created by CHC on 15/5/12.
//  Copyright (c) 2015年 CHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EqualSpaceFlowLayout;
@protocol  EqualSpaceFlowLayoutDelegate<UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(EqualSpaceFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface EqualSpaceFlowLayout : UICollectionViewFlowLayout
@property (nonatomic,weak) id<EqualSpaceFlowLayoutDelegate> delegate;
@property (nonatomic,assign) NSInteger curesection;



@end
