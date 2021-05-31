//
//  IOSGodsDetailTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import "IOSGodsDetailTBCell.h"
#import "IOSCaiGouListModel.h"
#import "IOSInStoreModel.h"
#import "IOSOutStoreM.h"
#import "IOSLingYongListM.h"
#import "IOSAddHuiShouM.h"
@implementation IOSGodsDetailTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.EditPriceButton.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 26);
    self.unaddrButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    self.addButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    self.selectedImageV.hidden = YES;
    self.tagLabel.hidden = YES;
    self.tagLabel.backgroundColor = RGBA(250, 250, 250, 1);
    self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.bianjiBtn.hidden = YES;
    self.bianjiLabel.hidden = YES;
    self.bianjiImageV.hidden = YES;
}

-(void)setCaigouChooseGodsM:(IOSCaiGouListModel *)caigouChooseGodsM{
    _caigouChooseGodsM = caigouChooseGodsM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,caigouChooseGodsM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = caigouChooseGodsM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",caigouChooseGodsM.godsId);
    self.godsNumlabel1.text = kStringFormat(@"库存：%li",caigouChooseGodsM.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[caigouChooseGodsM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
    

    if (caigouChooseGodsM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    if (caigouChooseGodsM.isSelected) {
        self.selectedImageV.image = ImageNamed(@"IOSCaiGouSelel");
    }else{
        self.selectedImageV.image = ImageNamed(@"IOSCaiGouSelectIcon");
    }
    
    
    
    
}
-(void)setCaigouListGodsM:(IOSCaiGouListModel *)caigouListGodsM{
    _caigouListGodsM = caigouListGodsM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,caigouListGodsM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = caigouListGodsM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",caigouListGodsM.godsId);
    self.godsNumlabel1.text = kStringFormat(@"库存：%li",caigouListGodsM.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[caigouListGodsM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
    if (caigouListGodsM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    self.numLabel.text = kStringFormat(@"%li",caigouListGodsM.selectCount);

    if (caigouListGodsM.selectCount==1) {
        [self.unaddrButton setImage:ImageNamed(@"IOSjian") forState:0];
    }else{
        [self.unaddrButton setImage:ImageNamed(@"IOSJian1") forState:0];

    }
   
}
-(void)setCaigouDetailGodsM:(IOSCaiGouListModel *)caigouDetailGodsM{
    _caigouDetailGodsM = caigouDetailGodsM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,caigouDetailGodsM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = caigouDetailGodsM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",caigouDetailGodsM.godsId);
    self.godsNumlabel1.text = kStringFormat(@"库存：%li",caigouDetailGodsM.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[caigouDetailGodsM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
    if (caigouDetailGodsM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    self.numLabel.text = kStringFormat(@"%li",caigouDetailGodsM.num);

    self.unaddrButton.hidden = YES;
    [self.addButton setImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(40, 40)] forState:0];
    
//    if (caigouDetailGodsM.selectCount==1) {
//        [self.unaddrButton setImage:ImageNamed(@"IOSjian") forState:0];
//    }else{
//        [self.unaddrButton setImage:ImageNamed(@"IOSJian1") forState:0];
//
//    }
}

-(void)setInstoreM:(IOSInStoreModel *)instoreM{
    _instoreM = instoreM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,instoreM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = instoreM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",instoreM.goodsId);
    self.godsNumlabel1.text = kStringFormat(@"库存：%li",instoreM.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[instoreM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
    if (instoreM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    self.tagLabel.hidden = NO;
    
    self.unaddrButton.hidden = YES;
    self.addButton.hidden = YES;
    self.EditPriceButton.hidden = YES;
    
    NSString *numStr = kStringFormat(@"入库数量 x%li",instoreM.inStockNum);
    NSMutableAttributedString *attriStr1 = [[NSMutableAttributedString alloc] initWithString:numStr];
    [attriStr1 addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, numStr.length)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, 5)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(5, 1)];
    self.numLabel.attributedText = attriStr1;
    self.numLabelConStraint.constant = -20;

}
-(void)setOutstoreM:(IOSOutStoreM *)outstoreM{
    _outstoreM = outstoreM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,outstoreM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = outstoreM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",outstoreM.goodsId);
    self.godsNumlabel1.text = kStringFormat(@"库存：%li",outstoreM.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[outstoreM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
    if (outstoreM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    self.tagLabel.hidden = NO;
    
    self.unaddrButton.hidden = YES;
    self.addButton.hidden = YES;
    self.EditPriceButton.hidden = YES;
    
    NSString *numStr = kStringFormat(@"出库数量 x%li",outstoreM.outStockNum);
    NSMutableAttributedString *attriStr1 = [[NSMutableAttributedString alloc] initWithString:numStr];
    [attriStr1 addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, numStr.length)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, 5)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(5, 1)];
    self.numLabel.attributedText = attriStr1;
    self.numLabelConStraint.constant = -20;

}

-(void)setLingyongM:(IOSLingYongListM *)lingyongM{
    _lingyongM = lingyongM;
    
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,lingyongM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = lingyongM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",lingyongM.mateId);
    self.godsNumlabel1.text = kStringFormat(@"库存：%li",lingyongM.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[lingyongM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
    if (lingyongM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    self.tagLabel.hidden = NO;
    
    self.unaddrButton.hidden = YES;
    self.addButton.hidden = YES;
    self.EditPriceButton.hidden = YES;
    
    NSString *numStr = kStringFormat(@"领取数量 x%li",lingyongM.num);
    NSMutableAttributedString *attriStr1 = [[NSMutableAttributedString alloc] initWithString:numStr];
    [attriStr1 addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, numStr.length)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, 5)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(5, 1)];
    self.numLabel.attributedText = attriStr1;
    self.numLabelConStraint.constant = -20;
}

-(void)setAddhuiShouM:(IOSAddHuiShouM *)addhuiShouM{
    _addhuiShouM = addhuiShouM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,addhuiShouM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = addhuiShouM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",addhuiShouM.mateId);
    self.godsNumlabel1.text = kStringFormat(@"库存：%li",addhuiShouM.stockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[addhuiShouM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
   
    self.tagLabel.text = @" 可回收 ";
    self.tagLabel.hidden = NO;
    
    self.unaddrButton.hidden = YES;
    self.addButton.hidden = YES;
    self.EditPriceButton.hidden = YES;
    
    NSString *numStr = kStringFormat(@"领用数量 x%li",addhuiShouM.num);
    NSMutableAttributedString *attriStr1 = [[NSMutableAttributedString alloc] initWithString:numStr];
    [attriStr1 addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, numStr.length)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, 5)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(5, 1)];
    self.numLabel.attributedText = attriStr1;
    self.numLabelConStraint.constant = -20;
}

-(void)setHuiShouM:(IOSAddHuiShouM *)huiShouM{
    _huiShouM = huiShouM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,huiShouM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = huiShouM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",huiShouM.mateId);
    self.godsNumlabel1.text = kStringFormat(@"出库数量：%li",huiShouM.outStockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[huiShouM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
   
    self.tagLabel.text = @" 可回收 ";
    self.tagLabel.hidden = NO;
    
    self.unaddrButton.hidden = NO;
    self.addButton.hidden = NO;
    self.EditPriceButton.hidden = YES;
    
    self.numLabel.text = kStringFormat(@"%li",huiShouM.outStockNum);
    if (huiShouM.selectCount==1) {
        [self.unaddrButton setImage:ImageNamed(@"IOSjian") forState:0];
    }else{
        [self.unaddrButton setImage:ImageNamed(@"IOSJian1") forState:0];

    }
    
}

-(void)setAddSunHaoM:(IOSAddHuiShouM *)addSunHaoM{
    _addSunHaoM = addSunHaoM;
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,addSunHaoM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = addSunHaoM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",addSunHaoM.mateId);
    self.godsNumlabel1.text = kStringFormat(@"领用数量：%li",addSunHaoM.outStockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[addSunHaoM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
   
    self.tagLabel.hidden = NO;
    if (addSunHaoM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    
    self.unaddrButton.hidden = NO;
    self.addButton.hidden = NO;
    self.EditPriceButton.hidden = YES;
    
    self.numLabel.text = kStringFormat(@"%li",addSunHaoM.outStockNum);
    if (addSunHaoM.selectCount==1) {
        [self.unaddrButton setImage:ImageNamed(@"IOSjian") forState:0];
    }else{
        [self.unaddrButton setImage:ImageNamed(@"IOSJian1") forState:0];

    }
    self.bianjiBtn.hidden = NO;
    self.bianjiLabel.hidden = NO;
    self.bianjiImageV.hidden = NO;
    
    if (addSunHaoM.remark.length==0) {
        self.bianjiLabel.text = @"添加备注...";
        self.bianjiLabel.textColor = [UIColor lightGrayColor];
    }else{
        self.bianjiLabel.text = addSunHaoM.remark;
        self.bianjiLabel.textColor = IOSMainColor;
    }
}

-(void)setSunHaoM:(IOSAddHuiShouM *)SunHaoM{
    _SunHaoM = SunHaoM;
    
    [self.picImageView  sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,SunHaoM.img)] placeholderImage:ImageNamed(@"placeholder")];
    self.titleLabel.text = SunHaoM.goodsName;
    self.godsNumLabel.text = kStringFormat(@"货号：%@",SunHaoM.mateId);
    self.godsNumlabel1.text = kStringFormat(@"领用数量：%li",SunHaoM.outStockNum);
    NSString *priceStr =kStringFormat(@"￥%.2f",[SunHaoM.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:16],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-2, 2)];
    self.PriceLabel.attributedText = attriStr;
   
    self.tagLabel.hidden = NO;
    if (SunHaoM.isRecycle==1) {
        self.tagLabel.text = @" 不可回收 ";
    }else{
        self.tagLabel.text = @" 可回收 ";
    }
    
    self.unaddrButton.hidden = YES;
    self.addButton.hidden = YES;
    self.EditPriceButton.hidden = YES;
    
    self.numLabel.text = kStringFormat(@"%li",SunHaoM.lossNum);
    if (SunHaoM.selectCount==1) {
        [self.unaddrButton setImage:ImageNamed(@"IOSjian") forState:0];
    }else{
        [self.unaddrButton setImage:ImageNamed(@"IOSJian1") forState:0];

    }
    self.bianjiBtn.hidden = NO;
    self.bianjiLabel.hidden = NO;
    self.bianjiImageV.hidden = NO;
    self.bianjiLabel.textColor = IOSMainColor;

    if (SunHaoM.remark.length==0) {
        self.bianjiLabel.text = @"无损耗";
    }else{
        self.bianjiLabel.text = SunHaoM.remark;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setGodsListType:(NSInteger)godsListType{
    if (godsListType==1) {
        
    }else if (godsListType==2){
        self.EditPriceButton.hidden = YES;
        self.godsnumBgView.hidden = YES;
        self.tagLabel.hidden = NO;
        self.selectedImageV.hidden = NO;
        
        
    }else if (godsListType==3){
        self.EditPriceButton.hidden = YES;
        self.tagLabel.hidden = NO;

    }
}

- (IBAction)unAddButtonClicked:(id)sender {

    if (self.unAddBtnClicked) {
        self.unAddBtnClicked();
    }
}
- (IBAction)editPriceButtonClicked:(id)sender {
    if (self.editPriceBtnClicked) {
        self.editPriceBtnClicked();
    }
}

- (IBAction)addButtonClicked:(id)sender {
    if (self.AddBtnClicked) {
        self.AddBtnClicked();
    }
}

- (IBAction)bianjiBtnClicked:(id)sender {
    if (self.editRemarkBtnClicked) {
        self.editRemarkBtnClicked();
    }
}
@end
