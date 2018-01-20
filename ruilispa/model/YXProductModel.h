//
//  YXProductModel.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXProductModel : NSObject

/** 项目名称 */
@property (strong, nonatomic) NSString *productName;

@property (strong, nonatomic) NSString *subClass;
@property (strong, nonatomic) NSString *brand;
@property (strong, nonatomic) NSString *imagePath;
@property (strong, nonatomic) NSString *marketPrice;
@property (strong, nonatomic) NSString *vipPrice;
@property (strong, nonatomic) NSString *usePart;
@property (strong, nonatomic) NSString *introduce;
//单位 瓶
@property (strong, nonatomic) NSString *unit;
//规格 ml,g
@property (strong, nonatomic) NSString *standard;


@end
