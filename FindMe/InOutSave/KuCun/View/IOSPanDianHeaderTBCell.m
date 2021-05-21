//
//  IOSPanDianHeaderTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianHeaderTBCell.h"

@implementation IOSPanDianHeaderTBCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.startButton setTitleColor:IOSMainColor forState:0];
    self.startButton.layer.masksToBounds = YES;
    self.startButton.layer.borderColor = IOSMainColor.CGColor;
    self.startButton.layer.borderWidth = 1;
    self.startButton.layer.cornerRadius = 12.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)startButtonClicked:(id)sender {
}
@end
