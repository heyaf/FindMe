//
//  FMHouseMesCell.h
//  FindMe
//
//  Created by mac on 2021/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMHouseMesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;

@end

NS_ASSUME_NONNULL_END
