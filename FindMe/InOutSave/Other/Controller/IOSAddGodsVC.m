//
//  IOSAddGodsVC.m
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "IOSAddGodsVC.h"
#import "IOSCaiGouChoTBCell.h"
#import "IOSCaiGouChooM.h"
#import "BRPickerView.h"
#import "RadioButton.h"

@interface IOSAddGodsVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSArray *NameArr;
@property (nonatomic,strong) NSArray *holderArr;
@property (nonatomic,strong) NSMutableArray *choosedArr; //选择商品的数组

@property (nonatomic,strong) UIImageView *addImageView;
@property (nonatomic,strong) NSString *selectedPinPaiStr; //已经选择的品牌
@property (nonatomic,strong) NSString *selectedDanWeiStr; //已经选择的单位

@end

@implementation IOSAddGodsVC
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(NSMutableArray *)choosedArr{
    if (!_choosedArr) {
        _choosedArr = [NSMutableArray array];
    }
    return _choosedArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavbutton];
    [self initialData];

    [self CreatMainUI];
    [self creatBottomView];
}
-(void)initialData{
    self.NameArr =@[@"商品名称",@"商品所属",@"商品图片",@"商品详情",@"商品价(元)",@"初始库存量",@"库存预警",@"是否可回收",@"参数"];
    self.holderArr = @[@"请输入商品名称",@"",@"",@"点击添加商品详情",@"请输入商品价",@"请输入初始库存量",@"请输入库存预警",@"",@""];
    for (int i=0; i<self.NameArr.count; i++) {
        IOSCaiGouChooM *chooseM = [[IOSCaiGouChooM alloc] init];
        chooseM.name = self.NameArr[i];
        chooseM.holderStr = self.holderArr[i];
        chooseM.canInput = YES;
        if (i==3) {
            chooseM.canInput = NO;
        }
        
        [self.dataArr addObject:chooseM];
        
    }
    
}
//主视图
-(void)CreatMainUI{
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-100;

    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSCaiGouChoTBCell" bundle:nil] forCellReuseIdentifier:@"IOSCaiGouChoTBCell"];
    
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"新增商品" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-100-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 100+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = RGBA(250, 250, 250, 1);

    [self.view addSubview:bottomView];

    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, 10, KDeviceWith-40, 60)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, KDeviceWith-40, 60);
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark ---点击事件----
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)makeSureBtnClicked{
    
}
#pragma mark ---delegate----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return self.NameArr.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        case 3:
        case 4:
        case 5:
        case 6:
            return 110;
        case 1:
        case 7:
            return 70;
        case 8:
            return 160;
        case 2:
            return 120;
        default:
            break;
    }
    return 110;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSCaiGouChooM *caigouModel = self.dataArr[indexPath.row];
    if (indexPath.row==0||indexPath.row==3||indexPath.row==4||indexPath.row==5||indexPath.row==6) {
        IOSCaiGouChoTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSCaiGouChoTBCell"];
        __weak typeof(tableView) weaktableView = tableView;
        cell.textfieldEndBlock = ^(NSString * _Nonnull textFieldStr) {
            [self.choosedArr replaceObjectAtIndex:indexPath.row withObject:textFieldStr];
            [weaktableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            
        };
        cell.CaigouChooseModel = caigouModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.inputTF.userInteractionEnabled = caigouModel.canInput;
        if (caigouModel.canInput) {
            cell.rightArrowImageV.hidden = YES;
        }else{
            cell.rightArrowImageV.hidden = NO;
        }

        return cell;
    }
    static NSString *cellID = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.contentView removeAllSubviews];
    UILabel *titleLabel = [cell.contentView createLabelFrame:CGRectMake(10, 10, 100, 20) textColor:[UIColor blackColor] font:kBOLDFONT(16)];
    titleLabel.text = caigouModel.name;
    if (indexPath.row==1) {
        [self creatSingleButtonWithView:cell.contentView];
    }else if (indexPath.row==2){
        [self creatAddImageViewWithView:cell.contentView];
    }else if (indexPath.row==7){
        [self creatChooseDoubleButtonWithView:cell.contentView];
    }else if (indexPath.row==8){
        [self creatBottomChooseDoubleView:cell.contentView];
    }
    return cell;

        

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1) {
        return;
    }
    
}
-(void)creatChooseDoubleButtonWithView:(UIView *)cellView{
    NSMutableArray* buttonsArray = [NSMutableArray arrayWithCapacity:3];
    CGRect btnRect = CGRectMake(10, 40, 50, 20);
    NSArray *NameArr = @[@"是", @"否"];
    for (int i=0;i<NameArr.count;i++) {
        NSString* optionTitle = NameArr[i];
        RadioButton* btn = [[RadioButton alloc] initWithFrame:btnRect];
        [btn addTarget:self action:@selector(onRadioButtonValueChanged1:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.x =100;
        btn.tag = 500+i;
        [btn setTitle:optionTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [btn setImage:[UIImage imageNamed:@"iOSUnChooseIcon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"IOSChoosedIcon"] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
        [cellView addSubview:btn];
        [buttonsArray addObject:btn];
    }
    
    [buttonsArray[0] setGroupButtons:buttonsArray]; // 把按钮放进群组中
    
    [buttonsArray[0] setSelected:YES]; // 初始化第一个按钮为选中状态
}
-(void)creatSingleButtonWithView:(UIView *)cellView{

    NSString* optionTitle = @"员工端";
    UIButton* btn = [UIButton buttonWithType:0];
    btn.frame = CGRectMake(15, 40, 80, 20);

    [btn setTitle:optionTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [btn setImage:[UIImage imageNamed:@"IOSChoosedIcon"] forState:UIControlStateNormal];

    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 60);

    [cellView addSubview:btn];
    
}
-(void)creatAddImageViewWithView:(UIView *)cellView{
    UIImageView *addImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 80, 80)];
    addImageV.image = ImageNamed(@"IOSAddImageBg");
    addImageV.contentMode = UIViewContentModeScaleAspectFill;
    addImageV.userInteractionEnabled = YES;
    [cellView addSubview:addImageV];
    
    UIButton *addBtn  = [UIButton buttonWithType:0];
    addBtn.frame = CGRectMake(0, 0, addImageV.yz_width,addImageV.yz_height );
    [addBtn addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    [addImageV addSubview:addBtn];
    
}
-(void)creatBottomChooseDoubleView:(UIView *)cellView{
    UILabel *pinpaiLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 40, 50)];
    pinpaiLabel.text = @"品牌";
    [cellView addSubview:pinpaiLabel];
    pinpaiLabel.textAlignment = NSTextAlignmentCenter;
    pinpaiLabel.font = kFONT(16);
    
    UIButton *pinpaiBtn =[cellView createButtonFrame:CGRectMake(60, 40, KDeviceWith-70, 50) title:@"" textColor:[UIColor clearColor] font:FONT(14) image:ImageNamed(@"IOSArrow_right") target:self method:@selector(pinpaiButtonClicked)];
    UILabel *pinpaiDlabel = [pinpaiBtn createLabelFrame:CGRectMake(10, 15, 80, 20) textColor:[UIColor lightGrayColor] font:FONT(14)];
    pinpaiDlabel.text = @"请选择品牌";
    if (self.selectedDanWeiStr.length>0) {
        pinpaiDlabel.text = self.selectedDanWeiStr;
        pinpaiDlabel.textColor = [UIColor blackColor];
    }
    [pinpaiBtn setTitleEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 40)];
    [pinpaiBtn setImageEdgeInsets:UIEdgeInsetsMake(16, KDeviceWith-70-10-10-12, 16, 10)];
    pinpaiBtn.backgroundColor = RGBA(245, 245, 245, 1);
    ViewRadius(pinpaiBtn, 10);
    
    UILabel *danweiLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 40, 50)];
    danweiLabel.text = @"单位";
    [cellView addSubview:danweiLabel];
    danweiLabel.textAlignment = NSTextAlignmentCenter;
    danweiLabel.font = kFONT(16);
    
    UIButton *danweiBtn =[cellView createButtonFrame:CGRectMake(60, 100, KDeviceWith-70, 50) title:@"" textColor:[UIColor clearColor] font:FONT(14) image:ImageNamed(@"IOSArrow_right") target:self method:@selector(danweiButtonClicked)];
    UILabel *danweiDLabel = [danweiBtn createLabelFrame:CGRectMake(10, 15, 80, 20) textColor:[UIColor lightGrayColor] font:FONT(14)];
    danweiDLabel.text = @"请选择单位";
    if (self.selectedDanWeiStr.length>0) {
        danweiDLabel.text = self.selectedDanWeiStr;
        danweiDLabel.textColor = [UIColor blackColor];

    }
    [danweiBtn setTitleEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 40)];
    [danweiBtn setImageEdgeInsets:UIEdgeInsetsMake(16, KDeviceWith-70-10-10-12, 16, 10)];
    danweiBtn.backgroundColor = RGBA(245, 245, 245, 1);
    ViewRadius(danweiBtn, 10);
}
#pragma mark ---单选按钮---
- (void)onRadioButtonValueChanged1:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    if (btn.tag ==500) {
    }else{
    }
}
//添加图片
-(void)addImage{
    
}
//品牌按钮点击
-(void)pinpaiButtonClicked{
    
}
//单位按钮点击
-(void)danweiButtonClicked{
    
}
@end
