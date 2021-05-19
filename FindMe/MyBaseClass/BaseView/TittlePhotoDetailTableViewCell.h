//
//  TittlePhotoDetailTableViewCell.h
//  XinHuiApp
//
//  Created by 郑州聚义 on 2018/9/28.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TittleDetailModel;
@interface TittlePhotoDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoview;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *detaillabel;


-(void)showData:(TittleDetailModel *)model;


@end
