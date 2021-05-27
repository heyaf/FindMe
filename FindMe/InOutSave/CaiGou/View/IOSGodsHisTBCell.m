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
    CYCustomArcImageView *tagbgview = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-10-15-50, 20, 50, 20)];
    tagbgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:tagbgview];
    tagbgview.borderTopLeftRadius = 5;
    tagbgview.borderBottomLeftRadius = 5;
    tagbgview.borderTopRightRadius = 10;
    tagbgview.borderWidth = 1;
    tagbgview.Colortype =1;
    self.tagbgview = tagbgview;
    
    self.taglabel = [tagbgview createLabelFrame:CGRectMake(0, 0, 50, 20) textColor:[UIColor grayColor] font:FONT(14)];
    self.taglabel.textAlignment = NSTextAlignmentCenter;
    
}
-(void)setHisModel:(IOSGodsHisModel *)hisModel{
    _hisModel = hisModel;
    NSInteger inte = arc4random() / 2;
//    if (inte==1) {
//        self.tagbgview.Colortype = 1;
//        self.taglabel.text = @"采购中";
//        self.taglabel.textColor = IOSMainColor;
//    }else{
        
//    }
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
    
    if (hisModel.type==2) {
        self.tagbgview.Colortype = 2;
        self.taglabel.text = @"已完成";
        self.taglabel.textColor = [UIColor grayColor];
    }else{
        self.tagbgview.Colortype = 1;
       self.taglabel.text = @"采购中";
       self.taglabel.textColor = IOSMainColor;
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
