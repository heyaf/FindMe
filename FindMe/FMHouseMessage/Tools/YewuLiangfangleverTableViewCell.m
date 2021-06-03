//
//  CunHomeNongRenTableViewCell.m
//  CunCunBao
//
//  Created by 郑州聚义 on 2018/1/18.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//layer.cornerRadius
//layer.masksToBounds
//layer.borderUIColor
//layer.borderWidth

#import "YewuLiangfangleverTableViewCell.h"
#import "AddGoodsCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "MJCustomActionSheet.h"
#import "MBProgressHUD+WG.h"
#import "TittleDetailModel.h"
#import "TZImagePreviewController.h"
#import "FMHouseMessM.h"
//#import "YewuLiangfangHouseOneViewController.h"

@interface YewuLiangfangleverTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collhight;
@property (nonatomic, strong) UICollectionViewFlowLayout *FlowLayout;


@end

@implementation YewuLiangfangleverTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.FlowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    self.FlowLayout.minimumLineSpacing = 5;
    self.FlowLayout.minimumInteritemSpacing = 0;
    //设置item大小
    self.FlowLayout.itemSize =CGSizeMake((KDeviceWith-70)/3,(KDeviceWith-70)/3);

    //设置分区间距
    self.FlowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.FlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[AddGoodsCollectionViewCell class] forCellWithReuseIdentifier:@"AddGoodsCollectionViewCell"];
}

-(void)showImagData:(FMHouseMessM *)model {
    self.namelabel.text = model.name;
    if (AowString(model.result).length==0) {
        self.detaillabel.text = @"请选择";
    }else {
        self.detaillabel.text = model.result;
    }
    if (AowString(model.iamgeUrl) .length==0) {
        self.imagarr = [NSMutableArray array];
    }else {
        self.imagarr = [[model.iamgeUrl componentsSeparatedByString:@","] mutableCopy];
    }
    self.picMax = 100;
    
    [self.collectionView reloadData];
    if ([AowString(model.isPhoto) isEqualToString:@"1"]) {
        //需要传图片
        self.collhight.constant = self.collectionView.collectionViewLayout.collectionViewContentSize.height+10;
          [self.collectionView.collectionViewLayout invalidateLayout];
    }else {
        self.collhight.constant = 0;
          [self.collectionView.collectionViewLayout invalidateLayout];
    }
   
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.imagarr.count+1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AddGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddGoodsCollectionViewCell" forIndexPath:indexPath];
    cell.index = indexPath.item;
    
    if (self.imagarr.count == indexPath.item) {
        cell.goodsImgView.image = [UIImage imageNamed:@"icon_addImg"];
        cell.deleteBtn.hidden = YES;
    }else {
        cell.bofangimg.hidden = YES;
        NSString *urlimg = ServiceUrlStr(self.imagarr[indexPath.item]);
        KImageSdsetPlacehod(cell.goodsImgView, urlimg)
        cell.deleteBtn.hidden = NO;
    }
    
    [cell setDeleimgblock:^(AddGoodsCollectionViewCell *curecell) {
        NSIndexPath *ind = [collectionView indexPathForCell:curecell];
        if (self->_deletImgblock) {
            if (self.imagarr.count>0) {
                self->_deletImgblock(self,self.imagarr[ind.row]);
            }
            
        }
    }];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self endEditing:YES];
    [self.superview endEditing:YES];

    if (self.imagarr.count == indexPath.item) {
        //点击了添加图片
        [self addtuiguangaction];
    }else {
        if (self.imagarr.count==0) {
            //添加图片
            [self addtuiguangaction];
        }else {
            //查看图片
            [self lookimagarrAndVideoWithIndexPath:indexPath.row withimgarr:self.imagarr];
        }
    }
    
}

//查看图片
- (void)lookimagarrAndVideoWithIndexPath:(NSInteger )row withimgarr:(NSArray *)urlarr {
    NSMutableArray *arr =[NSMutableArray array];
    for (NSString *str in self.imagarr) {
        NSURL *imgurl = [NSURL URLWithString:str];
        [arr addObject:imgurl];
    }
    
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:1 delegate:nil pushPhotoPickerVc:NO];
        imagePickerVc.maxImagesCount = 1;
        imagePickerVc.showSelectBtn = NO;

        TZImagePreviewController *previewVc = [[TZImagePreviewController alloc] initWithPhotos:arr currentIndex:row tzImagePickerVc:imagePickerVc];
        previewVc.modalPresentationStyle = UIModalPresentationFullScreen;
        [previewVc setSetImageWithURLBlock:^(NSURL *URL, UIImageView *imageView, void (^completion)(void)) {
            [imageView sd_setImageWithURL:URL completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                if (completion) {
                    completion();
                }
            }];
            
        }];
        [[self parentController] presentViewController:previewVc animated:YES completion:nil];
    
}
//添加
- (void)addtuiguangaction {
 
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
         imagePickerVc.barItemTextColor = [UIColor blackColor];
         [imagePickerVc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
         imagePickerVc.navigationBar.tintColor = [UIColor blackColor];
         imagePickerVc.naviBgColor = KAppColor;
         imagePickerVc.navigationBar.translucent = NO;
        imagePickerVc.allowPickingVideo = NO;
        imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
        imagePickerVc.allowTakeVideo = NO;   // 在内部显示拍视频按
        imagePickerVc.allowCameraLocation = NO;
        imagePickerVc.allowPickingOriginalPhoto = NO;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            [self photoAddseavToSeverAction:photos];
         
        }];
//        [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage, PHAsset *asset) {
//            [[TZImageManager manager] getVideoOutputPathWithAsset:asset presetName:AVAssetExportPresetLowQuality success:^(NSString *outputPath) {
//                NSData *data = [NSData dataWithContentsOfFile:outputPath];
//                NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
//                // 导出完成，在这里写上传代码，通过路径或者通过NSData上传
//                [self videoAddseavToSeverAction:data];
//        } failure:^(NSString *errorMessage, NSError *error) {
//            NSLog(@"视频导出失败:%@,error:%@",errorMessage, error);
//        }];
//    }];

        imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
        [[self parentController] presentViewController:imagePickerVc animated:YES completion:nil];
   
}

//添加照片
-(void)photoAddseavToSeverAction:(NSArray *)imgarr {
    [MBProgressHUD showMessage:@"加载中"];
    
    NSString *url = [NSString stringWithFormat:@"%@/d/api/template/uploadOthers",AppServerURL];
    [[AFNetHelp shareAFNetworking] UpImageArrPOST:url parameters:nil constructingBodyWithDataArr:imgarr dataType:@"2" success:^(id responseObject) {
        [MBProgressHUD hideHUD];
        if ([AowString(responseObject[@"code"])  isEqualToString:@"1"] ){
           
            NSLog(@"返回图片路径：%@",responseObject[@"data"]);
            NSArray *urlarr = [responseObject[@"data"] componentsSeparatedByString:@","];
        
            if (self->_loadchooseImg) {
                self->_loadchooseImg(self,urlarr);
            }
            
        }else {
            [JRToast showWithText:responseObject[@"msg"]];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [JRToast showWithText:@"图片过大，请单张上传"];

    }];
}

//添加视频
//-(void)videoAddseavToSeverAction:(NSData *)data {
//    [MBProgressHUD showMessage:@"加载中"];
//    NSString *url = [NSString stringWithFormat:@"%@/d/api/template/uploadOthers",AppServerURL];
//    [[AFNetHelp shareAFNetworking] UpVideoOnePOST:url parameters:nil constructingBodyWithdata:data success:^(id responseObject) {
//        [MBProgressHUD hideHUD];
//
//        if ([AowString(responseObject[@"code"])  isEqualToString:@"1"] ){
//            NSLog(@"返回图片路径：%@",responseObject[@"data"]);
//            NSArray *urlarr = [responseObject[@"data"] componentsSeparatedByString:@","];
//            NSMutableArray *imgarr = [NSMutableArray array];
//            for (NSString *imgstr in urlarr) {
//                TittleDetailModel *model = [TittleDetailModel new];
//                ////type=1 图片 2视频
//                model.type = @"2";
//                model.imageUrl = imgstr;
//                [imgarr addObject:model];
//            }
//            if (self->_loadchooseImg) {
//                self->_loadchooseImg(self,imgarr);
//            }
//        }else {
//            [JRToast showWithText:responseObject[@"msg"]];
//
//        }
//    } failure:^(NSError *error) {
//        [MBProgressHUD hideHUD];
//        [JRToast showWithText:@"视频过大，请单张上传"];
//    }];
//}


- (UIViewController *)parentController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder  *nextResponder = [next nextResponder];

//        if ([nextResponder isKindOfClass:[YewuLiangfangHouseOneViewController class]]) {
//            return (UIViewController*)nextResponder;
//        }
    }
    return nil;
}



@end
