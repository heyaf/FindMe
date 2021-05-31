//
//  IOSTongjiMainHView.m
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "IOSTongjiMainHView.h"
#import "BRPickerView.h"
#import "IOSTongJiHeaderView.h"
#define kbtnW ((KDeviceWith-10-60-10-120)/4)
@interface IOSTongjiMainHView()
@property (nonatomic,strong) NSMutableArray *headerButArr;
@property (nonatomic,strong) UIView *cellHeaderView;

@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *titleLabel;
@end
@implementation IOSTongjiMainHView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubViews];
        
    }
    return self;
}

-(void)setSubViews{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.cellHeaderView];
    
    UIButton *pickBtn = [self createButtonFrame:CGRectMake(KDeviceWith-10-60, 10, 60, 24) title:@"" textColor:[UIColor whiteColor] font:kFONT(14) image:ImageNamed(@"IOSrili") target:self method:@selector(selectPickView)];
    [pickBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 18, 0, 18)];
    
    UILabel *dateLabel = [self createLabelFrame:CGRectMake(KDeviceWith-10-40-10-80, 10, 80, 24) textColor:IOSMainColor font:kFONT(12)];
    dateLabel.textAlignment = NSTextAlignmentRight;
    self.dateLabel = dateLabel;
    
    IOSTongJiHeaderView *headView = [[IOSTongJiHeaderView alloc] initWithFrame:CGRectMake(0, 44, KDeviceWith, 100)];
    self.subheadView = headView;
    [self addSubview:headView];
    
    UILabel *titleLabel = [self createLabelFrame:CGRectMake(10, 44+100+10, 100, 20) textColor:[UIColor blackColor] font:kBOLDFONT(16)];
    self.titleLabel = titleLabel;
}
- (void)setTitleArr:(NSArray *)titleArr{
    self.subheadView.titleArr = titleArr;
}
-(void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

-(void)setTitleNumArray:(NSArray *)titleNumArray{
    self.subheadView.titleNumArray = titleNumArray;
}
-(void)selectPickView{
    // 1.创建日期选择器
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDate defaultSelValue:nil minDateStr:nil maxDateStr:nil isAutoSelect:YES resultBlock:^(NSString *selectValue) {
        self.dateLabel.text = selectValue;
        for (UIButton *but in self.headerButArr) {
            [but setTitleColor:IOSTitleColor forState:0];
            [but setBackgroundImage:[UIImage imageWithColor:RGBA(250, 250, 250, 1) size:CGSizeMake(kbtnW, 44)] forState:0];        but.titleLabel.font = kFONT(16);
        }
        if (self.btnClickedBlock) {
            self.btnClickedBlock(selectValue);
        }
    }];
}
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
}
-(UIView *)cellHeaderView{
    if (!_cellHeaderView) {
        _cellHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kbtnW*4+50, 44)];
        _cellHeaderView.backgroundColor = RGBA(245, 245, 245, 1);
        [self addHeaderSubViews];
    }
    return _cellHeaderView;
}
-(void)addHeaderSubViews{
    NSArray *titleArr = @[@"今日",@"昨日",@"近7天",@"近30天"];
    CGFloat locy =10;
    for (int i =0; i<titleArr.count; i++) {
        UIButton *but = [UIButton buttonWithType:0];
        but.frame = CGRectMake(locy, 0, kbtnW, 44);
        [but setTitle:titleArr[i] forState:0];
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:RGBA(255, 255, 255, 1) size:CGSizeMake(kbtnW, 44)] forState:0];
        but.titleLabel.font = kFONT(16);
        if (i==0) {
            [but setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
            [but setTitleColor:[UIColor blackColor] forState:0];
            but.titleLabel.font = FONT(18);
            but.frame = CGRectMake(locy, 0, kbtnW-5, 44);
            locy+=kbtnW-5;
        }else if (i==1){
            but.frame = CGRectMake(locy, 0, kbtnW-5, 44);
            locy+=kbtnW-5;
        }else if (i==2){
            but.frame = CGRectMake(locy, 0, kbtnW+20, 44);
            locy+=kbtnW+20;
        }else if (i==3){
            but.frame = CGRectMake(locy, 0, kbtnW+30, 44);

        }
        
        but.tag = 521+i;
        [but addTarget:self action:@selector(buttonClikced:) forControlEvents:UIControlEventTouchUpInside];
         
        [self.headerButArr addObject:but];
        [self.cellHeaderView addSubview:but];
        
    }
}
-(void)buttonClikced:(UIButton *)button{
    self.dateLabel.text = @"";
    for (UIButton *but in self.headerButArr) {
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:RGBA(255, 255, 255, 1) size:CGSizeMake(kbtnW, 44)] forState:0];        but.titleLabel.font = kFONT(16);
    }
    [button setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    button.titleLabel.font = FONT(18);
    
    NSString *startTimer = [NSString getNowData];
    switch (button.tag) {
        case 521:
            startTimer = [NSString getNowData];
            break;
        case 522:
            startTimer = [NSString getbeforeDataWithindex:1];
            break;
        case 523:
            startTimer = [NSString getbeforeDataWithindex:7];
            break;
        case 524:
            startTimer = [NSString getbeforeDataWithindex:30];
            break;
       
            
        default:
            break;
    }
    if (self.btnClickedBlock) {
        self.btnClickedBlock(startTimer);
    }
    self.dateLabel.text = @"";
}
@end
