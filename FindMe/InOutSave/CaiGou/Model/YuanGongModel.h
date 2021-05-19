//
//  YuanGongModel.h
//  BatDog
//
//  Created by 郑州聚义 on 2018/12/27.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import "BaseModel.h"

@interface YuanGongModel : BaseModel

@property (nonatomic, copy) NSString *empId ,*name , *phone, *photo, *roleName,*employeeId,*pname;
@property(nonatomic, copy) NSString *school, *professional, *education,*integration,*coinMoney,*pskill,*honor;//学校，专业，学历//积分,米币,特长, 荣誉,
@property (nonatomic, copy) NSString *sexName , *pNationName, *pEducationName,*birthday,*address,*pSchollName,*positionName,*departmentName,*baseMoney,*entryTime,*personalProfile,*starName,*flag,*title,*tittle;

@property (nonatomic, copy) NSString *contact1 , *contactPhone1, *contact2, *contactPhone2;//紧急联系人
@property (nonatomic, assign) BOOL isSelect,isjiantou,isduoxuan;

@end
