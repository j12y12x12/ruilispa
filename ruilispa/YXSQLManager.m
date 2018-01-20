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
    [queue inDatabase:^(FMDatabase *db) {
        
        if (![db tableExists:@"FileInfo"]) {
            BOOL isSuccess = [db executeUpdate:@"CREATE TABLE FileInfo (db_id integer primary key,size text,itype text,time text,url text,roomJIDStr text,filename text,fromJIDStr text,messageID text,type text,isdelete integer,uuid text,filetype text,fromme integer)"];
            
            if (isSuccess) {
                NSLog(@"创建FileInfo成功");
            }
            
        }
        
        if (![db columnExists:@"uuid" inTableWithName:@"FileInfo"]) {
            NSString *sql = [NSString stringWithFormat:@"alter table FileInfo add uuid text"];
            [db executeUpdate:sql];
        }
        if (![db columnExists:@"filetype" inTableWithName:@"FileInfo"]) {
            NSString *sql = [NSString stringWithFormat:@"alter table FileInfo add filetype text"];
            [db executeUpdate:sql];
        }
        if (![db columnExists:@"fromme" inTableWithName:@"FileInfo"]) {
            NSString *sql = [NSString stringWithFormat:@"alter table FileInfo add fromme integer"];
            [db executeUpdate:sql];
        }
        if (![db columnExists:@"md5" inTableWithName:@"FileInfo"]) {
            NSString *sql = [NSString stringWithFormat:@"alter table FileInfo add md5 text"];
            [db executeUpdate:sql];
        }
        
        
    }];
}


- (void)searchAllChargeCardInfoWithBlock:(void(^)(NSArray *cardModelArray))callBackBlock
{
    dispatch_async(self.myQueue, ^{
        [_queue inDatabase:^(FMDatabase *db) {
            NSMutableArray *cardModelArray = [NSMutableArray array];
            [db beginTransaction];
            @try {
                
                FMResultSet *rs = [db executeQuery:@"select * from AllChargeCard order by chargeMoney DESC"];
                while ([rs next]) {
                    YXChargeCardModel *cradModel = [[YXChargeCardModel alloc] init];
                    cradModel.chargeCardName = [rs stringForColumn:@"chargeCardName"];

                    cradModel.chargeMoney = [rs stringForColumn:@"chargeMoney"];
                    cradModel.introduce = [rs stringForColumn:@"introduce"];
                    cradModel.imagePath = [rs stringForColumn:@"imagePath"];

                    NSLog(@"name %@,money %@, in %@ ,image %@",cradModel.chargeCardName,cradModel.chargeMoney,cradModel.introduce,cradModel.imagePath);
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
