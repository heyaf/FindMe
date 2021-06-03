//
//  HobbyTagView.m
//  xmfish
//
//  Created by xmfish on 15/10/27.
//  Copyright © 2015年 小鱼网. All rights reserved.
//

#import "HobbyTagView.h"


@interface PositonUIButton : UIButton

@property (assign,nonatomic) int row;
@property (assign,nonatomic) int column;
@property (assign,nonatomic) BOOL isShowMore;
-(void)show;
@end

@implementation PositonUIButton
-(void)show
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x+frame.size.width, frame.origin.y+frame.size.height, 0, 0);
    [UIView animateKeyframesWithDuration:0.4 delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        self.frame = frame;
    } completion:nil];
}
@end
CGFloat BtnWidth = 100.0;
CGFloat BtnHeight = 40.0;
CGFloat XOrigin = 80.0;
CGFloat YOrigin = 100.0;
@implementation HobbyTagView
{
    UIScrollView* _scrollView;
    NSMutableArray* _btnArr;
    NSArray* titleArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame withData:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selelctedArr = [NSMutableArray arrayWithCapacity:0];
        _btnArr = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        titleArr = arr;
        XOrigin = (([[UIScreen mainScreen] bounds].size.width)-3*(BtnWidth))/2.0+20;
        [self initView];
        [self setButton];
        
        
    }
    return self;
}

-(void)setBtn:(UIButton*)button
{
    [self setButton];
}
-(void)setButton
{

    NSArray* xOffSetArr = [NSArray arrayWithObjects:@1,@3,@0,@2,@4, nil];
    
    for (int i=0; i<titleArr.count; i++) {
        PositonUIButton* btn = [self buttonWithData:titleArr[i]];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        btn.isShowMore = NO;
        int row = i/5;
        int col = i%5;
        
        row = row*2;
        row = row + (col<2?0:1);
        
        int xOffset = [(NSNumber*)xOffSetArr[col] intValue];
        
        btn.center = CGPointMake(xOffset*50+XOrigin, row*40+YOrigin);
        
        btn.row = row;
        switch (col) {
            case 0:
                btn.column = 0;
                break;
            case 1:
                btn.column = 1;
                break;
            case 2:
                btn.column = 0;
                break;
            case 3:
                btn.column = 1;
                break;
            case 4:
                btn.column = 2;
                break;
                
            default:
                break;
        }
        
        if(_btnArr.count > row)
        {
            NSMutableArray* array = [_btnArr objectAtIndex:row];
            [array addObject:btn];
        }
        else
        {
            NSMutableArray* array = [[NSMutableArray alloc] init];
            [array addObject:btn];
            [_btnArr addObject:array];
        }
        [_scrollView addSubview:btn];
    }

}
-(void)initView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [_scrollView setContentSize:_scrollView.bounds.size];
    _scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_scrollView];
    
    _btnArr = [[NSMutableArray alloc] init];
    
}

-(void)addLeftBtn:(PositonUIButton*)button
{
    if (!button)
    {
        return;
    }
    int row = button.row;
    int column = button.column;
    BOOL shouldReSet = NO;
    CGRect frame = button.frame;
    frame.origin.x -= (BtnWidth+20);
    
    PositonUIButton* btn = [self buttonWithData:nil];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = btn.tag+1;
    btn.row = button.row;
    
    for (PositonUIButton* btn in [_btnArr objectAtIndex:row])
    {
        if (btn.column < column)
        {
            CGRect tempFrame = btn.frame;
            tempFrame.origin.x -= (BtnWidth+20);
            
            btn.frame = tempFrame;
            if (tempFrame.origin.x < 0)
            {
                shouldReSet = YES;
            }
        }
        
    }
    
    if (frame.origin.x < 0 || shouldReSet)
    {
        
        CGSize size = _scrollView.contentSize;
        size.width += (BtnWidth+20);
        _scrollView.contentSize = size;
        for (NSMutableArray* arr in _btnArr)
        {
            for (PositonUIButton* btn in arr)
            {
                CGRect tempFrame = btn.frame;
                tempFrame.origin.x += (BtnWidth+20);
                btn.frame = tempFrame;
            }
        }
        
        
    }
    
    frame = button.frame;
    frame.origin.x -= (BtnWidth+20);
    btn.frame = frame;
    for (PositonUIButton* button in [_btnArr objectAtIndex:row])
    {
        if (button.column >= column)
        {
            button.column++;
        }
    }
    btn.column = column;
    NSMutableArray* array = [_btnArr objectAtIndex:row];
    [array addObject:btn];
    [_scrollView addSubview:btn];
    [btn show];
}
-(void)addRight:(PositonUIButton*)button
{
    if (!button)
    {
        return;
    }
    int row = button.row;
    int column = button.column;
    BOOL shouldReSet = NO;
    CGRect frame = button.frame;
    frame.origin.x += (BtnWidth+20);
    
    PositonUIButton* btn = [self buttonWithData:nil];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = btn.tag+1;
    btn.row = button.row;
    
    for (PositonUIButton* btn in [_btnArr objectAtIndex:row])
    {
        if (btn.column > column)
        {
            CGRect tempFrame = btn.frame;
            tempFrame.origin.x += (BtnWidth+20);
            
            btn.frame = tempFrame;
            if (tempFrame.origin.x+BtnWidth > _scrollView.contentSize.width)
            {
                shouldReSet = YES;
            }
        }
        
    }
    
    if (frame.origin.x+BtnWidth > _scrollView.contentSize.width || shouldReSet)
    {
        
        CGSize size = _scrollView.contentSize;
        size.width += (BtnWidth+20);
        _scrollView.contentSize = size;
        
    }
    
    frame = button.frame;
    frame.origin.x += (BtnWidth+20);
    btn.frame = frame;
    for (PositonUIButton* button in [_btnArr objectAtIndex:row])
    {
        if (button.column > column)
        {
            button.column++;
        }
    }
    btn.column = column+1;
    NSMutableArray* array = [_btnArr objectAtIndex:row];
    [array addObject:btn];
    [_scrollView addSubview:btn];
    [btn show];
}
-(void)addTopBtn:(PositonUIButton*)button withType:(int)type
{
    int row = button.row;
    row--;
    if (row < 0)
    {
        [self addBottomBtn:button withType:2];
        return;
    }
    PositonUIButton* resultBtn = nil;
    for (PositonUIButton* btn in [_btnArr objectAtIndex:row])
    {
        
        if (btn.frame.origin.x > button.frame.origin.x)
        {
            resultBtn = btn;
            break;
        }
    }
    if (!resultBtn)
    {
        resultBtn = [[_btnArr objectAtIndex:row] lastObject];
    }
    if (type == 1)
    {
        [self addLeftBtn:resultBtn];
    }
    else
    {
        [self addRight:resultBtn];
    }
    
}
-(void)addBottomBtn:(PositonUIButton*)button withType:(int)type
{
    int row = button.row;
    row++;
    if (row >= _btnArr.count)
    {
        [self addTopBtn:button withType:2];
        return;
    }
    PositonUIButton* resultBtn = nil;
    for (PositonUIButton* btn in [_btnArr objectAtIndex:row])
    {
        
        if (btn.frame.origin.x > button.frame.origin.x)
        {
            resultBtn = btn;
            break;
        }
    }
    if (!resultBtn)
    {
        resultBtn = [[_btnArr objectAtIndex:row] lastObject];
    }
    if (type == 1)
    {
        [self addLeftBtn:resultBtn];
    }
    else
    {
        [self addRight:resultBtn];
    }
}
-(void)btnClick:(PositonUIButton*)button
{

    if (!button.selected)
    {
        [button setSelected:YES];
        button.backgroundColor = [UIColor colorWithCGColor:button.layer.borderColor] ;
    }
    else
    {
        [button setSelected:NO];
        button.backgroundColor = [UIColor whiteColor];
    }
    
}

-(PositonUIButton*)buttonWithData:(NSString *)btnStr
{
    PositonUIButton* button = [PositonUIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, BtnWidth, BtnHeight);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 15.0;
    button.layer.borderWidth = 1.0;
    button.selected = NO;
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.minimumScaleFactor = 0.8;
    [button.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
    
    [button setTintColor:[UIColor purpleColor]];
    
    UIColor* color = [UIColor purpleColor];
    int colorV = arc4random()%4;
    if (colorV==0) {
        color = [UIColor brownColor];
    }else if (colorV==1){
        color = [UIColor blueColor];
    }else if (colorV==2){
        color = [UIColor orangeColor];
    }else if (colorV==3)
    {
        color = [UIColor purpleColor];
    }
    [button setTitle:btnStr forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    button.layer.borderColor = [color CGColor];
    return button;
}
@end
