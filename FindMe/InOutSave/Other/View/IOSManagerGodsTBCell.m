//
//  IOSManagerGodsTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "IOSManagerGodsTBCell.h"

@implementation IOSManagerGodsTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.xinghaoBGView.backgroundColor = RGBA(51, 51, 51, 0.2);
    [self.xinghaoBGView setRectCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight CornerRadius:10 borderColor:[UIColor whiteColor] borderWidth:0];

    self.tagLabel.backgroundColor = RGBA(245, 245, 245, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
