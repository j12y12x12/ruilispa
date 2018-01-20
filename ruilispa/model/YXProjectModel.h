//
//  YXProjectModel.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXProjectModel : NSObject

/** 总类别 */
@property (strong, nonatomic) NSString *pjtClass;
/** 系列 */
@property (strong, nonatomic) NSString *SubClass;
/** 卡类别，包含次卡和时效卡 */
@property (strong, nonatomic) NSString *cardClass;


//次卡
@property (strong, nonatomic) NSString *singleCard;
/** 单次价格 */
@property (strong, nonatomic) NSString *singlePrice;
/** 办卡价格 */
@property (strong, nonatomic) NSString *cardPrice;
/** 办卡包含次数 */
@property (strong, nonatomic) NSNumber *count;


/** 时效卡 */
@property (strong, nonatomic) NSString *timeCard;

@property (strong, nonatomic) NSString *moutheCard;

@property (strong, nonatomic) NSString *quarterCard;

@property (strong, nonatomic) NSString *halfYearCard;

@property (strong, nonatomic) NSString *yearCard;

/** 有效期，单位：月 */
@property (strong, nonatomic) NSNumber *expirCount;

@property (strong, nonatomic) NSString *marketPrice;

@property (strong, nonatomic) NSString *vipPrice;

@property (strong, nonatomic) NSNumber *maxIncludeCount;
//单次耗卡金额，时效卡有
@property (strong, nonatomic) NSString *singleConsumePrice;


/** 项目名称 */
@property (strong, nonatomic) NSString *name;
/** 图片 */
@property (strong, nonatomic) NSString *image;
/** 时长 */
@property (strong, nonatomic) NSString *howlong;

/** 功能介绍 */
@property (strong, nonatomic) NSString *introduce;



@end
