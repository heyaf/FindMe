//
//  AddGoodsCollectionViewCell.m
//  PhoneStock
//
//  Created by tt on 2019/5/16.
//  Copyright © 2019 ZhenShang. All rights reserved.
//

#import "AddGoodsCollectionViewCell.h"

@implementation AddGoodsCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

-(void)initSubView{    
    [self.goodsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);
    }];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.bofangimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
}

-(void)deleteGoodsAction{
    if (_deleimgblock) {
        _deleimgblock(self);
    }
    
}
- (UIImageView *)bofangimg{
    if (!_bofangimg) {
        _bofangimg = [[UIImageView alloc]init];
        _bofangimg.image = [UIImage imageNamed:@"quanzi_bofang"];
        _bofangimg.contentMode = UIViewContentModeScaleToFill;
        _bofangimg.hidden = YES;
        [self.contentView addSubview:_bofangimg];
    }
    return _bofangimg;
}

- (UIImageView *)goodsImgView{
    if (!_goodsImgView) {
        _goodsImgView = [[UIImageView alloc]init];
        _goodsImgView.layer.masksToBounds = YES;
        _goodsImgView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_goodsImgView];
    }
    return _goodsImgView;
}

-(UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [_deleteBtn setImage:[UIImage imageNamed:@"guanbiIcon"] forState:(UIControlStateNormal)];
        [_deleteBtn addTarget:self action:@selector(deleteGoodsAction) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_deleteBtn];
    }
    return _deleteBtn;
}


@end
