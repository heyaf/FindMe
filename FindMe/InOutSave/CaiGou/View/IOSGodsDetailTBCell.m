//
//  IOSGodsDetailTBCell.m
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import "IOSGodsDetailTBCell.h"

@implementation IOSGodsDetailTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.EditPriceButton.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 26);
    self.unaddrButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    self.addButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setGodsListType:(NSInteger)godsListType{
    if (godsListType==1) {
        
    }else if (godsListType==2){
        self.EditPriceButton.hidden = YES;
        self.godsnumBgView.hidden = YES;
        
        
    }else if (godsListType==3){
        self.EditPriceButton.hidden = YES;
        
    }
}

- (IBAction)unAddButtonClicked:(id)sender {
}
- (IBAction)editPriceButtonClicked:(id)sender {
}

- (IBAction)addButtonClicked:(id)sender {
}
@end
