//
//  FMPaixuView.m
//  FindMe
//
//  Created by mac on 2021/6/7.
//

#import "FMPaixuView.h"
#import "HYRankView.h"

@interface FMPaixuView ()
@property (weak,nonatomic) HYRankView *view1;
@property (weak,nonatomic) HYRankView *view2;
@property (nonatomic,strong) UILabel *pricelabel;
@end
@implementation FMPaixuView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubViews];
    }
    return self;
}
-(void)addSubViews{
    HYRankView *view1 = [HYRankView viewWithTitle:@"价格排序" frame:CGRectMake(10,0,100,40)];
    view1.textFont = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
    view1.triangleW = 10;
    view1.selectColor = [UIColor whiteColor];
    view1.unselectColor = [UIColor grayColor];
    view1.backgroundColor = [UIColor clearColor];
    [view1 addTarget:self action:@selector(clickPriceCount:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:view1];
    self.view1 = view1;
    
    HYRankView *view2 = [HYRankView viewWithTitle:@"时间排序" frame:CGRectMake(120,0,100,40)];
    view2.textFont = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
    view2.triangleW = 10;
    view2.selectColor = [UIColor whiteColor];
    view2.unselectColor = [UIColor grayColor];
    view2.backgroundColor = [UIColor clearColor];
    [view2 addTarget:self action:@selector(clickSaleCount:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:view2];
    self.view2 = view2;
    
    
    self.pricelabel = [self createLabelFrame:CGRectMake(KDeviceWith-10-150, 10, 150, 20) textColor:FMTextColor font:FONT(16)];
    self.pricelabel.textAlignment = NSTextAlignmentRight;
    self.pricelabel.text = @"123个";
    
}
-(void)clickPriceCount:(HYRankView*)sender{
    [sender makeOpposite];
    self.view2.type = HYRankTypeNone;
    sender.textFont = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    self.view2.textFont = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];

}
-(void)clickSaleCount:(HYRankView*)sender{
    [sender makeOpposite];
    self.view1.type = HYRankTypeNone;
    sender.textFont = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    self.view1.textFont = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];

}
@end
