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

@end
