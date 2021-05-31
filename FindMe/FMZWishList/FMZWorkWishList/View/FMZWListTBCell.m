//
//  FMZWListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import "FMZWListTBCell.h"

@implementation FMZWListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.mainBGimV1.hidden = YES;
    self.editImageV.hidden = YES;
    self.editBtn.hidden = YES;
    self.mainBgIMV.contentMode = UIViewContentModeScaleToFill;
    
}
-(void)setWishListM:(FMWWishListM *)wishListM{
    _wishListM = wishListM;
    if (wishListM.name.length>0) {
        self.editImageV.hidden = NO;
        self.editBtn.hidden = NO;
        self.chooseSingleImageV.hidden = YES;
        self.titleLabel.hidden = YES;
        self.luruLabel.hidden = YES;
        self.luruLiangLabel.hidden = YES;
        self.qiandanLabel.hidden = YES;
        self.qiandanLiangLabel.hidden = YES;
        self.qiandanPlabel.hidden = YES;
        self.qiandanPnumLabel.hidden = YES;
        self.leavelLabel.hidden = YES;
        self.leavelNumLabel.hidden = YES;
        self.starLabel.hidden = YES;
        self.startNumLabel.hidden = YES;
        self.tagimV.hidden = YES;
        self.tagimv1.hidden = YES;
        self.tagimV2.hidden = YES;


        UIImage *image;
        if ([wishListM.name isEqualToString:@"本日"]) {
            [self.editBtn setTitle:@"填写本日计划" forState:0];
            image = ImageNamed(@"EMWLImageView3");
        }else if ([wishListM.name isEqualToString:@"本年"]) {
            [self.editBtn setTitle:@"填写本年计划" forState:0];
            image = ImageNamed(@"EMWLImageView1");
        }else{
            [self.editBtn setTitle:kStringFormat(@"填写%@计划",wishListM.name) forState:0];
            image = ImageNamed(@"EMWLImagevIew2");
        }
        self.mainBgIMV.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(50, 30, 20, 50) resizingMode:UIImageResizingModeStretch];
        return;
    }
    self.chooseSingleImageV.hidden = NO;
    self.titleLabel.hidden = NO;
    self.luruLabel.hidden = NO;
    self.luruLiangLabel.hidden = NO;
    self.qiandanLabel.hidden = NO;
    self.qiandanLiangLabel.hidden = NO;
    self.qiandanPlabel.hidden = NO;
    self.qiandanPnumLabel.hidden = NO;
    self.leavelLabel.hidden = NO;
    self.leavelNumLabel.hidden = NO;
    self.starLabel.hidden = NO;
    self.startNumLabel.hidden = NO;
    self.tagimV.hidden = NO;
    self.tagimv1.hidden = NO;
    self.tagimV2.hidden = NO;
    NSString *luruStr = kStringFormat(@"%li",wishListM.luruNum);
    NSString *qiandanLStr =kStringFormat(@"%li",wishListM.qiandanNum);
    NSString *qiandanPStr = wishListM.qiandanPrice;
    
    NSString *leaveStr = wishListM.levleName;
    NSString *startStr = wishListM.startLevleName;
    if ([wishListM.wishStatus isEqualToString:@"2"]) {
        self.chooseSingleImageV.image = ImageNamed(@"FMWLSIngleChod");
        //中划线
          NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
          NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:luruStr attributes:attribtDic];
        [attribtStr addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, luruStr.length)];
        self.luruLiangLabel.attributedText = attribtStr;
        NSMutableAttributedString *attribtStr1 = [[NSMutableAttributedString alloc]initWithString:qiandanLStr attributes:attribtDic];
      [attribtStr1 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, qiandanLStr.length)];
        
        NSMutableAttributedString *attribtStr2 = [[NSMutableAttributedString alloc]initWithString:qiandanPStr attributes:attribtDic];
      [attribtStr2 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, qiandanPStr.length)];
        
        NSMutableAttributedString *attribtStr3 = [[NSMutableAttributedString alloc]initWithString:leaveStr attributes:attribtDic];
      [attribtStr3 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, leaveStr.length)];
        
        NSMutableAttributedString *attribtStr4 = [[NSMutableAttributedString alloc]initWithString:startStr attributes:attribtDic];
      [attribtStr4 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, startStr.length)];
        self.qiandanLiangLabel.attributedText = attribtStr1;
        self.qiandanPnumLabel.attributedText = attribtStr2;
        
        self.leavelNumLabel.attributedText = attribtStr3;
        self.startNumLabel.attributedText = attribtStr4;
        
        NSMutableAttributedString *attribtStr10 = [[NSMutableAttributedString alloc]initWithString:@"录入量" attributes:attribtDic];
      [attribtStr10 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, @"录入量".length)];
        NSMutableAttributedString *attribtStr11 = [[NSMutableAttributedString alloc]initWithString:@"签单量" attributes:attribtDic];
      [attribtStr11 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, @"签单量".length)];
        NSMutableAttributedString *attribtStr12 = [[NSMutableAttributedString alloc]initWithString:@"签单价格" attributes:attribtDic];
      [attribtStr12 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, @"签单价格".length)];
        NSMutableAttributedString *attribtStr13 = [[NSMutableAttributedString alloc]initWithString:@"级别" attributes:attribtDic];
      [attribtStr13 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, @"级别".length)];
        NSMutableAttributedString *attribtStr14 = [[NSMutableAttributedString alloc]initWithString:@"星级" attributes:attribtDic];
      [attribtStr14 addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, @"星级".length)];
        self.luruLabel.attributedText = attribtStr10;
        self.qiandanLabel.attributedText = attribtStr11;
        self.qiandanPlabel.attributedText = attribtStr12;
        
        self.leavelLabel.attributedText = attribtStr13;
        self.starLabel.attributedText = attribtStr14;
        
    }else{
        self.chooseSingleImageV.image = ImageNamed(@"FMWLSIngleCho");
        self.luruLiangLabel.text = luruStr;
        self.qiandanLiangLabel.text = qiandanLStr;
        self.qiandanPnumLabel.text = qiandanPStr;
        self.leavelNumLabel.text = leaveStr;
        self.startNumLabel.text = startStr;
        
    }
    if ([wishListM.cycleTime isEqualToString:@"1"]) {
        self.titleLabel.text = @"今日计划";
        self.mainBgIMV.image = ImageNamed(@"EMWLImageView3");
    }else if([wishListM.cycleTime isEqualToString:@"2"]){
        self.titleLabel.text = @"本周计划";
        self.mainBgIMV.image = ImageNamed(@"EMWLImageView2");

    }else if([wishListM.cycleTime isEqualToString:@"3"]){
        self.titleLabel.text = @"本月计划";
        self.mainBgIMV.image = ImageNamed(@"EMWLImageView2");

    }else if([wishListM.cycleTime isEqualToString:@"4"]){
        self.titleLabel.text = @"本季计划";
        self.mainBgIMV.image = ImageNamed(@"EMWLImageView2");

    }else{
        self.titleLabel.text = @"本年计划";
        self.mainBgIMV.image = ImageNamed(@"EMWLImageView1");

    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)EditBtnClicked:(id)sender {
    if (self.editBtnClickBlcok) {
        self.editBtnClickBlcok();
    }
}
@end
