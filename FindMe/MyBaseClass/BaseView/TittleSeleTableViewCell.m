//
//  MyChongZhiTableViewCell.m
//  MeetAward
//
//  Created by 郑州聚义 on 16/11/14.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "TittleSeleTableViewCell.h"
#import "TittleDetailModel.h"
#import "UIImageView+WebCache.h"

@implementation TittleSeleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showData:(TittleDetailModel *)model {

    self.nameLabel.text = [NSString stringWithFormat:@"%@", model.tittle];
    self.mySelectbnt.selected = model.isSelect;

}

- (IBAction)myButtonClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.block != nil) {
        self.block(sender.selected);
    }
    
    if (_buttonAction) {
        _buttonAction(self);
    }
}

-(void)upDataWithFriendName:(NSString *)friendName andIsselected:(BOOL) isSelect
{
    self.nameLabel.text = [NSString stringWithFormat:@"%@", friendName];
    
    self.mySelectbnt.selected = isSelect;

}

-(void)updateWithSelectSatic:(NSString *)isSle
{
    if ([isSle isEqualToString:@"0"]) {
        self.mySelectbnt.selected = NO;
    } else {
        self.mySelectbnt.selected = YES;
    }
    
}


@end
