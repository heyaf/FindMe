//
//  IOSGodsDetailView.m
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import "IOSGodsDetailView.h"
#import "IOSGodsListM.h"
#import "IOSGodsDeHeadSubV.h"

@implementation IOSGodsDetailView

- (instancetype)initWithFrame:(CGRect)frame andModel:(IOSGodsListM *)model{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatSubViewsModel:model];
    }
    return self;
}
-(void)creatSubViewsModel:(IOSGodsListM *)model{
    
    UIImageView *headImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, KDeviceWith-20, KDeviceWith-20)];
    headImageV.contentMode = UIViewContentModeScaleAspectFill;
    headImageV.backgroundColor = RGBA(250, 250, 259, 1);
    [headImageV sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,model.img)] placeholderImage:ImageNamed(@"placeholder")];
    [self addSubview:headImageV];
    ViewRadius(headImageV, 10);
    headImageV.clipsToBounds = YES;
    
    UILabel *nameLabel = [self createLabelFrame:CGRectMake(20, headImageV.maxY+20, KDeviceWith-40, 20) textColor:[UIColor blackColor] font:kBOLDFONT(18)];
    nameLabel.text = model.goodsName;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *huohaoLabel = [self createLabelFrame:CGRectMake(20, nameLabel.maxY+10, KDeviceWith-40, 15) textColor:[UIColor blackColor] font:kFONT(16)];
    huohaoLabel.text = kStringFormat(@"货号%@",model.GodsId);
    [huohaoLabel sizeToFit];
    huohaoLabel.height = 16;
    huohaoLabel.centerX= self.centerX-40;
    
    UILabel *huishouLabel = [self createLabelFrame:CGRectMake(20, nameLabel.maxY+10, KDeviceWith-40, 15) textColor:[UIColor grayColor] font:kFONT(14)];
    if (model.isRecycle==1) {
        huishouLabel.text = @" 不可回收 ";
    }else{
        huishouLabel.text = @" 可回收 ";
    }
    [huishouLabel sizeToFit];
    huishouLabel.height = 15;
    huishouLabel.backgroundColor = RGBA(250, 250, 250, 1);
    huishouLabel.x = huohaoLabel.maxX+10;
    ViewRadius(huishouLabel, 7);
    
    UILabel *priceLabel = [self createLabelFrame:CGRectMake(20, huohaoLabel.maxY+20, KDeviceWith-40, 20) textColor:IOSMainColor font:kBOLDFONT(18)];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    NSString *priceStr =kStringFormat(@"￥%.2f",[model.price floatValue]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:18],NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(12)} range:NSMakeRange(0, 1)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14)} range:NSMakeRange(priceStr.length-2, 2)];
    priceLabel.attributedText = attriStr;
    
    IOSGodsDeHeadSubV *subV = [[IOSGodsDeHeadSubV alloc] initWithFrame:CGRectMake(10, priceLabel.maxY+10, KDeviceWith-20, 100)];
    subV.titleArr= @[@"待入库",@"待出库",@"库存量",@"库存预警"];
    NSString *num =kStringFormat(@"%li",model.inStockNum);
    NSString *num1 =kStringFormat(@"%li",model.outStockNum);
    NSString *num2 =kStringFormat(@"%li",model.stockNum);
    NSString *num3 =kStringFormat(@"%li",model.warnNum);

    subV.titleNumArray = @[num,num1,num2,num3];
    [self addSubview:subV];
    
    UILabel *titleLabel = [self createLabelFrame:CGRectMake(10, subV.maxY+10, KDeviceWith-20, 20) textColor:[UIColor blackColor] font:kBOLDFONT(16)];
    titleLabel.text = @"商品参数";
    
    UILabel *pinpaiLabel = [self createLabelFrame:CGRectMake(10, titleLabel.maxY+10, 100, 20) textColor:[UIColor grayColor] font:kFONT(14)];
    pinpaiLabel.text = @"品牌";
    UILabel *danweiLabel = [self createLabelFrame:CGRectMake(10, pinpaiLabel.maxY+10, 100, 20) textColor:[UIColor grayColor] font:kFONT(14)];
    danweiLabel.text = @"单位";
    
    UILabel *pinpaiLabel1 = [self createLabelFrame:CGRectMake(120, titleLabel.maxY+10, KDeviceWith-100-20-10, 20) textColor:[UIColor grayColor] font:kFONT(14)];
    pinpaiLabel1.text = model.brand;
    UILabel *danweiLabel1 = [self createLabelFrame:CGRectMake(120, pinpaiLabel.maxY+10, KDeviceWith-100-20-10, 20) textColor:[UIColor grayColor] font:kFONT(14)];
    danweiLabel1.text = model.unit;
    pinpaiLabel1.textAlignment = NSTextAlignmentRight;
    danweiLabel1.textAlignment = NSTextAlignmentRight;
    
    UILabel *titleLabel1 = [self createLabelFrame:CGRectMake(10, danweiLabel.maxY+10, KDeviceWith-20, 20) textColor:[UIColor blackColor] font:kBOLDFONT(16)];
    titleLabel1.text = @"商品详情";
    self.height = titleLabel1.maxY+10;
}
@end
