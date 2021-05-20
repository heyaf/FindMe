//
//  IOSGodsHisTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import "IOSGodsHisTBCell.h"

@implementation IOSGodsHisTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = RGBA(250, 250, 250, 1);
    self.userHeaderImageView.contentMode = UIViewContentModeScaleAspectFill;
    CYCustomArcImageView *tagbgview = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-10-15-50, 20, 50, 20)];
    tagbgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:tagbgview];
    tagbgview.borderTopLeftRadius = 5;
    tagbgview.borderBottomLeftRadius = 5;
    tagbgview.borderTopRightRadius = 10;
    tagbgview.borderWidth = 1;
    tagbgview.Colortype =1;
    self.tagbgview = tagbgview;
    
    self.taglabel = [tagbgview createLabelFrame:CGRectMake(0, 0, 50, 20) textColor:[UIColor grayColor] font:FONT(14)];
    self.taglabel.textAlignment = NSTextAlignmentCenter;
    
}
-(void)setHisModel:(IOSGodsHisModel *)hisModel{
    _hisModel = hisModel;
    NSInteger inte = arc4random() / 2;
//    if (inte==1) {
//        self.tagbgview.Colortype = 1;
//        self.taglabel.text = @"采购中";
//        self.taglabel.textColor = IOSMainColor;
//    }else{
        self.tagbgview.Colortype = 2;
        self.taglabel.text = @"已完成";
        self.taglabel.textColor = [UIColor grayColor];
//    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
