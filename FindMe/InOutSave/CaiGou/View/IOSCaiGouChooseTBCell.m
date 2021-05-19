//
//  IOSCaiGouChooseTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSCaiGouChooseTBCell.h"
#import "IOSCaiGouChooM.h"
@implementation IOSCaiGouChooseTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.inputTF setBorderStyle:UITextBorderStyleNone];
}
-(void)setCaigouChooseModel:(IOSCaiGouChooM *)CaigouChooseModel{
    _CaigouChooseModel = CaigouChooseModel;
    self.TitleName.text = CaigouChooseModel.name;
    self.inputTF.placeholder = CaigouChooseModel.holderStr;
    self.inputTF.text = CaigouChooseModel.ChooseStr;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
