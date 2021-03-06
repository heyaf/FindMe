//
//  HobbyTagView.h
//  xmfish
//
//  Created by xmfish on 15/10/27.
//  Copyright © 2015年 小鱼网. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HobbyViewModel;
@interface HobbyTagView : UIView

-(id)initWithFrame:(CGRect)frame withData:(NSArray *)arr;

@property (nonatomic,strong) NSMutableArray *selelctedArr;
@property (nonatomic,copy) void (^selectedResultBlock)(NSArray *selelctArr);
@end
