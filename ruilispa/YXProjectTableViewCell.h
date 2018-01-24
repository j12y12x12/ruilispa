//
//  YXProjectTableViewCell.h
//  ruilispa
//
//  Created by jin on 2018/1/24.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXProjectTableViewCell : UITableViewCell

@property (assign, nonatomic) YXCellType cellType;

@property (strong, nonatomic) id cellModel;

@end
