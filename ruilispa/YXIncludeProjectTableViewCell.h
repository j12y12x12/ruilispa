//
//  YXIncludeProjectTableViewCell.h
//  ruilispa
//
//  Created by jin on 2018/2/4.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXProjectModel.h"

@interface YXIncludeProjectTableViewCell : UITableViewCell

@property (strong, nonatomic) NSDictionary *dict;
@property (strong, nonatomic) YXProjectModel *projectModel;
@end
