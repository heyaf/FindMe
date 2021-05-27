//
//  IOSGodsDetailTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import "IOSGodsDetailTBCell.h"
#import "IOSCaiGouListModel.h"
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
    self.numLabel.text = kStringFormat(@"%li",caigouDetailGodsM.inNum);

    self.unaddrButton.hidden = YES;
    [self.addButton setImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(40, 40)] forState:0];
    
//    if (caigouDetailGodsM.selectCount==1) {
//        [self.unaddrButton setImage:ImageNamed(@"IOSjian") forState:0];
//    }else{
//        [self.unaddrButton setImage:ImageNamed(@"IOSJian1") forState:0];
//
//    }
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
@end
