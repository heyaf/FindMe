//
//  IOSTongjiListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSTongjiListTBCell.h"

@implementation IOSTongjiListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.xinghaoBGView.backgroundColor = RGBA(51, 51, 51, 0.2);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
