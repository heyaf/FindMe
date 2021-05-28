//
//  IOSManagerGodsTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "IOSManagerGodsTBCell.h"
#import "IOSGodsListM.h"
@implementation IOSManagerGodsTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.xinghaoBGView.backgroundColor = RGBA(0, 0, 0, 0.2);
    [self.xinghaoBGView setRectCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight CornerRadius:10 borderColor:[UIColor whiteColor] borderWidth:0];

    self.tagLabel.backgroundColor = RGBA(245, 245, 245, 1);
    ViewRadius(self.tagLabel, 7);
    self.mainPicImageView.contentMode = UIViewContentModeScaleAspectFill;
    
}
-(void)setGodsModel:(IOSGodsListM *)godsModel{
    _godsModel = godsModel;
    
    [self.mainPicImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,godsModel.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.xinghaoLabel.text = godsModel.GodsId;
    self.NameLabel.text = godsModel.goodsName;
    self.rukulabel.text = kStringFormat(@"%li",(long)godsModel.inStockNum);
    self.chukulabel.text = kStringFormat(@"%li",(long)godsModel.outStockNum);
    self.kucunlabel.text = kStringFormat(@"%li",(long)godsModel.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[godsModel.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.priceLabel.attributedText = attriStr;
    if (godsModel.isRecycle==1) {
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
