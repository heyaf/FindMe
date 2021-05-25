//
//  ShareView.m
//  TYAlertControllerDemo
//
//  Created by tanyang on 15/10/26.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import "WifiCoontResultDequView.h"

@implementation WifiCoontResultDequView


//
- (IBAction)lookbaomingjilu:(UIButton *)sender {
    [self hideView];
    if (_waiqinblock) {
        _waiqinblock();
    }
}
- (IBAction)fanhuishouye:(UIButton *)sender {
    [self hideView];
    if (_huilaiblock) {
        _huilaiblock();
    }
}

- (IBAction)xiabanaction:(UIButton *)sender {
    [self hideView];
    if (_xiabanblock) {
        _xiabanblock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
