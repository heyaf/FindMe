//
//  FMHouseMesCM.h
//  FindMe
//
//  Created by mac on 2021/6/3.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*          "id": 5,//模板id
 "name": "材料上楼",//模板名称
 "levelType": "1",//等级1 2 3 4
 "selectType": "1",//下级选项格式 1单选2多选 3无 4填空
 "pid": 0,//父级id
 "referImage": null,//参考图片
 "iamgeUrl": null,//图片
 "remark": null,//备注
 "vidoeUrl": null,//视频
 "types": "1",//1量房记录表 2局部装修量房记录表 3旧房翻新量房记录表 4精装完善量房记录表
 "optionFormat": "1",//当前选项格式 1文本 2填空
 "optionBefore": null,//选项前部分
 "optionAfter": null,//选项后部分
 "companyId": 0//所属公司id
 "isPhoto": 0//1拍照 2不拍照*/
@interface FMHouseMesCM : JSONModel

@property (nonatomic,strong) NSString *houseMessId,*name,*levelType,*selectType,*iamgeUrl,*remark,*types,*optionFormat,*optionBefore,*optionAfter;

@property (nonatomic,strong) NSArray<FMHouseMesCM*> *lowerLevelData;
@property (nonatomic,assign) NSInteger pid,companyId,isPhoto;
@end

NS_ASSUME_NONNULL_END
