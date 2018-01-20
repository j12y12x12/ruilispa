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

- (void)searchAllChargeCardInfoWithBlock:(void(^)(NSArray *cardModelArray))callBackBlock;

@end
