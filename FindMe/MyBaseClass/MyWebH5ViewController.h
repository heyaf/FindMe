//
//  MeIntegralViewController.h
//  carTargetOwner
//
//  Created by 郑州聚义 on 2018/6/16.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import "MyBaseViewController.h"


@class WKWebView;
@interface MyWebH5ViewController : MyBaseViewController

@property (nonatomic, copy) NSString *webUrl;

@property (nonatomic, strong) WKWebView *webView;

@end
