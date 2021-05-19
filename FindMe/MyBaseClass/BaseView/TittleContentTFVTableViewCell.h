//
//  NewQingJiaTableViewCell.h
//  CarTarget
//
//  Created by 郑州聚义 on 2017/12/6.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderTextView.h"

@interface TittleContentTFVTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PlaceholderTextView *contenTFV;

@property (weak, nonatomic) IBOutlet UILabel *namelabel;

- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath ;



@end
