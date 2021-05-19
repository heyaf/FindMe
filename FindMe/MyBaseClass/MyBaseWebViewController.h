//
//  GongXiangNewWebViewController.h
//  CunCunBao
//
//  Created by 郑州聚义 on 2018/1/9.
//  Copyright © 2018年 郑州聚义. All rights reserved.


#import "MyBaseViewController.h"
#import <WebKit/WebKit.h>

@interface MyBaseWebViewController : MyBaseViewController

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) WKUserContentController * userContentController;



@end
