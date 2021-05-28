//
//  IOSCaiGouHeaderTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSCaiGouHeaderTBCell.h"

@implementation IOSCaiGouHeaderTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.label3.hidden = YES;
    self.label4.hidden = YES;
    self.userImageView.contentMode = UIViewContentModeScaleAspectFill;
}
//采购单详情头部
-(void)setcaigoudanHeadView:(NSDictionary *)dateDic{
    if (dateDic.count==0) {
        return;
    }
    /*        "stockUserId": "91",                  // 库管ID
    "totalPrice": 33,                     // 采购总价格
    "totalNum": 2,                        // 采购总类别
    "purchId": "C20210511182028",         // 采购单号
    "purchUserId": "293",                 // 采购人ID
    "purchUserName": "凌鸥",              // 采购人姓名
    "purchUserPhoto": null,               // 采购人头像*/
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"purchUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"purchUserName"],dateDic[@"purchId"]);
    self.label1.text = kStringFormat(@"采购时间:%@",dateDic[@"purchTime"]);
    if ([dateDic[@"type"] integerValue]==2) {
        self.label2.text = @"已完成";
        self.label2.textColor = [UIColor grayColor];
    }else{
       self.label2.text = @"采购中";
        self.label2.textColor = IOSMainColor;
        
    }

    self.nameLabel.text = @"采购商品";
    NSString *priceStr =kStringFormat(@"共%li件商品,合计%.2f元",[dateDic[@"totalNum"] integerValue],[dateDic[@"totalPrice"] floatValue]);
    NSString *numStr = kStringFormat(@"%li",[dateDic[@"totalNum"] integerValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(1+numStr.length, 6)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(priceStr.length-1, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr.length-4, 3)];
    self.detailLabel.attributedText = attriStr;
    
}
-(void)setpandianHisHeadView:(NSDictionary *)dateDic{
    /*        "checkTime": "2021-05-13 11:37:26",           // 盘点时间
     "checkUserName": "童少供货",                   // 盘点人姓名
     "checkName": "20210513盘点单",                 // 盘点单名称
     "checkId": "Check20210513113708769829",       // 盘点单号*/
    
    if (dateDic.count==0) {
        return;
    }

    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"checkUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"checkUserName"],AowString(dateDic[@"checkId"]));
    self.label1.text = kStringFormat(@"采购时间:%@",dateDic[@"checkTime"]);
        self.label2.text = @"盘点完成";
        self.label2.textColor = [UIColor grayColor];
    

    self.nameLabel.text = @"盘点商品";
    NSString *priceStr =kStringFormat(@"共 %li 件商品",[dateDic[@"totalNum"] integerValue]);
    NSString *numStr = kStringFormat(@"%li",[dateDic[@"totalNum"] integerValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor grayColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(2, numStr.length)];
    self.detailLabel.attributedText = attriStr;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
