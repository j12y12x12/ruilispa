//
//  YXDeviceTools.m
//  JSDropDownMenuDemo
//
//  Created by jin on 2018/1/17.
//  Copyright © 2018年 jsfu. All rights reserved.
//

#import "YXDeviceTools.h"

@implementation YXDeviceTools

static YXDeviceTools *manager = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YXDeviceTools alloc] init];
    });
    return manager;
}

// 将JSON串转换为字典
+ (NSDictionary *)dictWithJson:(NSString *)jsonString
{
    NSData* data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (data == nil) {
        return [NSDictionary dictionary];
    }
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
}

// 将JSON串转换为数组
+ (NSArray *)arrayWithJson:(NSString *)jsonString
{
    NSData* data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (data == nil) {
        return [NSArray array];
    }
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
}

@end
