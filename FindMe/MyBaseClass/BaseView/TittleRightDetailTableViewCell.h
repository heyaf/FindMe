//
//  TittleRightDetailTableViewCell.h
//  XinHuiApp
//
//  Created by 郑州聚义 on 2018/10/13.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TittleDetailModel;
@interface TittleRightDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tittlelabel;
@property (weak, nonatomic) IBOutlet UILabel *detaillabel;

-(void)showData:(TittleDetailModel *)model;


-(void)showOrdreData:(TittleDetailModel *)model;


@end
