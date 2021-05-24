//
//  CustomCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by CHC on 15/5/12.
//  Copyright (c) 2015年 CHC. All rights reserved.
//

#import "QuxianLabelCollectionViewCell.h"

@interface QuxianLabelCollectionViewCell()
@end

@implementation QuxianLabelCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        self.titleLabel.textColor = RGBA(135, 135, 135, 1);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
//        self.titleBtn = [[UIButton alloc] initWithFrame:self.bounds];
//        self.titleBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//        [self.titleBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//        [self.titleBtn setBackgroundImage:[UIImage imageNamed:@"common_textfield_orange_bg"] forState:UIControlStateNormal];
//        [self.titleBtn setBackgroundImage:[UIImage imageNamed:@"common_btn_bg"] forState:UIControlStateSelected];
//        [self.titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//        [self.contentView addSubview:self.titleBtn];
    }
    return self;
}


//- (void)setSelectStatus{
//    self.backgroundColor = RGBA(235, 96, 59, 1);
//    self.titleLabel.textColor = [UIColor whiteColor];
//}


@end
