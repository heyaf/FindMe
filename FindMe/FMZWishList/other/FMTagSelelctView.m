//
//  FMTagSelelctView.m
//  FindMe
//
//  Created by mac on 2021/6/2.
//

#import "FMTagSelelctView.h"

@implementation FMTagSelelctView
{
    NSMutableArray* _btnArr;
    NSArray* titleArr;
    CGFloat BtnWidth;
    CGFloat BtnHeight;
    CGFloat XMargin ;
    CGFloat YMargin ;
    NSArray *_selectArr;
}
-(id)initWithFrame:(CGRect)frame withData:(NSArray *)arr selelctArr:(NSArray *)selectArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selelctedArr = [NSMutableArray arrayWithCapacity:0];
        [self.selelctedArr addObjectsFromArray:selectArr];
        _selectArr = selectArr;
        BtnWidth = 100.0;
        BtnHeight = 40.0;
        XMargin = 40.0;
        YMargin = 20.0;
        _btnArr = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        titleArr = arr;
        [self initView];
        
        
    }
    return self;
}
-(void)initView{
    YMargin = (self.height-BtnHeight*5)/6;
    for (int i =0; i<titleArr.count; i++) {
        UIButton *btn = [self buttonWithData:titleArr[i]];
        CGFloat x = (self.width-BtnWidth)/2;
        CGFloat y = YMargin;
        switch (i) {
            case 1:
                x=self.width/2-BtnWidth-XMargin/2;
                y=y+YMargin+BtnHeight;
                break;
            case 2:
                x=self.width/2+XMargin/2;
                y=y+YMargin+BtnHeight;
                break;
            case 3:
                x=self.width/2-BtnWidth/2-BtnWidth-XMargin;
                y=y+(YMargin+BtnHeight)*2;
                break;
            case 4:
                y=y+(YMargin+BtnHeight)*2;
                break;
            case 5:
                x=self.width/2+XMargin+BtnWidth/2;
                y=y+(YMargin+BtnHeight)*2;
                break;
            case 6:
                x=self.width/2-BtnWidth-XMargin/2;
                y=y+(YMargin+BtnHeight)*3;
                break;
            case 7:
                x=self.width/2+XMargin/2;
                y=y+(YMargin+BtnHeight)*3;
                break;
            case 8:
                y=y+(YMargin+BtnHeight)*4;
                break;
            
                
            default:
                break;
        }
        
        CGRect frame = CGRectMake(x, y, BtnWidth, BtnHeight);
        btn.frame = frame;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
}
-(UIButton*)buttonWithData:(NSString *)btnStr
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, BtnWidth, BtnHeight);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 15.0;
    button.selected = NO;
    if ([_selectArr containsObject:btnStr]) {
        button.selected = YES;
    }
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.minimumScaleFactor = 0.8;
    [button.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    
//    [button setTintColor:[UIColor purpleColor]];
    

    [button setTitle:btnStr forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithColor:RGBA(233, 233, 233, 1) size:CGSizeMake(BtnWidth, BtnHeight)] forState:0];
    [button setBackgroundImage:[UIImage imageWithColor:IOSMainColor size:CGSizeMake(BtnWidth, BtnHeight)] forState:UIControlStateSelected];

    return button;
}
-(void)btnClick:(UIButton*)button
{
    if (button.selected) {
        [self.selelctedArr removeObject:button.titleLabel.text];
    }else{
        [self.selelctedArr addObject:button.titleLabel.text];
    }
    button.selected = !button.isSelected;

    
}
@end
