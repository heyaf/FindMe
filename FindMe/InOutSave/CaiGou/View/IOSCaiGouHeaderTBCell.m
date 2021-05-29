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
-(void)setinstoredanHeadView:(NSDictionary *)dateDic{
    if (dateDic.count==0) {
        return;
    }
/*        "purchId": "C20210511182028",           // 采购单号
 "inStockName": null,
 "inStockId": "I20210512100252721441",   // 入库单号
 "companyId": "7",                       // 所属公司ID
 "purchUserId": "293",                   // 采购员ID
 "purchUserName": "凌鸥",                // 采购员名称
 "stockUserId": null,
 "stockUserName": "童少供货",            // 库管名称
 "purchTime": "2021-05-11 17:26:27",    // 采购时间
 "createTime": "2021-05-12 10:02:53",   // 入库时间*/
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"getUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"stockUserName"],AowString(dateDic[@"inStockId"]));
    self.label1.text = kStringFormat(@"关联采购单:%@",dateDic[@"purchId"]);
        self.label2.text = kStringFormat(@"采购时间:%@",dateDic[@"createTime"]);
        self.label2.textColor = [UIColor grayColor];
    self.label3.text = kStringFormat(@"入库时间:%@",dateDic[@"purchTime"]);
    NSString *label4Str = kStringFormat(@"操作员:%@",dateDic[@"stockUserName"]);
    NSMutableAttributedString *myattriStr = [[NSMutableAttributedString alloc] initWithString:label4Str];
    [myattriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, label4Str.length)];
    [myattriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor grayColor],} range:NSMakeRange(0, 4)];

    self.label4.attributedText = myattriStr;
    self.label3.hidden = NO;
    self.label4.hidden = NO;

    self.nameLabel.text = @"盘点商品";
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
/*getUserId = "293",
 getUserPhoto = "F://images/2.jpg",
 getTime = "2021-05-13 20:10:00",
 getUserName = "凌鸥",
 outStockTime = "2021-05-13 19:41:17",
         handleUserName = "童少供货",
         outStockId = "O20210513194116020007",,*/
-(void)setoutstoredanHeadView:(NSDictionary *)dateDic{
    if (dateDic.count==0) {
        return;
    }
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"getUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"handleUserName"],AowString(dateDic[@"outStockId"]));
//    self.label1.text = kStringFormat(@"关联采购单:%@",dateDic[@"outStockId"]);
        self.label1.text = kStringFormat(@"采购时间:%@",dateDic[@"getTime"]);
        self.label2.textColor = [UIColor grayColor];
    self.label2.text = kStringFormat(@"出库时间:%@",dateDic[@"outStockTime"]);
    NSString *label4Str = kStringFormat(@"操作员:%@",dateDic[@"getUserName"]);
    NSMutableAttributedString *myattriStr = [[NSMutableAttributedString alloc] initWithString:label4Str];
    [myattriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, label4Str.length)];
    [myattriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor grayColor],} range:NSMakeRange(0, 4)];

    self.label3.attributedText = myattriStr;
    self.label3.hidden = NO;
    self.label4.hidden = YES;

    self.nameLabel.text = @"盘点商品";
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
-(void)setlingyongdanHeadView:(NSDictionary *)dateDic{
    /*        "mateId": "M20210512115222099909",  // 物资单号
     "getUserId": "293",                 // 领取人ID
     "status": 1    // 物资单状态 1:未生成采购单 2:已生成采购单 3:备货完成 9:已确认(全部)收货
     "flag": "2",                        // flag 1:领取人 2:库管  100:没有权限
             "getTime": "2021-05-12 00:45:49",   // 领取时间
             "getUserName": "凌鸥",              // 领取人姓名
             "type": 1,                          // 1:库管申请出库 2:其他申请出库
     */
    if (dateDic.count==0) {
        return;
    }
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"mateUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"getUserName"],AowString(dateDic[@"mateId"]));
    self.label1.text = kStringFormat(@"领取时间:%@",dateDic[@"getTime"]);
        self.label2.hidden = YES;

    self.label3.hidden = YES;
    self.label4.hidden = YES;

    self.nameLabel.text = @"领取商品";
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
-(void)setaddhuishoudanHeadView:(NSDictionary *)dateDic{
    if (dateDic.count==0) {
        return;
    }
    /*        "mateName": "凌鸥",                         // 物资单名称
     "flag": "2",                                // 2:㔊管 100:非库管
     "getTime": "2021-05-13 20:10:00",           // 领取时间
     "getUserName": "凌鸥",                      // 领取人名称
     "mateId": "M20210513193925201410",          // 物资单号
     "getUserId": "293",                         // 领取人ID*/
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"getUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"getUserName"],AowString(dateDic[@"mateId"]));
    self.label1.text = kStringFormat(@"领取时间:%@",dateDic[@"getTime"]);
        self.label2.hidden = YES;

    self.label3.hidden = YES;
    self.label4.hidden = YES;

    self.nameLabel.text = @"领取商品";
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

//新增损耗
-(void)setaddsunhaoHeadView:(NSDictionary *)dateDic{
    if (dateDic.count==0) {
        return;
    }
    /*        "mateName": "凌鸥",                         // 物资单名称
     "flag": "2",                                // 2:㔊管 100:非库管
     "getTime": "2021-05-13 20:10:00",           // 领取时间
     "getUserName": "凌鸥",                      // 领取人名称
     "mateId": "M20210513193925201410",          // 物资单号
     "getUserId": "293",                         // 领取人ID*/
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"getUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"getUserName"],AowString(dateDic[@"mateId"]));
    self.label1.text = kStringFormat(@"领取时间:%@",dateDic[@"getTime"]);
        self.label2.hidden = YES;

    self.label3.hidden = YES;
    self.label4.hidden = YES;

    self.nameLabel.text = @"损耗商品";
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

//损耗详情
-(void)setsunhaoDetailHeadView:(NSDictionary *)dateDic{
    if (dateDic.count==0) {
        return;
    }
    /*        "mateName": "凌鸥",                         // 物资单名称
     "flag": "2",                                // 2:㔊管 100:非库管
     "getTime": "2021-05-13 20:10:00",           // 领取时间
     "getUserName": "凌鸥",                      // 领取人名称
     "mateId": "M20210513193925201410",          // 物资单号
     "getUserId": "293",                         // 领取人ID*/
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"getUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"getUserName"],AowString(dateDic[@"lossId"]));
    self.label1.text = kStringFormat(@"领取单号:%@",dateDic[@"mateId"]);
    self.label2.hidden = NO;
    self.label2.text = kStringFormat(@"领取时间:%@",dateDic[@"getTime"]);

    self.label3.hidden = YES;
    self.label4.hidden = YES;

    self.nameLabel.text = @"损耗商品";
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
-(void)sethuishouDetailHeadView:(NSDictionary *)dateDic{
    if (dateDic.count==0) {
        return;
    }
    /*          "recoveryTime": "2021-05-15 10:43:31",      // 回收时间
     "stockUserId": "91",                        // 库管ID
     "flag": "2",                                // 2:库管 100:非库管
     "totalNum": 1,                              // 物资种类数
     "totalPrice": 9135.6,                       // 物资总价格
     "stockUserName": "童少供货",                 // 库管名称
     "getUserName": "凌鸥",                      // 领取人名称
     "recoveryId": "R20210515104324570929",      // 回收单号
     "mateId": "M20210513193925201410",          // 领用的物资单号
     "getUserId": "293",                         // 领取人ID*/
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,dateDic[@"getUserPhoto"])] placeholderImage:ImageNamed(@"placeholder")];
    self.userNameLabel.text = kStringFormat(@"%@  %@",dateDic[@"getUserName"],AowString(dateDic[@"recoveryId"]));
    self.label1.text = kStringFormat(@"关联领用单:%@",dateDic[@"mateId"]);
        self.label2.hidden = NO;
    self.label2.text = kStringFormat(@"回收日期:%@",dateDic[@"recoveryTime"]);
    
    self.label3.hidden = NO;
    self.label4.hidden = YES;

    if ([dateDic[@"type"] integerValue]==2) {
        self.label3.text = @"已完成";
        self.label3.textColor = [UIColor grayColor];

    }else{
       self.label3.text = @"待回收";
        self.label3.textColor = IOSMainColor;

    }

    self.nameLabel.text = @"领取商品";
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
