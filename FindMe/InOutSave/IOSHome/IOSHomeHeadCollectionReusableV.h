//
//  IOSHomeHeadCollectionReusableV.h
//  BatDog
//
//  Created by mac on 2021/5/18.
//  Copyright © 2021 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TittleDetailModel;

@interface IOSHomeHeadCollectionReusableV : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *name;
-(void)showData:(TittleDetailModel *)model;



@end

NS_ASSUME_NONNULL_END
