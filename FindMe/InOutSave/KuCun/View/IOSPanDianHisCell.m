//
//  IOSPanDianHisCell.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianHisCell.h"

@implementation IOSPanDianHisCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.mainBgView.backgroundColor = RGBA(250, 250, 250, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
