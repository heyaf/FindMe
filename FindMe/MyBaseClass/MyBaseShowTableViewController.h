//
//  MyBaseShowTableViewController.h
//  BatDog
//
//  Created by 郑州聚义 on 2019/1/3.
//  Copyright © 2019年 郑州聚义. All rights reserved.
//

#import "MyBaseViewController.h"

@interface MyBaseShowTableViewController : MyBaseViewController

@property (nonatomic, strong) UITableView *tabelView;

@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)QRCodeScanVC:(UIViewController *)scanVC;

@end
