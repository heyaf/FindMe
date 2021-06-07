//
//  FMTBHeaderView.m
//  FindMe
//
//  Created by mac on 2021/6/7.
//

#import "FMTBHeaderView.h"

@implementation FMTBHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = knorBlackColor;
        
        [self addSubViews];
    }
    return self;
}
-(void)addSubViews{
    
    UIView *bgVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, self.width)];
    bgVIew.backgroundColor = kWhiteColor;
    [self addSubview:bgVIew];
    CGFloat radius = 15; // 圆角大小
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerTopRight; // 圆角位置
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.width, self.height) byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, self.width, self.height);
    maskLayer.path = path.CGPath;
    bgVIew.layer.mask = maskLayer;
    [self sendSubviewToBack:bgVIew];
    
    
    UIImageView *leftImageV = [[UIImageView alloc] initWithFrame:CGRectMake(KDeviceWith/2-50-20, 19, 20, 12)];
    leftImageV.image = ImageNamed(@"IOSTuoYuan");
    [self addSubview:leftImageV];
    
    UILabel *titleLabel = [self createLabelFrame:CGRectMake(0, 15, 100, 20) textColor:kBlackColor font:kBOLDFONT(20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    titleLabel.text = @"合同造价";
    titleLabel.centerX = KDeviceWith/2;
    UIImageView *rightImageV = [[UIImageView alloc] initWithFrame:CGRectMake(KDeviceWith/2+50, 19, 20, 12)];
    rightImageV.image = ImageNamed(@"IOSTuoYuan1");
    [self addSubview:rightImageV];
    
    
}

@end
