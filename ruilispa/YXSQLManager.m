//
//  YXSQLManager.m
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXSQLManager.h"
#import "FMDB.h"
#import "YXChargeCardModel.h"
#import "YXProductModel.h"
#import "YXProjectModel.h"
#import "YXMealCardModel.h"

@interface YXSQLManager()
@property (nonatomic,strong) FMDatabaseQueue *queue;
@property (nonatomic,strong) dispatch_queue_t myQueue;
@end

@implementation YXSQLManager

#pragma mark 单例
+ (YXSQLManager *)shareManager
{
    static YXSQLManager *shareManager = nil;
    static dispatch_once_t once_modal;
    dispatch_once(&once_modal, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.myQueue = dispatch_queue_create("FMDB_Queue", NULL);
        
        
        NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"ruili.db" ofType:nil];
        
        
        FMDatabaseQueue *dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        
        if (dbQueue)
        {
            _queue = dbQueue;
            [YXSQLManager createTable:dbQueue];
        }
    }
    
    return self;
}

+(void)createTable:(FMDatabaseQueue *)queue
{
    return;
//    [queue inDatabase:^(FMDatabase *db) {
//
//        if (![db tableExists:@"FileInfo"]) {
//            BOOL isSuccess = [db executeUpdate:@"CREATE TABLE tableName (db_id integer primary key,size text,isdelete integer,fromme integer)"];
//
//            if (isSuccess) {
//                NSLog(@"创建tableName成功");
//            }
//
//        }
//
//        if (![db columnExists:@"uusss" inTableWithName:@"tableName"]) {
//            NSString *sql = [NSString stringWithFormat:@"alter table tableName add uusss text"];
//            [db executeUpdate:sql];
//        }
//        if (![db columnExists:@"ggggg" inTableWithName:@"FileInfo"]) {
//            NSString *sql = [NSString stringWithFormat:@"alter table FileInfo add ggggg integer"];
//            [db executeUpdate:sql];
//        }
//
//
//    }];
}


#pragma mark - 搜索充值卡
- (void)searchAllChargeCardInfoWithBlock:(void(^)(NSArray *cardModelArray))callBackBlock
{
    dispatch_async(self.myQueue, ^{
        [_queue inDatabase:^(FMDatabase *db) {
            NSMutableArray *cardModelArray = [NSMutableArray array];
            [db beginTransaction];
            @try {
                
                FMResultSet *rs = [db executeQuery:@"select * from AllChargeCard"];
                while ([rs next]) {
                    YXChargeCardModel *cradModel = [[YXChargeCardModel alloc] init];
                    cradModel.chargeCardName = [rs stringForColumn:@"chargeCardName"];

                    cradModel.chargeMoney = [rs stringForColumn:@"chargeMoney"];
                    cradModel.introduce = [rs stringForColumn:@"introduce"];
                    cradModel.imagePath = [rs stringForColumn:@"imagePath"];

                    NSLog(@"name %@,money %@, in %@ ,image %@",cradModel.chargeCardName,cradModel.chargeMoney,cradModel.introduce,cradModel.imagePath);
                    
                    [cardModelArray addObject:cradModel];

                }
                [rs close];
                
                
            } @catch (NSException *exception) {
                [db rollback];
            } @finally {
                [db commit];
                dispatch_async(dispatch_get_main_queue(), ^{
                    callBackBlock(cardModelArray);
                });
            }
        }];
    });
}


#pragma mark - 搜索项目
- (void)searchAllProjectWithProjectClass:(NSString *)projectClass subClass:(NSString *)subClass isAll:(BOOL)isAll callBackBlock:(void(^)(NSMutableArray *projectArray))callBackBlock
{
    dispatch_async(self.myQueue, ^{
        [_queue inDatabase:^(FMDatabase *db) {
            [db beginTransaction];
            NSMutableArray *projectArray = [NSMutableArray array];
            @try {
                NSString *sql;
                
                if (isAll)
                {
                    sql = [NSString stringWithFormat:@"select * from AllProject where projectClass = '%@'",projectClass];
                }
                else
                {
                    sql = [NSString stringWithFormat:@"select * from AllProject where projectClass = '%@' and subClass = '%@'",projectClass,subClass];
                }
                
                FMResultSet *rs = [db executeQuery:sql];
                while ([rs next]) {
                    
                    YXProjectModel *projectModel = [[YXProjectModel alloc] init];
                    
                    projectModel.projectClass = [rs stringForColumn:@"projectClass"];
                    
                    projectModel.projectClass = [rs stringForColumn:@"projectClass"];
                    projectModel.subClass = [rs stringForColumn:@"subClass"];
                    projectModel.projectName = [rs stringForColumn:@"projectName"];
                    projectModel.isSingleCard = [rs intForColumn:@"isSingleCard"];
                    projectModel.singlePrice = [rs stringForColumn:@"singlePrice"];
                    projectModel.cardPrice = [rs stringForColumn:@"cardPrice"];
                    projectModel.count = [rs intForColumn:@"count"];
                    projectModel.isTimeCard = [rs intForColumn:@"isTimeCard"];
                    projectModel.isMoutheCard = [rs intForColumn:@"isMoutheCard"];
                    projectModel.isQuarterCard = [rs intForColumn:@"isQuarterCard"];
                    projectModel.isHalfYearCard = [rs intForColumn:@"isHalfYearCard"];
                    projectModel.isYearCard = [rs intForColumn:@"isYearCard"];
                    projectModel.expirCount = [rs intForColumn:@"expirCount"];
                    projectModel.maxIncludeCount = [rs intForColumn:@"maxIncludeCount"];
                    projectModel.marketPrice = [rs stringForColumn:@"marketPrice"];
                    projectModel.vipPrice = [rs stringForColumn:@"vipPrice"];
                    projectModel.singleConsumePrice = [rs stringForColumn:@"singleConsumePrice"];
                    projectModel.imagePath = [rs stringForColumn:@"imagePath"];
                    projectModel.howlong = [rs stringForColumn:@"howlong"];
                    projectModel.introduce = [rs stringForColumn:@"introduce"];
                    
                    [projectArray addObject:projectModel];
                }
                [rs close];
                
            } @catch (NSException *exception) {
                [db rollback];
            } @finally {
                [db commit];
                dispatch_async(dispatch_get_main_queue(), ^{
                    callBackBlock(projectArray);
                });
            }
        }];
    });
}



#pragma mark - 搜索产品
- (void)searchAllProductWithBrand:(NSString *)brand subClass:(NSString *)subClass isAll:(BOOL)isAll callBackBlock:(void(^)(NSMutableArray *productArray))callBackBlock
{
    dispatch_async(self.myQueue, ^{
        [_queue inDatabase:^(FMDatabase *db) {
            [db beginTransaction];
            NSMutableArray *productArray = [NSMutableArray array];
            @try {
                NSString *sql;
                
                if (isAll)
                {
                    sql = [NSString stringWithFormat:@"select * from Allproduct where brand = '%@'",brand];
                }
                else
                {
                    sql = [NSString stringWithFormat:@"select * from Allproduct where brand = '%@' and subClass = '%@'",brand,subClass];
                }
                
                FMResultSet *rs = [db executeQuery:sql];
                while ([rs next]) {
                    
                    YXProductModel *productModel = [[YXProductModel alloc] init];
                    
                    productModel.brand = [rs stringForColumn:@"brand"];
                    productModel.productName = [rs stringForColumn:@"productName"];
                    productModel.subClass = [rs stringForColumn:@"subClass"];
                    productModel.imagePath = [rs stringForColumn:@"imagePath"];
                    productModel.marketPrice = [rs stringForColumn:@"marketPrice"];
                    productModel.vipPrice = [rs stringForColumn:@"vipPrice"];
                    productModel.usePart = [rs stringForColumn:@"usePart"];
                    productModel.introduce = [rs stringForColumn:@"introduce"];
                    productModel.unit = [rs stringForColumn:@"unit"];
                    productModel.standard = [rs stringForColumn:@"standard"];

                    
                    [productArray addObject:productModel];
                }
                [rs close];
                
            } @catch (NSException *exception) {
                [db rollback];
            } @finally {
                [db commit];
                dispatch_async(dispatch_get_main_queue(), ^{
                    callBackBlock(productArray);
                });
            }
        }];
    });
}


#pragma mark - 搜索产品
- (void)searchAllMealCardWithBrand:(NSString *)brand subClass:(NSString *)subClass isAll:(BOOL)isAll callBackBlock:(void(^)(NSMutableArray *productArray))callBackBlock
{
    dispatch_async(self.myQueue, ^{
        [_queue inDatabase:^(FMDatabase *db) {
            [db beginTransaction];
            NSMutableArray *productArray = [NSMutableArray array];
            @try {
                NSString *sql;
                
                if (isAll)
                {
                    sql = [NSString stringWithFormat:@"select * from Allproduct where brand = '%@'",brand];
                }
                else
                {
                    sql = [NSString stringWithFormat:@"select * from Allproduct where brand = '%@' and subClass = '%@'",brand,subClass];
                }
                
                FMResultSet *rs = [db executeQuery:sql];
                while ([rs next]) {
                    
                    YXProductModel *productModel = [[YXProductModel alloc] init];
                    
                    productModel.brand = [rs stringForColumn:@"brand"];
                    productModel.productName = [rs stringForColumn:@"productName"];
                    productModel.subClass = [rs stringForColumn:@"subClass"];
                    productModel.imagePath = [rs stringForColumn:@"imagePath"];
                    productModel.marketPrice = [rs stringForColumn:@"marketPrice"];
                    productModel.vipPrice = [rs stringForColumn:@"vipPrice"];
                    productModel.usePart = [rs stringForColumn:@"usePart"];
                    productModel.introduce = [rs stringForColumn:@"introduce"];
                    productModel.unit = [rs stringForColumn:@"unit"];
                    productModel.standard = [rs stringForColumn:@"standard"];
                    
                    
                    [productArray addObject:productModel];
                }
                [rs close];
                
            } @catch (NSException *exception) {
                [db rollback];
            } @finally {
                [db commit];
                dispatch_async(dispatch_get_main_queue(), ^{
                    callBackBlock(productArray);
                });
            }
        }];
    });
}


#pragma mark - 搜索套卡
- (void)searchAllMealCardInfoWithBlock:(void(^)(NSArray *cardModelArray))callBackBlock
{
    dispatch_async(self.myQueue, ^{
        [_queue inDatabase:^(FMDatabase *db) {
            NSMutableArray *cardModelArray = [NSMutableArray array];
            [db beginTransaction];
            @try {
                
                FMResultSet *rs = [db executeQuery:@"select * from AllMealCard"];
                while ([rs next]) {
                    YXMealCardModel *cradModel = [[YXMealCardModel alloc] init];
                    cradModel.mealCardName = [rs stringForColumn:@"mealCardName"];
                    cradModel.imagePath = [rs stringForColumn:@"imagePath"];
                    cradModel.introduce = [rs stringForColumn:@"introduce"];
                    cradModel.marketPrice = [rs stringForColumn:@"marketPrice"];
                    cradModel.vipPrice = [rs stringForColumn:@"vipPrice"];
                    cradModel.expirDate = [rs stringForColumn:@"expirDate"];
                    cradModel.includeProject = [rs stringForColumn:@"includeProject"];

                    
                    NSLog(@"name %@,money %@, in %@ ,image %@ include %@ ",cradModel.mealCardName,cradModel.marketPrice,cradModel.vipPrice,cradModel.imagePath,cradModel.includeProject);
                    
                    [cardModelArray addObject:cradModel];
                }
                [rs close];
                
                
            } @catch (NSException *exception) {
                [db rollback];
            } @finally {
                [db commit];
                dispatch_async(dispatch_get_main_queue(), ^{
                    callBackBlock(cardModelArray);
                });
            }
        }];
    });
}


@end
