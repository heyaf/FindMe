//
//  HomeViewController.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "HomeViewController.h"
#import "IOSEnterHomeVC.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    
    UIButton *IOSBtn = [UIButton buttonWithType:0];
    IOSBtn.frame = CGRectMake(100, 100, 100, 50);
    IOSBtn.backgroundColor = [UIColor yellowColor];
    [IOSBtn setTitle:@"进销存" forState:0];
    [IOSBtn setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn addTarget:self action:@selector(InOutSave) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn];
}

-(void)InOutSave{
//    IOSEnterHomeVC *pushVC = [[IOSEnterHomeVC alloc] init];
//    [self.navigationController pushViewController:pushVC animated:YES];

}


@end
