//
//  IOSTongJiHeaderView.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSTongJiHeaderView.h"
@interface IOSTongJiHeaderView()

@end

@implementation IOSTongJiHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubViews];
    }
    return self;
}

-(void)setSubViews{
    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(10, 10, self.yz_width-20 , self.yz_height-20)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 10;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 30;
    bgView.backgroundColor = IOSMainColor;
    [self addSubview:bgView];
}
-(void)setTitleArr:(NSArray *)titleArr{
    _titleArr = titleArr;
    
    for (UIView *subView in self.subviews) {
        if (subView.tag>800&&subView.tag<900) {
            [subView removeFromSuperview];
        }
    }
    CGFloat w =(self.yz_width-20)/titleArr.count;
    for (int i =0; i<titleArr.count; i++) {
        UILabel *titleLabel = [self createLabelFrame:CGRectMake(10+i*w, self.yz_height-15-17-12, w, 17) textColor:[UIColor whiteColor] font:kFONT(14)];
        titleLabel.text = titleArr[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.tag = 888+i;
    }
}
-(void)setTitleNumArray:(NSArray *)titleNumArray{
    _titleNumArray = titleNumArray;
    for (UIView *subView in self.subviews) {
        if (subView.tag>900&&subView.tag<910) {
            [subView removeFromSuperview];
        }
    }
    CGFloat w =(self.yz_width-20)/titleNumArray.count;
    for (int i =0; i<titleNumArray.count; i++) {
        UILabel *titleLabel = [self createLabelFrame:CGRectMake(10+i*w, 28, w, 17) textColor:[UIColor whiteColor] font:kBOLDFONT(16)];
        titleLabel.text = titleNumArray[i];
        if (i==(titleNumArray.count-1) ) {
            self.lastLabel = titleLabel;
        }
        titleLabel.textAlignment = NSTextAlignmentCenter;

        titleLabel.tag = 901+i;
    }
}
@end
