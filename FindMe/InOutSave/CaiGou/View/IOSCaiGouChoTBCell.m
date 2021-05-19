//
//  IOSCaiGouChoTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSCaiGouChoTBCell.h"
#import "IOSCaiGouChooM.h"

@implementation IOSCaiGouChoTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.inputTF setBorderStyle:UITextBorderStyleNone];
}
-(void)setCaigouChooseModel:(IOSCaiGouChooM *)CaigouChooseModel{
    _CaigouChooseModel = CaigouChooseModel;
    self.NameLabel.text = CaigouChooseModel.name;
    self.inputTF.placeholder = CaigouChooseModel.holderStr;
    self.inputTF.text = CaigouChooseModel.ChooseStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
