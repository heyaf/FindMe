//
//  IOSPandianHisDetailTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import "IOSPandianHisDetailTBCell.h"
#import "IOSPandianShouM.h"
@implementation IOSPandianHisDetailTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.tagLabel.backgroundColor = RGBA(250, 250, 250, 1);
    self.mainImageView.contentMode = UIViewContentModeScaleAspectFill;
}
-(void)setListHisModel:(IOSPandianShouM *)listHisModel{
    _listHisModel = listHisModel;
    [self.mainImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,listHisModel.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.nameLabel.text = listHisModel.goodsName;
    self.labelOne.text = kStringFormat(@"货号：%@",listHisModel.goodsId);
    self.labelTwo.text = kStringFormat(@"当前数量：%li",listHisModel.stockNum);
    self.labelThr.text = kStringFormat(@"盘点数量：%li",listHisModel.checkNum);
    self.labelFour.text = kStringFormat(@"盈亏数量:%li",listHisModel.num);
    self.labelFive.text = kStringFormat(@"盈亏金额:%@",listHisModel.sumpaid);


    if (listHisModel.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
