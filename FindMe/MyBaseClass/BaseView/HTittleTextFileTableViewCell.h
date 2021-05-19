//
//  HTextFileTableViewCell.h
//  Textfield
//
//  Created by 郑州聚义 on 2018/10/9.
//  Copyright © 2018年 朱同海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTittleTextFileTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *jiantouimage;
@property (weak, nonatomic) IBOutlet UILabel *detalabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;


/**
 *  设置cell、数据
 *  @param string        左边的标题
 *  @param dataString    textfield输入内容
 *  @param indexPath     indexPath。唯一绑定当前textfield
 */
- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString withThePlacehold:(NSString *)plocd andIndexPath:(NSIndexPath *)indexPath;


//无占位符
- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath;


@end
