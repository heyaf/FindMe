//
//  IOSPanDianHeaderTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSPanDianHeaderTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *godsNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
- (IBAction)startButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
