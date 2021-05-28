//
//  IOSInStoreListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSInStoreListTBCell.h"
#import "IOSPanDianHisListM.h"
@implementation IOSInStoreListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = RGBA(245, 245, 245, 1);
    self.userImageV.contentMode = UIViewContentModeScaleAspectFill;
}
-(void)setHisListM:(IOSPanDianHisListM *)hisListM{
    _hisListM = hisListM;
    self.TItleLabel.text = hisListM.checkName;
    self.labelOne.text = kStringFormat(@"盘点单号:%@",hisListM.checkId);
    self.labelTwo.text = kStringFormat(@"盘点时间:%@",hisListM.checkTime);
    self.labelThr.hidden = YES;
    
    [self.userImageV sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,hisListM.checkUserPhoto)] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = hisListM.checkUserName;
    
    NSString *textStr = kStringFormat(@"共盈亏 %li 件商品",hisListM.num);
    NSString *countStr = kStringFormat(@"%li",hisListM.num);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:textStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(15),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(4, countStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, textStr.length)];
   
    self.detailLabel.attributedText = attriStr;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
