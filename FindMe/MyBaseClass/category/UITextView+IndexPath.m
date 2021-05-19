//
//  UITextView+IndexPath.m
//  BatDog
//
//  Created by 郑州聚义 on 2018/11/30.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import "UITextView+IndexPath.h"
#import <objc/runtime.h>

@implementation UITextView (IndexPath)

static char indexPathKey;
- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexPathKey);
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
