//
//  IOSCaiGouChoTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import <UIKit/UIKit.h>
@class IOSCaiGouChooM;

NS_ASSUME_NONNULL_BEGIN

@interface IOSCaiGouChoTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTF;
@property (weak, nonatomic) IBOutlet UIView *tfBgView;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrowImageV;
@property (nonatomic,strong) IOSCaiGouChooM *CaigouChooseModel;

@property (nonatomic,copy) void(^textfieldEndBlock)(NSString *textFieldStr);
-(void)resignTFFirstResponder;
@end

NS_ASSUME_NONNULL_END
