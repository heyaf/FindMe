//
//  RequesCover.h
//  YZDisplayViewControllerDemo
//
//  Created by yz on 15/12/21.
//  Copyright © 2015年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequesCover : UIView
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (nonatomic ,copy) void(^pushxiadanblock)(void);

+ (instancetype)requestCover;




@end
