//
//  IOSMessageAlertView.m
//  SXAlertView
//
//  Created by mac on 2021/5/21.
//  Copyright © 2021 Coder Shoryon. All rights reserved.
//
#import "CYCustomArcImageView.h"
#import "IOSMessageAlertView.h"
@interface IOSMessageAlertView()

@property (nonatomic,strong) UILabel *titLabel;

@property (nonatomic,strong) UIButton *btnOne;

@property (nonatomic,strong) UIButton *btnTwo;

@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) UITextView *textView;


@property (nonatomic,strong) CYCustomArcImageView *bgView;

@end

@implementation IOSMessageAlertView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupStyle];
        [self setupContainer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame           type:(IOSMesAlertType)type
                     titleStr:(NSAttributedString *) titleStr cancleBtnName:(NSString *)cancleBtnName sureBtnName:(NSString *)sureBtnName DetailBtnName:(NSString *)DeatilName{
    self = [super initWithFrame:frame];
    if (self) {
        self.alertType = type;
        self.titleAttriStr = titleStr;
        self.cancleBtnName = cancleBtnName;
        self.sureBtnName = sureBtnName;
        self.detailStr = DeatilName;
        [self setupStyle];
        [self setupContainer];
    }
    return self;
}
#pragma mark 初始化弹出框

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupStyle];
        [self setupContainer];
    }
    return self;
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

-(void)setupContainer{
    CGFloat alertW = KDeviceWith-160;
    CGFloat alertH = alertW-40;
    if (self.alertType ==IOSMesAlertTypeChoose) {
        alertH = alertW-100;
    }else if(self.alertType == IOSMesAlertTypeTF){
        alertH = alertW-60;
    }
    
    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(0, 0, alertW, alertH)];
    bgView.center = self.center;
    bgView.image = [UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(alertW, alertH)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    bgView.backgroundColor = [UIColor whiteColor];
    self.bgView = bgView;
    [self addSubview:bgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, alertW-20, 20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.attributedText = self.titleAttriStr;
    [bgView addSubview:titleLabel];
    self.titLabel = titleLabel;
    
    UIButton *sureBtn = [UIButton buttonWithType:0];
    [sureBtn setBackgroundColor:IOSMainColor];
    [sureBtn setTitle:self.sureBtnName forState:0];
    sureBtn.titleLabel.font = kBOLDFONT(17);
    [sureBtn setTitleColor:[UIColor whiteColor] forState:0];
    [sureBtn addTarget:self action:@selector(sureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.btnTwo = sureBtn;
    
    
    
    [self creatSubUI];
}
-(void)creatSubUI{
    if (self.alertType ==IOSMesAlertTypeMessage) {
        [self creatMessageAlertView];
    }else if (self.alertType ==IOSMesAlertTypeChoose) {
        [self creatChooseAlertView];
    }else if(self.alertType == IOSMesAlertTypeTF){
        [self creatTFAlertView];
    }else if(self.alertType == IOSMesAlertTypeTV){
        [self creatTVAlertView];
    }
}
//提示Alert子视图
-(void)creatMessageAlertView{

    UIImageView *IconImageV = [[UIImageView alloc] initWithFrame:CGRectMake(_bgView.centerX-40, _bgView.y-40, 80, 80)];
    IconImageV.image = ImageNamed(@"IOSAlertSuccess");
    [self addSubview:IconImageV];
    
    self.titLabel.frame = CGRectMake(10, 60, KDeviceWith-180, 20);
    

    UILabel *subLabel = [self.bgView createLabelFrame:CGRectMake(10, 90, self.bgView.yz_width-20, 15) textColor:IOSSubTitleColor font:FONT(14)];
    subLabel.text = self.detailStr;
    subLabel.textAlignment = NSTextAlignmentCenter;
    
    CYCustomArcImageView *btnTwoBgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(40, self.bgView.yz_height-20-60, self.bgView.yz_width-80, 50)];
    btnTwoBgView.borderTopLeftRadius = 10;
    btnTwoBgView.borderTopRightRadius = 20;
    btnTwoBgView.borderBottomLeftRadius = 10;
    btnTwoBgView.borderBottomRightRadius = 10;
    btnTwoBgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:btnTwoBgView];
    
    self.btnTwo.frame = CGRectMake(0, 0, btnTwoBgView.yz_width, btnTwoBgView.yz_height);
    [btnTwoBgView addSubview:self.btnTwo];
    
}
//选择Alert子视图
-(void)creatChooseAlertView{

    self.titLabel.frame = CGRectMake(10, 40, KDeviceWith-180, 20);
    

    CGFloat btnW = (_bgView.yz_width-60)/2;
    
    
    CYCustomArcImageView *btnBgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, self.bgView.yz_height-20-60, btnW, 50)];
    btnBgView.borderTopLeftRadius = 10;
    btnBgView.borderTopRightRadius = 20;
    btnBgView.borderBottomLeftRadius = 10;
    btnBgView.borderBottomRightRadius = 10;
    btnBgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:btnBgView];
    
    UIButton *cancleBtn = [UIButton buttonWithType:0];
    [cancleBtn setBackgroundColor:IOSCancleBtnColor];
    [cancleBtn setTitle:self.cancleBtnName forState:0];
    cancleBtn.titleLabel.font = kBOLDFONT(17);
    [cancleBtn setTitleColor:IOSMainColor forState:0];
    [cancleBtn addTarget:self action:@selector(oneBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.frame = CGRectMake(0, 0, btnBgView.yz_width, btnBgView.yz_height);
    [btnBgView addSubview:cancleBtn];
    
    CYCustomArcImageView *btnTwoBgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(_bgView.yz_width/2+10, self.bgView.yz_height-20-60, btnW, 50)];
    btnTwoBgView.borderTopLeftRadius = 10;
    btnTwoBgView.borderTopRightRadius = 20;
    btnTwoBgView.borderBottomLeftRadius = 10;
    btnTwoBgView.borderBottomRightRadius = 10;
    btnTwoBgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:btnTwoBgView];
    
    self.btnTwo.frame = CGRectMake(0, 0, btnTwoBgView.yz_width, btnTwoBgView.yz_height);
    [btnTwoBgView addSubview:self.btnTwo];
    
}
//输入Alert子视图
-(void)creatTFAlertView{
    self.titLabel.frame = CGRectMake(10, 20, KDeviceWith-180, 20);
    

    [self.bgView addSubview:self.textField];
    self.textField.frame = CGRectMake(self.bgView.yz_width/2-50, 60, 100, 20);
    self.textField.placeholder = @"请输入价格";
    
    [self.bgView createLineFrame:CGRectMake(40, 100, self.bgView.yz_width-80, 1) lineColor:RGBA(245, 245, 245, 1)];
    
    CGFloat btnW = (_bgView.yz_width-60)/2;
    
    
    CYCustomArcImageView *btnBgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, self.bgView.yz_height-20-60, btnW, 50)];
    btnBgView.borderTopLeftRadius = 10;
    btnBgView.borderTopRightRadius = 20;
    btnBgView.borderBottomLeftRadius = 10;
    btnBgView.borderBottomRightRadius = 10;
    btnBgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:btnBgView];
    
    UIButton *cancleBtn = [UIButton buttonWithType:0];
    [cancleBtn setBackgroundColor:IOSCancleBtnColor];
    [cancleBtn setTitle:self.cancleBtnName forState:0];
    cancleBtn.titleLabel.font = kBOLDFONT(17);
    [cancleBtn setTitleColor:IOSMainColor forState:0];
    [cancleBtn addTarget:self action:@selector(oneBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.frame = CGRectMake(0, 0, btnBgView.yz_width, btnBgView.yz_height);
    [btnBgView addSubview:cancleBtn];
    
    CYCustomArcImageView *btnTwoBgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(_bgView.yz_width/2+10, self.bgView.yz_height-20-60, btnW, 50)];
    btnTwoBgView.borderTopLeftRadius = 10;
    btnTwoBgView.borderTopRightRadius = 20;
    btnTwoBgView.borderBottomLeftRadius = 10;
    btnTwoBgView.borderBottomRightRadius = 10;
    btnTwoBgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:btnTwoBgView];
    
    self.btnTwo.frame = CGRectMake(0, 0, btnTwoBgView.yz_width, btnTwoBgView.yz_height);
    [btnTwoBgView addSubview:self.btnTwo];
    
}
//输入TextView子视图
-(void)creatTVAlertView{
    self.titLabel.frame = CGRectMake(10, 20, KDeviceWith-180, 20);
    
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 60, self.bgView.yz_width-40, self.bgView.yz_height-20-60-60-20)];
    [textView setBackgroundColor:[UIColor whiteColor]];
    [self.bgView addSubview:textView];

    // _placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"请输入备注...";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [textView addSubview:placeHolderLabel];//这句很重要不要忘了

    // same font
    textView.font = [UIFont systemFontOfSize:13.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:13.f];

    [textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    self.textView = textView;
    
    CGFloat btnW = (_bgView.yz_width-60)/2;
    
    
    CYCustomArcImageView *btnBgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, self.bgView.yz_height-20-60, btnW, 50)];
    btnBgView.borderTopLeftRadius = 10;
    btnBgView.borderTopRightRadius = 20;
    btnBgView.borderBottomLeftRadius = 10;
    btnBgView.borderBottomRightRadius = 10;
    btnBgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:btnBgView];
    
    UIButton *cancleBtn = [UIButton buttonWithType:0];
    [cancleBtn setBackgroundColor:IOSCancleBtnColor];
    [cancleBtn setTitle:self.cancleBtnName forState:0];
    cancleBtn.titleLabel.font = kBOLDFONT(17);
    [cancleBtn setTitleColor:IOSMainColor forState:0];
    [cancleBtn addTarget:self action:@selector(oneBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.frame = CGRectMake(0, 0, btnBgView.yz_width, btnBgView.yz_height);
    [btnBgView addSubview:cancleBtn];
    
    CYCustomArcImageView *btnTwoBgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(_bgView.yz_width/2+10, self.bgView.yz_height-20-60, btnW, 50)];
    btnTwoBgView.borderTopLeftRadius = 10;
    btnTwoBgView.borderTopRightRadius = 20;
    btnTwoBgView.borderBottomLeftRadius = 10;
    btnTwoBgView.borderBottomRightRadius = 10;
    btnTwoBgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:btnTwoBgView];
    
    self.btnTwo.frame = CGRectMake(0, 0, btnTwoBgView.yz_width, btnTwoBgView.yz_height);
    [btnTwoBgView addSubview:self.btnTwo];
}
//取消按钮点击事件
-(void)oneBtnClicked{
    [self dismiss];
}
//确定按钮点击时间
-(void)sureBtnClicked{
    [self dismiss];
    if (self.alertType ==IOSMesAlertTypeTF) {
        if ([self.delegate respondsToSelector:@selector(makeSureBtnClickWithinputStr:)]) {
            [self.delegate makeSureBtnClickWithinputStr:self.textField.text];
                }
    }else if (self.alertType == IOSMesAlertTypeTV){
        if ([self.delegate respondsToSelector:@selector(makeSureBtnClickWithinputStr:)]) {
            [self.delegate makeSureBtnClickWithinputStr:self.textView.text];
                }
    }

}



-(UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.textAlignment = NSTextAlignmentCenter;
    }
    return _textField;
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
