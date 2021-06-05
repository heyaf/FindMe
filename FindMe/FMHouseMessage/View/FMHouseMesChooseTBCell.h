//
//  FMHouseMesChooseTBCell.h
//  FindMe
//
//  Created by mac on 2021/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMHouseMesChooseTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headbgViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomBgvIew;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

-(void)creatChooseBtnArr:(NSArray *)btnArr isSingleChoose:(BOOL)singleChoose;
-(void)creatsubViewswithArr:(NSArray *)btnArr type:(NSInteger)type titleName:(NSString *)titleName;
@end

NS_ASSUME_NONNULL_END
