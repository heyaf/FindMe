//
//  CunHomeNongRenTableViewCell.m
//  CunCunBao
//
//  Created by 郑州聚义 on 2018/1/18.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import "ChoosePhotoPlaceTableViewCell.h"
#import "AddPhotoCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "MJCustomActionSheet.h"
#import "MBProgressHUD+WG.h"
#import "PhotoChoseShowViewController.h"

@interface ChoosePhotoPlaceTableViewCell ()
@property (nonatomic, strong) UICollectionViewFlowLayout *FlowLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collhight;

@end

@implementation ChoosePhotoPlaceTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.FlowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    self.FlowLayout.minimumLineSpacing = 10;
    self.FlowLayout.minimumInteritemSpacing = 0;
    //设置item大小
    self.FlowLayout.itemSize =CGSizeMake((KDeviceWith-40)/3,(KDeviceWith-40)/3);

    //设置分区间距
    self.FlowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.FlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[AddPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"AddPhotoCollectionViewCell"];

}

-(void)showImagData:(NSDictionary *)dic {
    self.modeldic = dic;
    self.namelabel.text = AowString(dic[@"name"]);
    self.picMax = [AowString(dic[@"picMax"]) integerValue];
    
    [self.collectionView reloadData];
    
    self.collhight.constant = self.collectionView.collectionViewLayout .collectionViewContentSize.height+10;
      [self.collectionView.collectionViewLayout invalidateLayout];
    
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.modeldic[@"picMax"] integerValue]==2) {
        return 2;
    }
    NSArray *arr = self.modeldic[@"pic"];
    return arr.count == self.picMax?self.picMax:arr.count+1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AddPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddPhotoCollectionViewCell" forIndexPath:indexPath];
    cell.index = indexPath.item;
    NSArray *arr = self.modeldic[@"pic"];
    if ([self.modeldic[@"type"] isEqualToString:@"clientIDCardImageA"]) {
        
        if(arr.count==1) {
            if (indexPath.item==1){
                cell.goodsImgView.image = [UIImage imageNamed:@"shenfenfanmian"];
                cell.deleteBtn.hidden = YES;
            }else {
                NSString *urlimg = ServiceUrlStr(arr[0]);
                KImageSdsetPlacehod(cell.goodsImgView, urlimg)
                cell.deleteBtn.hidden = NO;
            }
        }else if(arr.count==2) {
            NSString *urlimg = ServiceUrlStr(arr[indexPath.item]);
            KImageSdsetPlacehod(cell.goodsImgView, urlimg)
            cell.deleteBtn.hidden = NO;
        }else {
            if (indexPath.item==0) {
                cell.goodsImgView.image = [UIImage imageNamed:@"shenzhengmian"];
                cell.deleteBtn.hidden = YES;
            }else{
                cell.goodsImgView.image = [UIImage imageNamed:@"shenfenfanmian"];
                cell.deleteBtn.hidden = YES;
            }
        }
    }else {
            if (arr.count == indexPath.item) {
                cell.goodsImgView.image = [UIImage imageNamed:@"shangchuangimg"];
                cell.deleteBtn.hidden = YES;
            }else{
                KImageSdsetPlacehod(cell.goodsImgView, arr[indexPath.item])
                cell.deleteBtn.hidden = NO;
            }

    }

    [cell setDeleimgblock:^(AddPhotoCollectionViewCell *curecell) {
        NSIndexPath *ind = [collectionView indexPathForCell:curecell];
        if (self->_deletImgblock) {
            NSMutableArray *marr = self.modeldic[@"pic"];
            if (marr.count>0) {
                [marr removeObjectAtIndex:ind.row];
                self->_deletImgblock(self);
            }
     
        }
    }];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self endEditing:YES];
    [self.superview endEditing:YES];

    NSArray *arr = self.modeldic[@"pic"];
    if (arr.count == indexPath.item) {
        //点击了添加图片
        MJCustomActionSheet *actionSheet = [MJCustomActionSheet actionSheetWithCancelTitle:@"取消" alertTitle:@"选择图片" SubTitles:@"相册",@"拍照", nil];
        [actionSheet show];
        [actionSheet setCustomActionSheetItemClickHandle:^(MJCustomActionSheet *actionSheet, NSInteger currentIndex, NSString *title) {
            if (currentIndex ==0) {
                [self openPickViewAcyion:0];
            }else {
                [self openPickViewAcyion:1];
            }

        }];
    }else {
        if (arr.count==0) {
            //添加图片
            MJCustomActionSheet *actionSheet = [MJCustomActionSheet actionSheetWithCancelTitle:@"取消" alertTitle:@"选择图片" SubTitles:@"相册",@"拍照", nil];
            [actionSheet show];
            [actionSheet setCustomActionSheetItemClickHandle:^(MJCustomActionSheet *actionSheet, NSInteger currentIndex, NSString *title) {
                if (currentIndex ==0) {
                    [self openPickViewAcyion:0];
                }else {
                    [self openPickViewAcyion:1];
                }
                
            }];
        }else {
//            //查看图片
//            NSMutableArray *array = [NSMutableArray new];
//            for (NSString *imgstr in arr) {
//                NSMutableDictionary *params = [NSMutableDictionary new];
//                params[ZLPreviewPhotoTyp] = @(ZLPreviewPhotoTypeURLImage);
//                params[ZLPreviewPhotoObj] = [NSURL URLWithString:imgstr];
//                [array addObject:params];
//            }
//            ZLPhotoActionSheet *ac = [[ZLPhotoActionSheet alloc] init];
//            ac.sender = [self parentController];
//            [ac previewPhotos:array index:indexPath.item hideToolBar:YES complete:nil];
        }
     
    }
    
}

-(void)openPickViewAcyion:(NSInteger)index{
    NSArray *arr = self.modeldic[@"pic"];
    if (index == 0) {
//        //进入相册
//        ZLPhotoActionSheet *ac = [[ZLPhotoActionSheet alloc] init];
//        ac.configuration.maxSelectCount = self.picMax-arr.count;
//        ac.configuration.maxPreviewCount = self.picMax;
//        ac.configuration.allowRecordVideo = NO;
//        ac.configuration.allowSelectVideo = NO;
//        ac.configuration.allowTakePhotoInLibrary = NO;
//        ac.configuration.bottomBtnsNormalTitleColor = KAppColor;
//        ac.configuration.navBarColor = KAppColor;
//        //如调用的方法无sender参数，则该参数必传
//        ac.sender = [self parentController];
//
//        [ac showPhotoLibrary];
//        // 选择回调
//        [ac setSelectImageBlock:^(NSArray<UIImage *> * _Nonnull images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
//            NSMutableArray *dataarr = [NSMutableArray array];
//            for (int i = 0; i<assets.count; i++) {
//                PHAsset *aasset = assets[0];
//                UIImage *image = images[i];
//                NSData *imgdata;
//                if (aasset.mediaType == PHAssetMediaTypeImage) {
//
//                    if (UIImagePNGRepresentation(image)) {
//                        //返回为png图像。
//                        imgdata = UIImagePNGRepresentation(image);
//                    }else {
//                        //返回为JPEG图像。
//                        imgdata = UIImageJPEGRepresentation(image, 0.3);
//                    }
//                    [dataarr addObject:imgdata];
//                }
//            }
//            [self uploadFileWithType:1 andData:dataarr];
//        }];
//    }else{
//        //拍照
//        ZLCustomCamera *camera = [[ZLCustomCamera alloc] init];
//        camera.allowTakePhoto = YES;
//        camera.doneBlock = ^(UIImage *image, NSURL *videoUrl) {
//            // 自己需要在这个地方进行图片或者视频的保存
//            if (image) {
//                NSData *imgdata;
//                if (UIImagePNGRepresentation(image)) {
//                    //返回为png图像。
//                    imgdata = UIImagePNGRepresentation(image);
//                }else {
//                    //返回为JPEG图像。
//                    imgdata = UIImageJPEGRepresentation(image, 0.3);
//                }
//
//                [self uploadFileWithType:1 andData:@[imgdata]];
//            }
//        };
//
//        [[self parentController] showDetailViewController:camera sender:nil];
    }
    
}

-(void)uploadFileWithType:(NSInteger )type andData:(NSArray *)fileData{
//    [MBProgressHUD showMessage:@"加载中"];
//    NSString *url = [NSString stringWithFormat:@"%@/index/upload/public/uploadImageMuch",AppServerURL];
//
//    [[AFNetHelp shareAFNetworking] UpImageArrPOST:url parameters:nil constructingBodyWithDataArr:fileData jindu:nil success:^(id responseObject) {
//        [MBProgressHUD hideHUD];
//        if ([AowString(responseObject[@"code"])  isEqualToString:@"200"] ){
//            NSLog(@"返回图片路径：%@",responseObject[@"data"]);
            if (self->_loadchooseImg) {
                self->_loadchooseImg(self,@[@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2759603483,1319363293&fm=26&gp=0.jpg"]);
            }
//        }else {
//            [JRToast showWithText:responseObject[@"msg"]];
//        }
//    } failure:^(NSError *error) {
//        [MBProgressHUD hideHUD];
//        [JRToast showWithText:@"图片过大，请单张上传"];
//
//    }];
    
}


- (UIViewController *)parentController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder  *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[PhotoChoseShowViewController class]]) {
            return (UIViewController*)nextResponder;
        }

    }
    return nil;
}



@end
