//
//  FMaddwishTBcell.m
//  FindMe
//
//  Created by mac on 2021/6/1.
//

#import "FMaddwishTBcell.h"
#import "FMaddWishModel.h"

@implementation FMaddwishTBcell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.textField setBorderStyle:UITextBorderStyleNone];

    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.delegate = self;
    
    CYCustomArcImageView *customerView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith-40, self.mainbgView.height)];
    customerView.backgroundColor = [UIColor whiteColor];
    [self.mainbgView addSubview:customerView];
    customerView.borderTopRightRadius = 20;
    customerView.borderBottomLeftRadius = 10;
    customerView.borderTopLeftRadius = 10;
    customerView.borderBottomRightRadius = 10;
    self.customerView =customerView;
    [self.mainbgView sendSubviewToBack:customerView];

    
    self.backgroundColor = [UIColor clearColor];
    self.mainbgView.backgroundColor = [UIColor clearColor];
    self.mainbgView.layer.shadowColor =[UIColor grayColor].CGColor;
    self.mainbgView.layer.shadowOpacity = 0.4f;
    self.mainbgView.layer.shadowRadius = 4.f;
    self.mainbgView.layer.shadowOffset = CGSizeMake(0,0);
}
-(void)setAddWishModel:(FMaddWishModel *)addWishModel{
    _addWishModel = addWishModel;
    self.textField.placeholder = addWishModel.placeholder;
    self.tagLabel.text = addWishModel.tagStr;
    self.detailLabel.text = addWishModel.detailStr;
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:addWishModel.titleString];
    [attriStr addAttributes: @{NSFontAttributeName:[UIFont fontWithName:@"STHeitiSC-Medium" size:18],NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, addWishModel.titleString.length)];
    [attriStr addAttributes: @{NSFontAttributeName:kFONT(15),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(addWishModel.titleString.length-3, 3)];
    self.nameLabel.attributedText = attriStr;
    
}
-(void)setleavelViewwithtagStr:(NSString *)tagStr{
    self.textField.hidden = YES;
    self.nameLabel.text = @"??????";
    self.tagLabel.text = tagStr;
    
    self.detailLabel.text = @"??????:?????????????????????????????????";
}
-(void)setstartViewwithtagStr:(NSString *)tagStr{
    self.textField.hidden = YES;
    self.nameLabel.text = @"??????";
    self.tagLabel.text = tagStr;
    
    self.detailLabel.text = @"??????:?????????????????????????????????";
}

//textfield????????????
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.textfieldEndBlock) {
        self.textfieldEndBlock(textField.text);
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
