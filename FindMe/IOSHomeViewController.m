//
//  IOSHomeViewController.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSHomeViewController.h"
#import "IOSEnterHomeVC.h"

@interface IOSHomeViewController ()

@end

@implementation IOSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = RGBA(235, 177, 42, 1);
    
    UIButton *IOSBtn = [UIButton buttonWithType:0];
    IOSBtn.frame = CGRectMake(100, 150, 100, 50);
    IOSBtn.backgroundColor = [UIColor yellowColor];
    [IOSBtn setTitle:@"进销存" forState:0];
    [IOSBtn setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn addTarget:self action:@selector(InOutSave) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn];
}

-(void)InOutSave{
    IOSEnterHomeVC *pushVC = [[IOSEnterHomeVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}

@end
