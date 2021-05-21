//
//  IOSInStoreListTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSInStoreListTBCell.h"

@implementation IOSInStoreListTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = RGBA(245, 245, 245, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
