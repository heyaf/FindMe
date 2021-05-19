//
//  AddGoodsCollectionViewCell.m
//  PhoneStock
//
//  Created by 展鹤 on 2019/5/16.
//  Copyright © 2019 ZhenShang. All rights reserved.
//

#import "AddPhotoCollectionViewCell.h"

@implementation AddPhotoCollectionViewCell


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
    
}

-(void)deleteGoodsAction{
    if (_deleimgblock) {
        _deleimgblock(self);
    }
    
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
        
        [_deleteBtn setImage:[UIImage imageNamed:@"关闭icon"] forState:(UIControlStateNormal)];
        [_deleteBtn addTarget:self action:@selector(deleteGoodsAction) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_deleteBtn];
    }
    return _deleteBtn;
}


@end
