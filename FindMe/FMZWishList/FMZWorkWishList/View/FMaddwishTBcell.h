//
//  FMaddwishTBcell.h
//  FindMe
//
//  Created by mac on 2021/6/1.
//

#import <UIKit/UIKit.h>
@class FMaddWishModel;
NS_ASSUME_NONNULL_BEGIN

@interface FMaddwishTBcell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *mainbgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (nonatomic,copy) void(^textfieldEndBlock)(NSString *textFieldStr);
@property (nonatomic,strong) CYCustomArcImageView *customerView;


@property (nonatomic,strong) FMaddWishModel *addWishModel;
-(void)setleavelViewwithtagStr:(NSString *)tagStr;
-(void)setstartViewwithtagStr:(NSString *)tagStr;

@end

NS_ASSUME_NONNULL_END
