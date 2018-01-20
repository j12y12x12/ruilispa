//
//  YXAddprojectTableViewCell.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXProjectModel.h"
#import "YXAddProjectViewController.h"

@interface YXAddprojectTableViewCell : UITableViewCell

@property (strong, nonatomic) YXAddProjectViewController *addProVC;

@property (strong, nonatomic) NSString *cellName;

@end
