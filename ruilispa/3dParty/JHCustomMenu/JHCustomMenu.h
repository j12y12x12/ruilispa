//
//  SecondMenuView.h
//  LoveBB
//
//  Created by AngelLL on 15/10/22.
//  Copyright © 2015年 Daniel_Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JHCustomMenuDelegate <NSObject>

- (void)jhCustomMenu:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath WithIs3DTouch:(BOOL)isYES;

@end

typedef void(^Dismiss)(void);
@interface JHCustomMenu : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) id<JHCustomMenuDelegate> delegate;
@property (nonatomic, strong) NSArray *arrData;
@property (nonatomic, strong) NSArray *arrImgName;
@property (nonatomic, copy) Dismiss dismiss;

@property (nonatomic, assign) BOOL isOfficialMenu;

- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight;

- (void)dismissWithCompletion:(void (^)(JHCustomMenu *object))completion;
@end
