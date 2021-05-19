//
//  MyChongZhiTableViewCell.m
//  MeetAward
//
//  Created by 郑州聚义 on 16/11/14.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "SeleTittleJianTouTableViewCell.h"
#import "TittleDetailModel.h"
#import "UIImageView+WebCache.h"

@implementation SeleTittleJianTouTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)showData:(TittleDetailModel *)model {

    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@",model.tittle, model.subtittle];
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

-(void)updateWithSelectSatic
{
    NSLog(@"更新选中");
}


@end
