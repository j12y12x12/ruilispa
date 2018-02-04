//
//  YXDeviceTools.h
//  JSDropDownMenuDemo
//
//  Created by jin on 2018/1/17.
//  Copyright © 2018年 jsfu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YXDeviceTools : NSObject

@property (nonatomic, assign) CGFloat myScreenHight;
@property (nonatomic, assign) CGFloat myScreenWidth;

//获取单例
+ (instancetype)sharedInstance;


+ (NSDictionary *)dictWithJson:(NSString *)jsonString;
+ (NSArray *)arrayWithJson:(NSString *)jsonString;

@end
