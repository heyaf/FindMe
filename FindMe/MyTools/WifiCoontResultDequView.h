//
//  ShareView.h
//  TYAlertControllerDemo
//
//  Created by tanyang on 15/10/26.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WifiCoontResultDequView : UIView
@property (weak, nonatomic) IBOutlet UILabel *qiandaochenggong;

@property (nonatomic, copy) void(^waiqinblock)(void);
@property (nonatomic, copy) void(^huilaiblock)(void);
@property (nonatomic, copy) void(^xiabanblock)(void);

@end
