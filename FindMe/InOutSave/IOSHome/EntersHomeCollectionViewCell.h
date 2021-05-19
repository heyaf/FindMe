//
//  EntersHomeCollectionViewCell.h
//  BatDog
//
//  Created by 郑州聚义 on 2019/3/21.
//  Copyright © 2019 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TittleDetailModel;
@interface EntersHomeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoview;
@property (weak, nonatomic) IBOutlet UILabel *name;


-(void)showData:(TittleDetailModel *)model;

@end

NS_ASSUME_NONNULL_END
