//
//  IOSTongjiListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSTongjiListTBCell.h"
#import "IOSTongjiM.h"
@implementation IOSTongjiListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.xinghaoBGView.backgroundColor = RGBA(51, 51, 51, 0.2);
    [self.xinghaoBGView setRectCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight CornerRadius:10 borderColor:[UIColor whiteColor] borderWidth:0];
}
-(void)setTongjiM:(IOSTongjiM *)tongjiM{
    _tongjiM =tongjiM;
    [self.mainPicImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,tongjiM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.NameLabel.text = tongjiM.goodsName;
    self.xinghaoLabel.text = tongjiM.purchId;
    self.labelOne.text = kStringFormat(@"单价:￥%.2f",[tongjiM.price floatValue]);
    self.labelTwo.text = kStringFormat(@"数量:%li",tongjiM.num);
    NSString *priceStr =kStringFormat(@"￥%.2f",[tongjiM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.labelThr.attributedText = attriStr;
    
    self.bottomLabelOne.text = kStringFormat(@"单号%@",tongjiM.goodsId);
    self.bottomLabelTwo.text = kStringFormat(@"入库日期:%@",tongjiM.purchTime);
    self.bottomLabelThr.text = kStringFormat(@"操作员:%@",tongjiM.stockUserName);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
