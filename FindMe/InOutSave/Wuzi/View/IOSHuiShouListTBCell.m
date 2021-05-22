//
//  IOSHuiShouListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSHuiShouListTBCell.h"

@implementation IOSHuiShouListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = RGBA(250, 250, 250, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
