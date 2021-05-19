//
//  TittleDetailModel.h
//  LedRoad
//
//  Created by 郑州聚义 on 16/9/9.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "BaseModel.h"


@interface TittleDetailModel : BaseModel

@property (nonatomic,copy) NSString *mode_id, *tittle,*subtittle , *detail,*placehod, *num, *updateDate ,*operatingContent,*updatePerson,*employeeName,*employeeId,*workCount,*bannerImageUrl,*bannerId,*amountUsed,*createTime,*projectImg,*statueName,*ifAskLeaveAgree,*ifAskLeave,*askLeaveReason,*today,*clockId,*ifClock,*clockStatue,*dayString,*upStatue,*upAddress,*downAddress,*upLateTime,*upTime,*downTime,*downLeaveEarlyTime,*downStatue;
@property (nonatomic,strong) NSMutableArray *subArr;
@property (nonatomic,assign) BOOL isSelect;
@property (nonatomic,strong) UIImage *showimg;

@property (nonatomic,copy) NSArray *imgVideos;

@property (nonatomic,copy) NSString *type;
@property (nonatomic,assign) BOOL ischoose;
//1:未打上班卡 2：打上班卡迟到 3：正常打卡 4：外勤打上班卡且迟到 5：外勤打卡 外勤（不在规定范围内打卡）
//1:未打下班卡 2：打下班卡早退 3：正常打卡 4：外勤打上班卡且早退 5：外勤打卡
@property (nonatomic,copy) NSString *ifUpClock,*ifDownClock;

@property (nonatomic,copy) NSString  *depCount,*depName,*zongjingbanid,*gongsiid,*managerOffice,*companyPid;
@property (nonatomic,assign) BOOL iszonggongsi;
@property (nonatomic,assign) CGFloat statueId;

@end
