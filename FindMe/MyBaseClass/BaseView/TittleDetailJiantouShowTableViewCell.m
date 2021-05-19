//
//  MyChongZhiTableViewCell.m
//  MeetAward
//
//  Created by 郑州聚义 on 16/11/14.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "TittleDetailJiantouShowTableViewCell.h"
#import "TittleDetailModel.h"

@implementation TittleDetailJiantouShowTableViewCell

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
    self.detlabel.text = [NSString stringWithFormat:@"%@", model.detail];

}



@end
