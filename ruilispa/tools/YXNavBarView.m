//
//  YXNavBarView.m
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXNavBarView.h"

//顶部细线颜色
#define TopBarLineColor [[UIColor lightGrayColor] colorWithAlphaComponent:0.5]
//顶部控件高度
#define BackButton_Width 100

#define kNavHeight 64

@interface YXNavBarView ()

@end


@implementation YXNavBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    //顶部控件
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), kNavHeight)];
    self.topView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
    [self addSubview:self.topView];
    
    //顶部控件细线
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame)-0.5, CGRectGetWidth(self.topView.frame), 0.5)];
    topLine.backgroundColor = [HEX_COLOR(0xd9d9d9) colorWithAlphaComponent:0.5];
    self.topLine = topLine;
    [self.topView addSubview:topLine];
    
    //title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, kNavHeight - 44, CGRectGetWidth(self.topView.frame)-20,44)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.topView addSubview:self.titleLabel];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(5, kNavHeight - 44, BackButton_Width,44);
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.backBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backBtn setImage:[UIImage imageNamed:@"ImageShow_Back"] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.backBtn];
    self.backBtn.hidden = YES;
    
    //选择按钮
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(CGRectGetWidth(self.frame)-44-5, kNavHeight - 44, 44, 44);
    self.rightBtn.backgroundColor = [UIColor clearColor];
    [self.rightBtn setImage:[UIImage imageNamed:@"web_more"] forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.rightBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.topView addSubview:self.rightBtn];
    self.rightBtn.hidden = YES;
    
    self.titleMustCenter = YES;
}

- (void)backAction:(id)sender
{
    if (self.backBlock)
    {
        self.backBlock();
    }
}

- (void)selectAction:(id)sender
{
    if (self.rightTapBlock)
    {
        self.rightTapBlock();
    }
}

- (void)callAction:(id)sender
{
    if (self.callingBlock)
    {
        self.callingBlock();
    }
}

- (void)setTitle:(NSString *)title
{
    //如果相同，则不再继续重设了
    if ([title isEqualToString:_title])
    {
        return;
    }
    
    NSLog(@"Title Label :%@",self.titleLabel);
    
    _title = title;
    self.titleLabel.text = title;
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.backBtn.frame), CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(self.frame)-CGRectGetMaxX(self.backBtn.frame)*2, CGRectGetHeight(self.titleLabel.frame));
    if (!self.titleMustCenter)
    {
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.backBtn.frame), CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(self.frame)-CGRectGetMaxX(self.backBtn.frame)-CGRectGetWidth(self.rightBtn.frame)-5, CGRectGetHeight(self.titleLabel.frame));
    }
    
}

- (void)setLeftBtnTitle:(NSString *)leftBtnTitle
{
    _leftBtnTitle = leftBtnTitle;
    [self.backBtn setTitle:leftBtnTitle forState:UIControlStateNormal];
    self.backBtn.hidden = YES;
    if (leftBtnTitle)
    {
        self.backBtn.hidden = NO;
    }
    
    CGSize size = [leftBtnTitle boundingRectWithSize:CGSizeMake(MAXFLOAT,44) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    
    self.backBtn.frame = CGRectMake(5,kNavHeight - 44, size.width+25, 44);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.backBtn.frame), CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(self.frame)-CGRectGetMaxX(self.backBtn.frame)*2, CGRectGetHeight(self.titleLabel.frame));
    if (!self.titleMustCenter)
    {
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.backBtn.frame), CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(self.frame)-CGRectGetMaxX(self.backBtn.frame)-CGRectGetWidth(self.rightBtn.frame)-5, CGRectGetHeight(self.titleLabel.frame));
    }
}

- (void)setRightBtnTitle:(NSString *)rightBtnTitle
{
    _rightBtnTitle = rightBtnTitle;
    [self.rightBtn setTitle:rightBtnTitle forState:UIControlStateNormal];
    self.rightBtn.hidden = YES;
    if (rightBtnTitle)
    {
        self.rightBtn.hidden = NO;
    }
}


- (void)setMyNavBarWithTitle:(NSString *)title leftBtnTitle:(NSString *)leftTitle leftBtnImgName:(NSString *)leftImgName rightBtnTitle:(NSString *)rightTitle rightBtnImgName:(NSString *)rightImgName
{
    _title = title;
    self.titleLabel.text = title;
    self.title = title;
    CGSize size = [leftTitle boundingRectWithSize:CGSizeMake(MAXFLOAT,44) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    
    CGFloat backBtnW = size.width+25;
    
    if (size.width == 0)
    {
        backBtnW = 90;
    }
    
    self.backBtn.frame = CGRectMake(5, kNavHeight - 44,backBtnW, 44);
    
    self.backBtn.backgroundColor = [UIColor clearColor];
    [self.backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backBtn setImage:nil forState:UIControlStateNormal];
    [self.backBtn setTitle:nil forState:UIControlStateNormal];
    self.backBtn.hidden = YES;
    
    if (leftImgName)
    {
        UIImage *backButtonBgImage = [UIImage imageNamed:leftImgName];
        backButtonBgImage = [backButtonBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonBgImage.size.width-1, 0, 0)];
        [self.backBtn setImage:backButtonBgImage forState:UIControlStateNormal];
        
        self.backBtn.hidden = NO;
    }
    if (leftTitle)
    {
        [self.backBtn setTitle:leftTitle forState:UIControlStateNormal];
        self.backBtn.hidden = NO;
    }
    
    self.rightBtn.frame = CGRectMake(CGRectGetWidth(self.frame)-44-5,kNavHeight - 44, 44, 44);
    self.rightBtn.backgroundColor = [UIColor clearColor];
    [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightBtn setImage:nil forState:UIControlStateNormal];
    [self.rightBtn setTitle:nil forState:UIControlStateNormal];
    self.rightBtn.hidden = YES;
    
    if (rightImgName)
    {
        [self.rightBtn setImage:[UIImage imageNamed:rightImgName] forState:UIControlStateNormal];
        
        NSString *backgroundImageHL = [NSString stringWithFormat:@"%@_HL",rightImgName];
        UIImage *bgImageHL = [UIImage imageNamed:backgroundImageHL];
        [self.backBtn setImage:bgImageHL forState:UIControlStateHighlighted];
        
        self.rightBtn.hidden = NO;
    }
    if (rightTitle)
    {
        [self.rightBtn setTitle:rightTitle forState:UIControlStateNormal];
        self.rightBtn.hidden = NO;
    }
    
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.backBtn.frame), CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(self.frame)-CGRectGetMaxX(self.backBtn.frame)*2, CGRectGetHeight(self.titleLabel.frame));
    if (!self.titleMustCenter)
    {
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.backBtn.frame), CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(self.frame)-CGRectGetMaxX(self.backBtn.frame)-CGRectGetWidth(self.rightBtn.frame)-5, CGRectGetHeight(self.titleLabel.frame));
    }
    
}


- (void)initSubViewFrame
{
    CGFloat navBarHeight = 0;
    
    if ([[UIApplication sharedApplication] statusBarOrientation] ==  UIInterfaceOrientationLandscapeLeft || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)
    {
        NSLog(@"横屏");
        navBarHeight = 64;
    }
    else
    {
        NSLog(@"竖屏");
        navBarHeight = kNavHeight;
    }
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH,navBarHeight);
    CGSize size = [self.backBtn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT,44) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    
    CGFloat backBtnW = size.width+25;
    
    if (size.width == 0)
    {
        backBtnW = 90;
    }
    
    self.topView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), kNavHeight);
    
    self.backBtn.frame = CGRectMake(5, navBarHeight - 44,backBtnW, 44);
    
    self.rightBtn.frame = CGRectMake(CGRectGetWidth(self.frame)-44-5, navBarHeight - 44, 44, 44);
    
    self.titleLabel.y = navBarHeight - 44;
    self.topLine.frame = CGRectMake(0, CGRectGetMaxY(self.topView.frame)-0.5, CGRectGetWidth(self.topView.frame), 0.5);
    
}



@end
