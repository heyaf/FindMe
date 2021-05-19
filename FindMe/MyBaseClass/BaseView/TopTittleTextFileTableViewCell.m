//
//  HTextFileTableViewCell.m
//  Textfield
//
//  Created by 郑州聚义 on 2018/10/9.
//  Copyright © 2018年 朱同海. All rights reserved.
//

#import "TopTittleTextFileTableViewCell.h"
#import "UITextField+IndexPath.h"

@implementation TopTittleTextFileTableViewCell

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
    if ([string containsString:@"*"]) {
        self.titleLabel.attributedText = [self recombinePrice:@"*" twoPrice:[string substringFromIndex:1]];
    }else {
        self.titleLabel.text = string;

    }
}

- (NSAttributedString *)recombinePrice:(NSString *)onestr  twoPrice:(NSString *)twostr
{
    NSMutableAttributedString *mutableAttributeStr = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",onestr] attributes:@{NSForegroundColorAttributeName : [UIColor redColor], NSFontAttributeName : [UIFont systemFontOfSize:16]}];
    
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",twostr] attributes:@{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:15]}];
    
    [mutableAttributeStr appendAttributedString:string1];
    [mutableAttributeStr appendAttributedString:string2];
    return mutableAttributeStr;
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



- (IBAction)shanchuaction:(id)sender {
    if (_loadshanchu) {
        _loadshanchu(self);
    }
}


@end
