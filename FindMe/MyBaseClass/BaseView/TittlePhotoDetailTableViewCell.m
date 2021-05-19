//
//  TittlePhotoDetailTableViewCell.m
//  XinHuiApp
//
//  Created by 郑州聚义 on 2018/9/28.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import "TittlePhotoDetailTableViewCell.h"
#import "TittleDetailModel.h"

@implementation TittlePhotoDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)showData:(TittleDetailModel *)model {
    self.namelabel.text = [NSString stringWithFormat:@"%@", model.tittle];
    self.detaillabel.text = [NSString stringWithFormat:@"%@", model.detail];
    self.photoview.image = [UIImage imageNamed:model.num];
}

@end
