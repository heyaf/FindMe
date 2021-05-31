//
//  IOSTongjiYingKuiTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "IOSTongjiYingKuiTBCell.h"
#import "IOSTongji2M.h"

@implementation IOSTongjiYingKuiTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.xinghaoBGView.backgroundColor = RGBA(51, 51, 51, 0.2);
    [self.xinghaoBGView setRectCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight CornerRadius:10 borderColor:[UIColor whiteColor] borderWidth:0];

}
-(void)setTongji2M:(IOSTongji2M *)tongji2M{
    _tongji2M = tongji2M;
    [self.mainPicImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,tongji2M.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.NameLabel.text = tongji2M.goodsName;
    self.xinghaoLabel.text = tongji2M.goodsId;
    self.labelOne.text = kStringFormat(@"单价:￥%.2f",[tongji2M.price floatValue]);
    self.labelTwo.text = kStringFormat(@"当前数量:%li",tongji2M.stockNum);
    self.labelThr.text = kStringFormat(@"盘点数量:%li",tongji2M.checkNum);
    self.labelFour.text = kStringFormat(@"盈亏数量:%li",tongji2M.num);
    self.labelFive.text = kStringFormat(@"盈亏金额:￥%.2f",[tongji2M.sumpaid floatValue]);
    if ([tongji2M.sumpaid floatValue]>=0) {
        self.tagImageV.image = ImageNamed(@"IOSPanying");
    }else{
        self.tagImageV.image = ImageNamed(@"IOSPanKui");
    }
    
    self.bottomLabelOne.text = kStringFormat(@"单号:%@",tongji2M.checkId);
    self.bottomLabelTwo.text = kStringFormat(@"盘点日期:%@",tongji2M.checkTime);
    self.bottomLabelThr.text = kStringFormat(@"操作员:%@",tongji2M.checkUserName);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
