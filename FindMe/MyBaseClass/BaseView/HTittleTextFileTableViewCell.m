//
//  HTextFileTableViewCell.m
//  Textfield
//
//  Created by 郑州聚义 on 2018/10/9.
//  Copyright © 2018年 朱同海. All rights reserved.
//

#import "HTittleTextFileTableViewCell.h"
#import "UITextField+IndexPath.h"

@implementation HTittleTextFileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString withThePlacehold:(NSString *)plocd andIndexPath:(NSIndexPath *)indexPath {
    // 核心代码
    self.textField.indexPath = indexPath;
    self.textField.text = [NSString stringWithFormat:@"%@", dataString];
    self.textField.placeholder = plocd;
    self.titleLabel.text = string;
    self.detalabel.text = [NSString stringWithFormat:@"%@", dataString];
}

//无占位符
- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath {
    // 核心代码
    self.textField.indexPath = indexPath;
    self.textField.text = dataString;
    self.titleLabel.text = string;
}


- (void)setZhangHuTitleString:(NSString *)string andDataString:(NSString *)dataString withThePlacehold:(NSString *)plocd andIndexPath:(NSIndexPath *)indexPath {

    // 核心代码
    self.textField.indexPath = indexPath;
    self.textField.text = dataString;
    self.textField.placeholder = plocd;
    self.titleLabel.text = string;
}





@end
