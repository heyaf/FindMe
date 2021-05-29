//
//  IOSInStoreListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSInStoreListTBCell.h"
#import "IOSPanDianHisListM.h"
#import "IOSInStoreModel.h"
#import "IOSLingYongListM.h"
#import "IOSHuishouListM.h"
#import "IOSSunhaoListModel.h"
@implementation IOSInStoreListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = RGBA(245, 245, 245, 1);
    self.userImageV.contentMode = UIViewContentModeScaleAspectFill;
    self.tagImageView.hidden = YES;
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
-(void)setInStoreListM:(IOSInStoreModel *)inStoreListM{
    _inStoreListM = inStoreListM;
    self.TItleLabel.text = inStoreListM.inStockName;
    self.labelOne.text = kStringFormat(@"入库单:%@",inStoreListM.inStockId);
    self.labelTwo.text = kStringFormat(@"关联采购单:%@",inStoreListM.purchId);
    self.labelThr.text = kStringFormat(@"入库时间:%@",inStoreListM.createTime);
    
    [self.userImageV sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,inStoreListM.stockUserPhoto)] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = inStoreListM.stockUserName;
    
    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",inStoreListM.num,[inStoreListM.price floatValue]);
    NSString *numStr = kStringFormat(@"%li",inStoreListM.num);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+numStr.length, 6)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr.length-4, 3)];
    self.detailLabel.attributedText = attriStr;
}
- (void)setLingyongListM:(IOSLingYongListM *)lingyongListM{
    _lingyongListM = lingyongListM;
    self.TItleLabel.text = lingyongListM.mateName;
    self.labelOne.text = kStringFormat(@"领取单号:%@",lingyongListM.mateId);
    self.labelTwo.text = kStringFormat(@"领取时间:%@",lingyongListM.getTime);
    self.labelThr.hidden = YES;
    [self.userImageV sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,lingyongListM.getUserPhoto)] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = lingyongListM.getUserName;
    
    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",lingyongListM.num,[lingyongListM.price floatValue]);
    NSString *numStr = kStringFormat(@"%li",lingyongListM.num);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+numStr.length, 6)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr.length-4, 3)];
    self.detailLabel.attributedText = attriStr;
}
-(void)setHuishouListM:(IOSHuishouListM *)huishouListM{
    _huishouListM = huishouListM;
    self.TItleLabel.text = huishouListM.recoveryName;
    self.labelOne.text = kStringFormat(@"关联领用单:%@",huishouListM.mateId);
    self.labelTwo.text = kStringFormat(@"回收时间:%@",huishouListM.getTime);
    self.labelThr.hidden = YES;
    [self.userImageV sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,huishouListM.getUserPhoto)] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = huishouListM.getUserName;
    
    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",huishouListM.num,[huishouListM.price floatValue]);
    NSString *numStr = kStringFormat(@"%li",huishouListM.num);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+numStr.length, 6)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr.length-4, 3)];
    self.detailLabel.attributedText = attriStr;
    self.tagImageView.hidden = NO;
    if (huishouListM.type==1) { //待回收
        self.tagImageView.image = ImageNamed(@"IOSPanying");
    }else{
        self.tagImageView.image = ImageNamed(@"IOSPanKui");
    }
}

-(void)setSunhaoM:(IOSSunhaoListModel *)sunhaoM{
    _sunhaoM = sunhaoM;
    self.TItleLabel.text = sunhaoM.lossName;
    self.labelOne.text = kStringFormat(@"关联领用单:%@",sunhaoM.mateId);
    self.labelTwo.text = kStringFormat(@"回收时间:%@",sunhaoM.getTime);
    self.labelThr.hidden = YES;
    [self.userImageV sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,sunhaoM.getUserPhoto)] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = sunhaoM.getUserName;
    
    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",sunhaoM.num,[sunhaoM.price floatValue]);
    NSString *numStr = kStringFormat(@"%li",sunhaoM.num);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+numStr.length, 6)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr.length-4, 3)];
    self.detailLabel.attributedText = attriStr;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
