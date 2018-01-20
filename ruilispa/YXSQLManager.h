//
//  YXSQLManager.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXSQLManager : NSObject

+ (YXSQLManager *)shareManager;

#pragma mark - 搜索套卡
- (void)searchAllMealCardInfoWithBlock:(void(^)(NSArray *cardModelArray))callBackBlock;

#pragma mark - 搜索充值卡
- (void)searchAllChargeCardInfoWithBlock:(void(^)(NSArray *cardModelArray))callBackBlock;

#pragma mark - 搜索项目
- (void)searchAllProjectWithProjectClass:(NSString *)projectClass subClass:(NSString *)subClass isAll:(BOOL)isAll callBackBlock:(void(^)(NSMutableArray *projectArray))callBackBlock;

#pragma mark - 搜索产品
- (void)searchAllProductWithBrand:(NSString *)brand subClass:(NSString *)subClass isAll:(BOOL)isAll callBackBlock:(void(^)(NSMutableArray *productArray))callBackBlock;


@end
