//
//  NewQingJiaTableViewCell.m
//  CarTarget
//
//  Created by 郑州聚义 on 2017/12/6.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import "TittleContentTFVTableViewCell.h"
#import "UITextView+IndexPath.h"

@implementation TittleContentTFVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.contenTFV.placeholder = @"请输入...";
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath {
    // 核心代码
    self.contenTFV.indexPath = indexPath;
    self.namelabel.text = string;
    self.contenTFV.text = dataString;
}





@end
