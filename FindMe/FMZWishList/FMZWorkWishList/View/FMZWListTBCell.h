//
//  FMZWListTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import <UIKit/UIKit.h>
#import "FMWWishListM.h"
NS_ASSUME_NONNULL_BEGIN

@interface FMZWListTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainBgIMV;
@property (weak, nonatomic) IBOutlet UIImageView *chooseSingleImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *luruLabel;
@property (weak, nonatomic) IBOutlet UILabel *luruLiangLabel;
@property (weak, nonatomic) IBOutlet UILabel *qiandanLabel;
@property (weak, nonatomic) IBOutlet UILabel *qiandanLiangLabel;
@property (weak, nonatomic) IBOutlet UILabel *qiandanPlabel;
@property (weak, nonatomic) IBOutlet UILabel *qiandanPnumLabel;
@property (weak, nonatomic) IBOutlet UILabel *leavelLabel;
@property (weak, nonatomic) IBOutlet UILabel *leavelNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;
@property (weak, nonatomic) IBOutlet UILabel *startNumLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainBGimV1;
@property (weak, nonatomic) IBOutlet UIImageView *editImageV;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIImageView *tagimV;
@property (weak, nonatomic) IBOutlet UIImageView *tagimv1;
@property (weak, nonatomic) IBOutlet UIImageView *tagimV2;

@property (nonatomic,copy) void(^editBtnClickBlcok)(void);
- (IBAction)EditBtnClicked:(id)sender;
@property (nonatomic,strong) FMWWishListM *wishListM;
@end

NS_ASSUME_NONNULL_END
