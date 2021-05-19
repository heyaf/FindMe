//
//  AddGoodsCollectionViewCell.h
//  PhoneStock
//
//  Created by 展鹤 on 2019/5/16.
//  Copyright © 2019 ZhenShang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddPhotoCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong) UIImageView *goodsImgView;

@property(nonatomic,strong) UIButton *deleteBtn;

@property(nonatomic,assign) NSInteger index;

@property (nonatomic, copy) void(^deleimgblock)(AddPhotoCollectionViewCell *);

@end

NS_ASSUME_NONNULL_END
