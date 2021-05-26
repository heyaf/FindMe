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
        
    }
}

- (IBAction)unAddButtonClicked:(id)sender {
}
- (IBAction)editPriceButtonClicked:(id)sender {
}

- (IBAction)addButtonClicked:(id)sender {
}
@end
