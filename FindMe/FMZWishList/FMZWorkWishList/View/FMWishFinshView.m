//
//  FMWishFinshView.m
//  FindMe
//
//  Created by mac on 2021/6/3.
//

#import "FMWishFinshView.h"
#import "FMWWishListM.h"

@interface FMWishFinshView()<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) UIButton *makeSureBtn;

@property (nonatomic,strong) UIButton *btnTwo;

@property (nonatomic,strong) UIScrollView *mainScrollView;

@property (nonatomic,strong) UIPageControl *pageControl;
@end
@implementation FMWishFinshView
- (instancetype)initWithFrame:(CGRect)frame
                      DataDic:(NSArray *)DataDic{
    self = [super initWithFrame:frame];
    if (self) {

        self.dataArr = DataDic;
        [self creatSubViews];
        [self setupStyle];
    }
    return self;
}

-(void)creatSubViews{
    
    UIScrollView *scrollVIew = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight)];
    scrollVIew.contentSize = CGSizeMake(KDeviceWith*self.dataArr.count, 10);
    scrollVIew.backgroundColor = [UIColor clearColor];
    scrollVIew.delegate = self;
    [self addSubview:scrollVIew];
    UITapGestureRecognizer *sigleTapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    sigleTapRecognizer.numberOfTapsRequired = 1;
     [scrollVIew addGestureRecognizer:sigleTapRecognizer];
    scrollVIew.pagingEnabled = YES; //使用翻页属性
    scrollVIew.showsHorizontalScrollIndicator = NO;
    scrollVIew.showsVerticalScrollIndicator = NO;
    scrollVIew.bounces = NO;
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(150, 100, 200, 20);
    pageControl.numberOfPages = self.dataArr.count;
    pageControl.pageIndicatorTintColor = RGBA(102, 102, 102, 1);
    pageControl.currentPage = 0;
    self.pageControl = pageControl;
    CGFloat bgH = 350;
    for (int i=0; i<self.dataArr.count; i++) {
        FMWWishListM *wishmodel = self.dataArr[i];
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(i*KDeviceWith+30, 0, KDeviceWith-60, bgH)];
        bgView.centerY = KDeviceHeight/2;
        bgView.backgroundColor = [UIColor whiteColor];
        [bgView setCornerRadius:10];
        [scrollVIew addSubview:bgView];
        
        
        UIImageView *headimageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 200, 150)];
        headimageV.image = ImageNamed(@"FMWWgoLIne");
        
        headimageV.centerX = KDeviceWith*i+KDeviceWith/2;
        headimageV.y = KDeviceHeight/2-bgH/2-100;
        [scrollVIew addSubview:headimageV];
        
        UIImageView *chaimageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 30, 30)];
        chaimageV.image = ImageNamed(@"FMWWcha");
        
        chaimageV.x = KDeviceWith*i+KDeviceWith-80;
        chaimageV.y = KDeviceHeight/2-bgH/2-100;
        [scrollVIew addSubview:chaimageV];
        
        UILabel *titleLabel = [bgView createLabelFrame:CGRectMake(20, 70, KDeviceWith-100, 20) textColor:RGBA(243, 193, 115, 1) font:kFONT(18)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = kStringFormat(@"%@计划",wishmodel.name);
        [bgView addSubview:titleLabel];
        
        CGFloat margin = ((KDeviceWith-60)-50*3)/4;
        UIButton *btn1 = [self buttonWithData:kStringFormat(@"%li",wishmodel.luruNum)];
        btn1.x =margin;
        btn1.y = 95;
        [bgView addSubview:btn1];
        
        UIButton *btn2 = [self buttonWithData:kStringFormat(@"%li",wishmodel.qiandanNum)];
        btn2.x =margin*2+40;
        btn2.y = 95;
        [bgView addSubview:btn2];
        
        UIButton *btn3 = [self buttonWithData:wishmodel.qiandanPrice];
        btn3.x =margin*3+40+40;
        btn3.y = 95;
        [bgView addSubview:btn3];
        
        CGFloat margin2 = ((KDeviceWith-60)-50*2)/3;
        UIButton *btn4 = [self buttonWithData:wishmodel.levleName];
        btn4.x =margin2;
        btn4.y = 195;
        [bgView addSubview:btn4];
        
        UIButton *btn5 = [self buttonWithData:wishmodel.startLevleName];
        btn5.x =margin2*2+40;
        btn5.y = 195;
        [bgView addSubview:btn5];
        
        
        CGFloat marginLabel = (KDeviceWith-60)/3;
        UILabel *label1 = [bgView createLabelFrame:CGRectMake(0, 155, marginLabel, 20) textColor:RGBA(53, 53, 53, 1) font:kFONT(14)];
        label1.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:label1];
        label1.centerX = btn1.centerX;
        label1.text = @"录入量";
        
        UILabel *label2 = [bgView createLabelFrame:CGRectMake(marginLabel, 155, marginLabel, 20) textColor:RGBA(53, 53, 53, 1) font:kFONT(14)];
        label2.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:label2];
        label2.text = @"签单量";
        label2.centerX = btn2.centerX;
        
        UILabel *label3 = [bgView createLabelFrame:CGRectMake(marginLabel*2, 155, marginLabel, 20) textColor:RGBA(53, 53, 53, 1) font:kFONT(14)];
        label3.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:label3];
        label3.text = @"签单金额";
        CGFloat marginLabel2 = (KDeviceWith-60)/2;
        label3.centerX = btn3.centerX;
        
        UILabel *label4 = [bgView createLabelFrame:CGRectMake(0, 255, marginLabel2, 20) textColor:RGBA(53, 53, 53, 1) font:kFONT(14)];
        label4.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:label4];
        label4.text = @"级别";
        label4.centerX = btn4.centerX;
        
        UILabel *label5 = [bgView createLabelFrame:CGRectMake(marginLabel2, 255, marginLabel2, 20) textColor:RGBA(53, 53, 53, 1) font:kFONT(14)];
        label5.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:label5];
        label5.text = @"星级";
        label5.centerX = btn5.centerX;
        
        UIButton *btn = [bgView createButtonFrame:CGRectMake(50, 290, KDeviceWith-60-100, 40) title:@"好的,我会努力的" textColor:[UIColor whiteColor] font:kFONT(16) image:nil target:self method:@selector(dismiss)];
        [btn setBackgroundColor:RGBA(254, 138, 83, 1)];
        [btn setCornerRadius:20];
        
        UIView *line1 = [bgView createLineFrame:CGRectMake(btn1.maxX, btn1.centerY, margin, 1) lineColor:RGBA(245, 245, 245, 1)];
        UIView *line2 = [bgView createLineFrame:CGRectMake(btn2.maxX, btn1.centerY, margin, 1) lineColor:RGBA(245, 245, 245, 1)];
        UIView *line3 = [bgView createLineFrame:CGRectMake(btn4.maxX, btn4.centerY, margin2, 1) lineColor:RGBA(245, 245, 245, 1)];
        [bgView sendSubviewToBack:line1];
        [bgView sendSubviewToBack:line2];
        [bgView sendSubviewToBack:line3];

        if ([wishmodel.wishStatus integerValue]==1) {
            headimageV.image = ImageNamed(@"FMWWGoodDone");
            btn.titleLabel.text = @"我会继续努力的";
        }
        if ([wishmodel.luruStatus isEqualToString:@"1"]) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(15, 35, 20, 20)];
            imageV.image = ImageNamed(@"FMWWRight");
            [btn1 addSubview:imageV];
        }
        if ([wishmodel.qiandanStatus isEqualToString:@"1"]) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(15, 35, 20, 20)];
            imageV.image = ImageNamed(@"FMWWRight");
            [btn2 addSubview:imageV];
        }
        if ([wishmodel.qiandanPriceStatus isEqualToString:@"1"]) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(15, 35, 20, 20)];
            imageV.image = ImageNamed(@"FMWWRight");
            [btn3 addSubview:imageV];
        }
        
        
        
    }
    pageControl.centerX = self.centerX;
    pageControl.centerY = KDeviceHeight/2+bgH/2+40;
    [self addSubview:pageControl];
}
-(UIButton*)buttonWithData:(NSString *)btnStr
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, 50, 50);

    button.selected = NO;
 
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.minimumScaleFactor = 0.8;
    [button.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    
    
    [button setTitle:btnStr forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
   
    [button setBackgroundImage:ImageNamed(@"FMWWbgCircle") forState:0];


    return button;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / KDeviceWith;

    self.pageControl.currentPage = page;
}

/**
 *  初始化SXAlertView样式
 */
- (void)setupStyle {
    
    self.frame = CGRectMake(0, 0,KDeviceWith , KDeviceHeight);
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
     //默认设置背景(弹出框以外区域)可触摸
    
    // 添加弹出框监听事件
    [self addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchDown];
}
/**
 *  触摸遮罩层(弹出框以外的区域)
 */
- (void)touch {
    [self dismiss];

}
/**
 *  销毁面板
 */
- (void)dismiss {
    // 销毁前要执行的代理方法

    [self removeFromSuperview];
}
/**
 *  显示弹出框
 */
- (void)show {
    
    [self showInView:[UIApplication sharedApplication].keyWindow];
}
/**
 *  在指定view上显示弹出框
 */
- (void)showInView:(UIView *)view {
    
    [view addSubview:self];
}

@end
