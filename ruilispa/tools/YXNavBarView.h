//
//  YXNavBarView.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^YXNAVTapBlock)(void);

@interface YXNavBarView : UIView


@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *leftBtnTitle;

@property (nonatomic, copy) NSString *rightBtnTitle;

@property (nonatomic, copy) YXNAVTapBlock backBlock;

@property (nonatomic, copy) YXNAVTapBlock rightTapBlock;

@property (nonatomic, copy) YXNAVTapBlock callingBlock;

@property (nonatomic, strong) UIView *topLine;

//顶部控件
@property (nonatomic, strong) UIView *topView;

//title控件
@property (nonatomic, strong) UILabel *titleLabel;

//右键
@property (nonatomic, strong) UIButton *rightBtn;

//返回按钮
@property (nonatomic, strong) UIButton *backBtn;

//设置title居中，默认是居中
@property (nonatomic, assign) BOOL titleMustCenter;


- (void)setMyNavBarWithTitle:(NSString *)title leftBtnTitle:(NSString *)leftTitle leftBtnImgName:(NSString *)leftImgName rightBtnTitle:(NSString *)rightTitle rightBtnImgName:(NSString *)rightImgName;

/**设置frame 适应横屏*/
- (void)initSubViewFrame;
@end
