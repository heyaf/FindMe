//
//  XianJinDiYaYuanAddZiliaoViewController.m
//  XinHuiApp
//
//  Created by 郑州聚义 on 2018/10/11.
//  Copyright © 2018年 郑州聚义. All rights reserved.

#import "PhotoChoseShowViewController.h"
#import "UITextField+IndexPath.h"
#import "BRPickerView.h"
#import "TittleDetailModel.h"
#import "ChoosePhotoPlaceTableViewCell.h"

@interface PhotoChoseShowViewController ()<UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate, UITextViewDelegate> {
}
@property (nonatomic , strong)NSMutableArray *titleArray;
@property (nonatomic , strong)NSMutableArray *arrayDataSouce;
@property (nonatomic , strong)NSMutableArray *placehod;


@end

@implementation PhotoChoseShowViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"信息";
    
    self.tabelView.backgroundColor = RGBA(245, 245, 245, 1);
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tabelView.showsVerticalScrollIndicator = NO;
    self.tabelView.estimatedRowHeight = 100;
    self.tabelView.rowHeight = UITableViewAutomaticDimension;

    [self.tabelView registerNib:[UINib nibWithNibName:@"ChoosePhotoPlaceTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChoosePhotoPlaceTableViewCell"];
    

    [self.dataSource addObject:[@{@"name":@"*A图片",@"type":@"overduePayIamge",@"pic":@[@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2759603483,1319363293&fm=26&gp=0.jpg",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201312%2F31%2F111859myvyiivetyftfz2n.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619060112&t=1c529b66927955071ead34a1bf6bd608",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2759603483,1319363293&fm=26&gp=0.jpg",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201312%2F31%2F111859myvyiivetyftfz2n.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619060112&t=1c529b66927955071ead34a1bf6bd608",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20190519%2F21%2F1558273489-CAaOhJTVoq.jpg&refer=http%3A%2F%2Fimage.biaobaiju.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619061118&t=f224c3211f6b4d5e6f5f48cfbcf83b38"],@"picMax":@"100"} mutableCopy]];
 
    
    [self.dataSource addObject:[@{@"name":@"*B图片",@"type":@"overBSECIamge",@"pic":@[@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2759603483,1319363293&fm=26&gp=0.jpg",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201312%2F31%2F111859myvyiivetyftfz2n.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619060112&t=1c529b66927955071ead34a1bf6bd608",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201312%2F31%2F111859myvyiivetyftfz2n.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619060112&t=1c529b66927955071ead34a1bf6bd608"],@"picMax":@"100"} mutableCopy]];
}


#pragma marks - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChoosePhotoPlaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChoosePhotoPlaceTableViewCell" forIndexPath:indexPath];
    [cell showImagData:self.dataSource[indexPath.row]];
    [cell setLoadchooseImg:^(ChoosePhotoPlaceTableViewCell *curecell, NSArray *imgstr) {
        NSIndexPath *cureindx = [self.tabelView indexPathForCell:curecell];
        NSMutableArray *imgarr = [NSMutableArray arrayWithArray:self.dataSource[cureindx.row][@"pic"]];
        [imgarr addObjectsFromArray:imgstr];
        [self.dataSource[cureindx.row] setValue:imgarr forKey:@"pic"];
        
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:cureindx,nil] withRowAnimation:UITableViewRowAnimationNone];
    }];
    [cell setDeletImgblock:^(ChoosePhotoPlaceTableViewCell * curecell) {
        NSIndexPath *cureindx = [self.tabelView indexPathForCell:curecell];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:cureindx,nil] withRowAnimation:UITableViewRowAnimationNone];

    }];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.tabelView endEditing:YES];

}



@end
