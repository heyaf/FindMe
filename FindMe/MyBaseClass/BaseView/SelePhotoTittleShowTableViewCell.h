//
//  MyChongZhiTableViewCell.h
//  MeetAward
//
//  Created by 郑州聚义 on 16/11/14.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyTapAction)(NSInteger tag);

@class TittleDetailModel;
@interface SelePhotoTittleShowTableViewCell : UITableViewCell
@property (nonatomic,copy) MyTapAction block;

@property (nonatomic,copy) void (^buttonAction)(SelePhotoTittleShowTableViewCell *cell);
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headimg;

@property (weak, nonatomic) IBOutlet UIButton *mySelectbnt;

-(void)upDataWithFriendName:(NSString *)friendName andIsselected:(BOOL) isSelect;
//点击更新button的选中与否
-(void)updateWithSelectSatic;

- (void)showData:(TittleDetailModel *)model;

@end
