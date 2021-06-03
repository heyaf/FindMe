//
//  IOSGodsHisTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import "IOSGodsHisTBCell.h"
#import "IOSGodsHisModel.h"

@implementation IOSGodsHisTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = RGBA(250, 250, 250, 1);
    self.userHeaderImageView.contentMode = UIViewContentModeScaleAspectFill;

    
}
-(void)setHisModel:(IOSGodsHisModel *)hisModel{
    _hisModel = hisModel;

    self.NameLabel.text = hisModel.purchName;
    self.orderNumberLabel.text = kStringFormat(@"采购单号:%@",hisModel.purchId);
    self.orderTimeLabel.text = kStringFormat(@"采购时间:%@",hisModel.purchTime);
    
    [self.userHeaderImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,hisModel.purchUserPhoto)] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = hisModel.purchUserName;
    
    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",hisModel.num,[hisModel.price floatValue]);
    NSString *numStr = kStringFormat(@"%li",hisModel.num);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+numStr.length, 6)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr.length-4, 3)];
    self.PriceLabel.attributedText = attriStr;
    
    if (hisModel.type==1) {
        self.tagImageV.image = ImageNamed(@"IOSCaigouing");
    }else{
        self.tagImageV.image = ImageNamed(@"IOSCaigouFinish");
       
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
