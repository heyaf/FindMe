//
//  WoYaoJuanZengHeaderCollectionReusableView.h
//  XunBaoWang
//
//  Created by 展鹤 on 2018/8/27.
//  Copyright © 2018年 juyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TittleDetailModel;
@interface EntersHomeHeaderCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UIImageView *photo;
-(void)showData:(TittleDetailModel *)model;



@end
