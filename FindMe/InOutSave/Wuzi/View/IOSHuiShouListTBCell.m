//
//  IOSHuiShouListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSHuiShouListTBCell.h"
#import "IOSChoHuishouM.h"
@implementation IOSHuiShouListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = RGBA(250, 250, 250, 1);
}
- (void)setHuishouM:(IOSChoHuishouM *)huishouM{
    _huishouM = huishouM;
    if (huishouM.isSelect) {
        [self.selelctButton setImage:ImageNamed(@"IOSChoosedIcon") forState:0];
    }else{
        [self.selelctButton setImage:ImageNamed(@"UISDuihao") forState:0];
    }
    self.NameLabel.text = huishouM.mateName;
    self.labelOne.text = kStringFormat(@"领取单号:%@",huishouM.mateId);
    self.labelOne.text = kStringFormat(@"领取时间:%@",huishouM.getTime);
    
//    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",huishouM.num,[huishouM.price floatValue]);
//    NSString *numStr = kStringFormat(@"%li",huishouM.num);
//    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
//    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
//    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
//    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+numStr.length, 6)];
//    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
//    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr.length-4, 3)];
//    self.detailLabel.attributedText = attriStr;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
