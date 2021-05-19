//
//  WoYaoJuanZengHeaderCollectionReusableView.m
//  XunBaoWang
//
//  Created by 展鹤 on 2018/8/27.
//  Copyright © 2018年 juyi. All rights reserved.
//

#import "EntersHomeHeaderCollectionReusableView.h"
#import "TittleDetailModel.h"
@implementation EntersHomeHeaderCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
  

}

-(void)showData:(TittleDetailModel *)model {
    self.name.text = [NSString stringWithFormat:@"%@", model.tittle];
    self.photo.image = [UIImage imageNamed:model.detail];
}


@end
