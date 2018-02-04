//
//  YXProjectViewController.m
//  ruilispa
//
//  Created by 金伊贤 on 2018/1/26.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXProjectViewController.h"

#define kNameFont 22
#define klabelFont 20
#define kTextFont 20

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

@property (nonatomic, strong) UILabel *introduceLabel;

@property (strong, nonatomic) UITextView *introduceTextView;

@property (nonatomic, strong) UILabel *expirLabel;

@property (nonatomic, strong) UILabel *singelConcumLabel;

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
        _nameLabel.font = [UIFont systemFontOfSize:kNameFont];
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
        _howlongLabel.font = [UIFont systemFontOfSize:klabelFont];
        _howlongLabel.textColor = [UIColor grayColor];
        _howlongLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_howlongLabel];
    }
    return _howlongLabel;
}

- (UILabel *)expirLabel
{
    if (!_expirLabel) {
        _expirLabel = [[UILabel alloc] init];
        _expirLabel.font = [UIFont systemFontOfSize:klabelFont];
        _expirLabel.textColor = [UIColor blackColor];
        _expirLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_expirLabel];
    }
    return _expirLabel;
}

- (UILabel *)singelConcumLabel
{
    if (!_singelConcumLabel) {
        _singelConcumLabel = [[UILabel alloc] init];
        _singelConcumLabel.font = [UIFont systemFontOfSize:klabelFont];
        _singelConcumLabel.textColor = [UIColor grayColor];
        _singelConcumLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_singelConcumLabel];
    }
    return _singelConcumLabel;
}


- (UILabel *)singlePriceLabel
{
    if (!_singlePriceLabel) {
        _singlePriceLabel = [[UILabel alloc] init];
        _singlePriceLabel.font = [UIFont systemFontOfSize:klabelFont];
        _singlePriceLabel.textColor = [UIColor blackColor];
        _singlePriceLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_singlePriceLabel];
    }
    return _singlePriceLabel;
}

- (UILabel *)introduceLabel
{
    if (!_introduceLabel) {
        _introduceLabel = [[UILabel alloc] init];
        _introduceLabel.font = [UIFont systemFontOfSize:klabelFont];
        _introduceLabel.textColor = [UIColor blackColor];
        _introduceLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_introduceLabel];
    }
    return _introduceLabel;
}


- (UILabel *)cardPriceLabel
{
    if (!_cardPriceLabel) {
        _cardPriceLabel = [[UILabel alloc] init];
        _cardPriceLabel.font = [UIFont systemFontOfSize:klabelFont];
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
        _yearCardLabel.font = [UIFont systemFontOfSize:klabelFont];
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
        _countLabel.font = [UIFont systemFontOfSize:klabelFont];
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
        texView.font = [UIFont systemFontOfSize:klabelFont];
        _introduceTextView = texView;
        [self.scrollView addSubview:texView];
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
    self.iconImgView.frame = CGRectMake(10, 10, SCREEN_WIDTH - 20, 400);
    
    
    
    id model = self.model;
    
    [self setImageWithModel:model];
    
    self.nameLabel.frame = CGRectMake(10, self.iconImgView.bottom + 10, 250, 40);

    if ([model isKindOfClass:[YXProjectModel class]])
    {
        YXProjectModel *projectModel = (YXProjectModel *)model;
        
        self.navBarView.title = projectModel.projectName;
        
        self.nameLabel.text = projectModel.projectName;
        
        self.howlongLabel.textAlignment = NSTextAlignmentRight;
        
        CGFloat howlongW = 150;
        self.howlongLabel.frame = CGRectMake(SCREEN_WIDTH - howlongW - 10, self.nameLabel.y - 5, howlongW, 30);
        
        [self.nameLabel sizeToFit];
        
        self.howlongLabel.text = [NSString stringWithFormat:@"时长：%@分钟",projectModel.howlong];
        
        self.singlePriceLabel.frame = CGRectMake(self.nameLabel.x, self.nameLabel.bottom + 10, SCREEN_WIDTH, 30);

        self.cardPriceLabel.frame = CGRectMake(self.nameLabel.x, self.singlePriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.countLabel.frame = CGRectMake(self.nameLabel.x, self.cardPriceLabel.bottom + 10, SCREEN_WIDTH, 30);

        if (projectModel.isYearCard == 1)
        {
            self.yearCardLabel.frame = CGRectMake(self.nameLabel.right + 10, self.nameLabel.y - 3, 60, 30);
            self.yearCardLabel.backgroundColor = [UIColor orangeColor];
            self.yearCardLabel.text = @"年卡";
            
            self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价：¥%@",projectModel.marketPrice];
            self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价：¥%@",projectModel.vipPrice];
            
            self.countLabel.text = [NSString stringWithFormat:@"单次耗卡金额：¥%@",projectModel.singleConsumePrice];
            
            self.expirLabel.frame = CGRectMake(self.nameLabel.x, self.countLabel.bottom + 10, SCREEN_WIDTH, 30);
            

            self.expirLabel.text = [NSString stringWithFormat:@"过期时间：%d个月",projectModel.expirCount];
            
            self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.expirLabel.bottom + 10, SCREEN_WIDTH, 30);
            
            self.introduceLabel.text = @"功能介绍：";
            
            self.introduceTextView.frame = CGRectMake(self.nameLabel.x, self.introduceLabel.bottom + 10, SCREEN_WIDTH - 20, 120);
            self.introduceTextView.text = projectModel.introduce;
        }
        else
        {
            self.singlePriceLabel.text = [NSString stringWithFormat:@"单次价：¥%@",projectModel.singlePrice];
            self.cardPriceLabel.text = [NSString stringWithFormat:@"办卡价：¥%@",projectModel.cardPrice];
            
            self.countLabel.text = [NSString stringWithFormat:@"包含次数：%d",projectModel.count];
            
            self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.countLabel.bottom + 10, SCREEN_WIDTH, 30);
            
            self.introduceLabel.text = @"功能介绍：";
            
            self.introduceTextView.frame = CGRectMake(self.nameLabel.x, self.introduceLabel.bottom + 10, SCREEN_WIDTH - 20, 120);
            self.introduceTextView.text = projectModel.introduce;

        }
        
        
        
    }
    if ([model isKindOfClass:[YXProductModel class]])
    {
        YXProductModel *projectModel = (YXProductModel *)model;
        
        self.navBarView.title = projectModel.productName;
        
        self.nameLabel.text = projectModel.productName;

        self.howlongLabel.textAlignment = NSTextAlignmentRight;
        
        CGFloat howlongW = 150;
        self.howlongLabel.frame = CGRectMake(SCREEN_WIDTH - howlongW - 10, self.nameLabel.y - 5, howlongW, 30);
        
        [self.nameLabel sizeToFit];
        
        self.howlongLabel.text = [NSString stringWithFormat:@"公司：%@",projectModel.brand];

        self.expirLabel.frame = CGRectMake(self.nameLabel.x, self.nameLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.expirLabel.text = [NSString stringWithFormat:@"适用部位：%@",projectModel.usePart];
        
        self.singlePriceLabel.frame = CGRectMake(self.nameLabel.x, self.expirLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.cardPriceLabel.frame = CGRectMake(self.nameLabel.x, self.singlePriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价：¥%@",projectModel.marketPrice];
        self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价：¥%@",projectModel.vipPrice];
        
        
        self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.cardPriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.introduceLabel.text = @"功能介绍：";
        
        self.introduceTextView.frame = CGRectMake(self.nameLabel.x, self.introduceLabel.bottom + 10, SCREEN_WIDTH - 20, 120);
        self.introduceTextView.text = projectModel.introduce;
        

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

    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.introduceTextView.bottom + 50);

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
