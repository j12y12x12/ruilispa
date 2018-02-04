//
//  YXProjectViewController.m
//  ruilispa
//
//  Created by 金伊贤 on 2018/1/26.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXProjectViewController.h"

@interface YXProjectViewController ()

@property (strong, nonatomic) YXNavBarView *navBarView;

@property (nonatomic, strong) YXProjectModel *projectModel;
@property (nonatomic, strong) YXProductModel *productModel;
@property (nonatomic, strong) YXMealCardModel *mealCardModel;
@property (nonatomic, strong) YXChargeCardModel *hargeCardModel;

@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *yearCardLabel;

@property (nonatomic, strong) UILabel *singlePriceLabel;

@property (nonatomic, strong) UILabel *cardPriceLabel;

@property (nonatomic, strong) UILabel *howlongLabel;

@property (nonatomic, strong) UILabel *countLabel;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UITextView *introduceTextView;


@end

@implementation YXProjectViewController

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.frame = CGRectMake(0, 64, self.view.width, self.view.height - 64);
        
        scrollView.bounces = YES;
        
        _scrollView = scrollView;
        
        [self.view addSubview:_scrollView];
    }
    
    return _scrollView;
    
}

- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        
        _iconImgView.contentMode = UIViewContentModeScaleAspectFit;
        
        _iconImgView.backgroundColor = [UIColor orangeColor];
        [self.scrollView addSubview:_iconImgView];
    }
    return _iconImgView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)howlongLabel
{
    if (!_howlongLabel) {
        _howlongLabel = [[UILabel alloc] init];
        _howlongLabel.font = [UIFont systemFontOfSize:14];
        _howlongLabel.textColor = [UIColor grayColor];
        _howlongLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_howlongLabel];
    }
    return _howlongLabel;
}

- (UILabel *)singlePriceLabel
{
    if (!_singlePriceLabel) {
        _singlePriceLabel = [[UILabel alloc] init];
        _singlePriceLabel.font = [UIFont systemFontOfSize:14];
        _singlePriceLabel.textColor = [UIColor blackColor];
        _singlePriceLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_singlePriceLabel];
    }
    return _singlePriceLabel;
}

- (UILabel *)cardPriceLabel
{
    if (!_cardPriceLabel) {
        _cardPriceLabel = [[UILabel alloc] init];
        _cardPriceLabel.font = [UIFont systemFontOfSize:14];
        _cardPriceLabel.textColor = [UIColor blackColor];
        _cardPriceLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_cardPriceLabel];
    }
    return _cardPriceLabel;
}

- (UILabel *)yearCardLabel
{
    if (!_yearCardLabel) {
        _yearCardLabel = [[UILabel alloc] init];
        _yearCardLabel.font = [UIFont systemFontOfSize:14];
        _yearCardLabel.textColor = [UIColor blackColor];
        _yearCardLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_yearCardLabel];
    }
    return _yearCardLabel;
}

- (UILabel *)countLabel
{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = [UIFont systemFontOfSize:14];
        _countLabel.textColor = [UIColor blackColor];
        _countLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_countLabel];
    }
    return _countLabel;
}

- (UITextView *)introduceTextView
{
    if (!_introduceTextView) {
        UITextView *texView = [[UITextView alloc] init];
        texView.editable = NO;
        
        texView.layer.borderColor = [UIColor grayColor].CGColor;
        texView.layer.borderWidth = 1.0;
        texView.layer.cornerRadius = 5.0;
        
        _introduceTextView = texView;
    }
    
    return _introduceTextView;
}





- (void)iniNavbarView
{
    self.navBarView = [[YXNavBarView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64)];
    
    [self.navBarView setMyNavBarWithTitle:@"" leftBtnTitle:@"返回" leftBtnImgName:@"ImageShow_Back" rightBtnTitle:nil rightBtnImgName:nil];
    [self.view addSubview:self.navBarView];
    
    WS
    self.navBarView.backBlock = ^(void){
        
        SS
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    self.navBarView.rightTapBlock = ^{
        
    };
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self iniNavbarView];
    self.iconImgView.frame = CGRectMake(10, 10, SCREEN_WIDTH - 20, 200);
    
    
    
    id model = self.model;
    
    [self setImageWithModel:model];
    
    self.nameLabel.frame = CGRectMake(10, self.iconImgView.bottom + 10, 250, 40);

    if ([model isKindOfClass:[YXProjectModel class]])
    {
        YXProjectModel *projectModel = (YXProjectModel *)model;
        
        self.navBarView.title = projectModel.projectName;
        
        self.nameLabel.text = projectModel.projectName;
        
        
        [self.nameLabel sizeToFit];
        
        
        
    }
    if ([model isKindOfClass:[YXProductModel class]])
    {
        YXProductModel *projectModel = (YXProductModel *)model;
        
        self.navBarView.title = projectModel.productName;

    }
    if ([model isKindOfClass:[YXMealCardModel class]])
    {
        YXMealCardModel *projectModel = (YXMealCardModel *)model;
        self.navBarView.title = projectModel.mealCardName;

    }
    if ([model isKindOfClass:[YXChargeCardModel class]])
    {
        YXChargeCardModel *projectModel = (YXChargeCardModel *)model;
        self.navBarView.title = projectModel.chargeCardName;

        
    }

}



- (void)setImageWithModel:(id)model
{
    if ([model isKindOfClass:[YXProjectModel class]])
    {
        YXProjectModel *projectModel = (YXProjectModel *)model;
        NSString *imgPath = projectModel.imagePath;
        
        UIImage *pjtImg = [UIImage imageNamed:imgPath];
        
        if (pjtImg)
        {
            self.iconImgView.image = pjtImg;
        }
        else
        {
            pjtImg = [UIImage imageWithContentsOfFile:imgPath];
            
            if (pjtImg)
            {
                self.iconImgView.image = pjtImg;
            }
            else
            {
                self.iconImgView.image = [UIImage imageNamed:@"defaultImg.jpeg"];
            }
        }
        
        
    }
    if ([model isKindOfClass:[YXProductModel class]])
    {
        YXProductModel *projectModel = (YXProductModel *)model;
        NSString *imgPath = projectModel.imagePath;
        
        UIImage *pjtImg = [UIImage imageNamed:imgPath];
        
        if (pjtImg)
        {
            self.iconImgView.image = pjtImg;
        }
        else
        {
            pjtImg = [UIImage imageWithContentsOfFile:imgPath];
            
            if (pjtImg)
            {
                self.iconImgView.image = pjtImg;
            }
            else
            {
                self.iconImgView.image = [UIImage imageNamed:@"defaultImg.jpeg"];
            }
        }
        
    }
    if ([model isKindOfClass:[YXMealCardModel class]])
    {
        YXMealCardModel *projectModel = (YXMealCardModel *)model;
        NSString *imgPath = projectModel.imagePath;
        
        UIImage *pjtImg = [UIImage imageNamed:imgPath];
        
        if (pjtImg)
        {
            self.iconImgView.image = pjtImg;
        }
        else
        {
            pjtImg = [UIImage imageWithContentsOfFile:imgPath];
            
            if (pjtImg)
            {
                self.iconImgView.image = pjtImg;
            }
            else
            {
                self.iconImgView.image = [UIImage imageNamed:@"defaultImg.jpeg"];
            }
        }
        
    }
    if ([model isKindOfClass:[YXChargeCardModel class]])
    {
        YXChargeCardModel *projectModel = (YXChargeCardModel *)model;
        NSString *imgPath = projectModel.imagePath;
        
        UIImage *pjtImg = [UIImage imageNamed:imgPath];
        
        if (pjtImg)
        {
            self.iconImgView.image = pjtImg;
        }
        else
        {
            pjtImg = [UIImage imageWithContentsOfFile:imgPath];
            
            if (pjtImg)
            {
                self.iconImgView.image = pjtImg;
            }
            else
            {
                self.iconImgView.image = [UIImage imageNamed:@"defaultImg.jpeg"];
            }
        }
        
    }
    
    
}


@end
