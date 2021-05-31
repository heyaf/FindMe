//
//  IOSTongjiListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSTongjiListTBCell.h"
#import "IOSTongji0M.h"
#import "IOSTongjiM.h"
#import "IOSTongji1M.h"

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
    self.xinghaoLabel.text = tongjiM.goodsId;
    self.labelOne.text = kStringFormat(@"单价:￥%.2f",[tongjiM.price floatValue]);
    self.labelTwo.text = kStringFormat(@"数量:%li",tongjiM.inStockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[tongjiM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.labelThr.attributedText = attriStr;
    
    self.bottomLabelOne.text = kStringFormat(@"单号:%@",tongjiM.inStockId);
    self.bottomLabelTwo.text = kStringFormat(@"入库日期:%@",tongjiM.purchTime);
    self.bottomLabelThr.text = kStringFormat(@"操作员:%@",tongjiM.purchUserName);
}
-(void)setTongji0M:(IOSTongji0M *)tongji0M{
    _tongji0M = tongji0M;
    [self.mainPicImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,tongji0M.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.NameLabel.text = tongji0M.goodsName;
    self.xinghaoLabel.text = tongji0M.goodsId;
    self.labelOne.text = kStringFormat(@"单价:￥%.2f",[tongji0M.price floatValue]);
    self.labelTwo.text = kStringFormat(@"数量:%li",tongji0M.num);
    NSString *priceStr =kStringFormat(@"￥%.2f",[tongji0M.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.labelThr.attributedText = attriStr;
    
    self.bottomLabelOne.text = kStringFormat(@"单号:%@",tongji0M.purchId);
    self.bottomLabelTwo.text = kStringFormat(@"采购日期:%@",tongji0M.purchTime);
    self.bottomLabelThr.text = kStringFormat(@"操作员:%@",tongji0M.purchUserName);
}
-(void)setTongji1M:(IOSTongji1M *)tongji1M{
    _tongji1M = tongji1M;
    [self.mainPicImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,tongji1M.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.NameLabel.text = tongji1M.goodsName;
    self.xinghaoLabel.text = tongji1M.goodsId;
    self.labelOne.text = kStringFormat(@"单价:￥%.2f",[tongji1M.price floatValue]);
    self.labelTwo.text = kStringFormat(@"数量:%li",tongji1M.outStockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[tongji1M.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.labelThr.attributedText = attriStr;
    
    self.bottomLabelOne.text = kStringFormat(@"单号:%@",tongji1M.outStockId);
    self.bottomLabelTwo.text = kStringFormat(@"出库日期:%@",tongji1M.purchTime);
    self.bottomLabelThr.text = kStringFormat(@"操作员:%@",tongji1M.purchUserName);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
