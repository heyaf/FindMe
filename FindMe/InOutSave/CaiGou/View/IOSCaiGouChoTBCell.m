//
//  IOSCaiGouChoTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSCaiGouChoTBCell.h"
#import "IOSCaiGouChooM.h"

@interface IOSCaiGouChoTBCell()<UITextFieldDelegate>

@end
@implementation IOSCaiGouChoTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.inputTF setBorderStyle:UITextBorderStyleNone];
    self.inputTF.delegate = self;
    self.tfBgView.backgroundColor = RGBA(245, 245, 245, 1);
    self.inputTF.returnKeyType = UIReturnKeyDone;
}
-(void)setCaigouChooseModel:(IOSCaiGouChooM *)CaigouChooseModel{
    _CaigouChooseModel = CaigouChooseModel;
    self.NameLabel.text = CaigouChooseModel.name;
    self.inputTF.placeholder = CaigouChooseModel.holderStr;
    self.inputTF.text = CaigouChooseModel.ChooseStr;
}
//textfield结束编辑
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.textfieldEndBlock&&textField.text.length>0) {
        self.textfieldEndBlock(textField.text);
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.inputTF resignFirstResponder];
    return YES;
}
-(void)resignTFFirstResponder{
    [self.inputTF resignFirstResponder];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
