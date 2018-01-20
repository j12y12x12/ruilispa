//
//  YXProjectModel.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXProjectModel : NSObject

/** 项目名称 */
@property (strong, nonatomic) NSString *projectName;

/** 总类别 */
@property (strong, nonatomic) NSString *projectClass;
/** 系列 */
@property (strong, nonatomic) NSString *subClass;
/** 卡类别，包含次卡和时效卡 */
@property (strong, nonatomic) NSString *cardClass;


//次卡
@property (assign, nonatomic) int isSingleCard;
/** 单次价格 */
@property (strong, nonatomic) NSString *singlePrice;
/** 办卡价格 */
@property (strong, nonatomic) NSString *cardPrice;
/** 办卡包含次数 */
@property (strong, nonatomic) NSNumber *count;


@property (assign, nonatomic) int isTimeCard;
@property (assign, nonatomic) int isMoutheCard;
@property (assign, nonatomic) int isQuarterCard;
@property (assign, nonatomic) int isHalfYearCard;
@property (assign, nonatomic) int isYearCard;


/** 有效期，单位：月 */
@property (assign, nonatomic) int expirCount;

@property (strong, nonatomic) NSString *marketPrice;

@property (strong, nonatomic) NSString *vipPrice;

@property (assign, nonatomic) int maxIncludeCount;
//单次耗卡金额，时效卡有
@property (strong, nonatomic) NSString *singleConsumePrice;


/** 图片 */
@property (strong, nonatomic) NSString *imagePath;
/** 时长 */
@property (strong, nonatomic) NSString *howlong;

/** 功能介绍 */
@property (strong, nonatomic) NSString *introduce;



@end
