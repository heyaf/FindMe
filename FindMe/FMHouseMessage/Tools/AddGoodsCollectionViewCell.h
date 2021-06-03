//
//  AddGoodsCollectionViewCell.h
//
//  Created by tt on 2019/5/16.
//  Copyright © 2019 ZhenShang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddGoodsCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong) UIImageView *goodsImgView;

@property(nonatomic,strong) UIButton *deleteBtn;
@property(nonatomic,strong) UIImageView *bofangimg;

@property(nonatomic,assign) NSInteger index;

@property (nonatomic, copy) void(^deleimgblock)(AddGoodsCollectionViewCell *);

@end

NS_ASSUME_NONNULL_END
