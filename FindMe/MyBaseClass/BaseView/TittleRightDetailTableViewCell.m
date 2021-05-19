//
//  TittleRightDetailTableViewCell.m
//  XinHuiApp
//
//  Created by 郑州聚义 on 2018/10/13.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import "TittleRightDetailTableViewCell.h"
#import "TittleDetailModel.h"

@implementation TittleRightDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showData:(TittleDetailModel *)model {
    self.tittlelabel.text = [NSString stringWithFormat:@"%@", model.tittle];
    self.detaillabel.text = [NSString stringWithFormat:@"%@", model.detail];

}

-(void)showOrdreData:(TittleDetailModel *)model {
    self.tittlelabel.text = [NSString stringWithFormat:@"%@", model.tittle];
     self.detaillabel.text = [NSString stringWithFormat:@"%@", model.detail];

}


@end
