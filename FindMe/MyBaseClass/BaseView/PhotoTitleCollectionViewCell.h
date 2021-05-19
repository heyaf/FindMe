//
//  HotProductCollectionViewCell.h
//  GeneralShop
//
//  Created by 郑州聚义 on 17/2/16.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TittleDetailModel;
@interface PhotoTitleCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


- (void)showData:( TittleDetailModel *)model;

@end
