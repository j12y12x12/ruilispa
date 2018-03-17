//
//  YXProjectTableViewCell.m
//  ruilispa
//
//  Created by jin on 2018/1/24.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXProjectTableViewCell.h"


@interface YXProjectTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *yearCardLabel;

@property (nonatomic, strong) UILabel *singlePriceLabel;

@property (nonatomic, strong) UILabel *cardPriceLabel;


@end

@implementation YXProjectTableViewCell

- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        
        _iconImgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:_iconImgView];        
    }
    return _iconImgView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)yearCardLabel
{
    if (!_yearCardLabel) {
        _yearCardLabel = [[UILabel alloc] init];
        _yearCardLabel.font = [UIFont systemFontOfSize:15];
        _yearCardLabel.textColor = [UIColor whiteColor];
        _yearCardLabel.textAlignment = NSTextAlignmentLeft;
        _yearCardLabel.backgroundColor = kVipColor;
        [self addSubview:_yearCardLabel];
    }
    return _yearCardLabel;
}


- (UILabel *)singlePriceLabel
{
    if (!_singlePriceLabel) {
        _singlePriceLabel = [[UILabel alloc] init];
        _singlePriceLabel.font = [UIFont systemFontOfSize:18];
        _singlePriceLabel.textColor = [UIColor blackColor];
        _singlePriceLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_singlePriceLabel];
    }
    return _singlePriceLabel;
}


- (UILabel *)cardPriceLabel
{
    if (!_cardPriceLabel) {
        _cardPriceLabel = [[UILabel alloc] init];
        _cardPriceLabel.font = [UIFont systemFontOfSize:18];
        _cardPriceLabel.textColor = kVipColor;
        _cardPriceLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_cardPriceLabel];
    }
    return _cardPriceLabel;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
//    self.iconImgView.frame = CGRectMake(10, 10, 120, 100);
//
//    self.nameLabel.frame = CGRectMake(self.iconImgView.right + 5, 10, 120, 30);
//
//    self.singlePriceLabel.frame
    
    self.iconImgView.hidden = YES;
    self.nameLabel.hidden = YES;
    self.yearCardLabel.hidden = YES;
    self.singlePriceLabel.hidden = YES;
    self.cardPriceLabel.hidden = YES;

    
}

- (void)setCellModel:(id)cellModel
{
    _cellModel = cellModel;
    
    self.iconImgView.hidden = NO;
    self.nameLabel.hidden = NO;

    self.iconImgView.frame = CGRectMake(10, 10, 200, 130);
    self.yearCardLabel.hidden = YES;
    self.singlePriceLabel.hidden = YES;
    self.cardPriceLabel.hidden = YES;

    self.singlePriceLabel.textColor = [UIColor blackColor];

    [self setImageWithModel:cellModel];

    
    self.nameLabel.frame = CGRectMake(self.iconImgView.right + 10, 20, 250, 30);
    self.singlePriceLabel.frame = CGRectMake(self.iconImgView.right + 10, self.nameLabel.bottom + 10, 180, 30);
    self.cardPriceLabel.frame = CGRectMake(self.iconImgView.right + 10, self.singlePriceLabel.bottom + 10, 200, 30);

    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.singlePriceLabel.backgroundColor = [UIColor clearColor];
    self.cardPriceLabel.backgroundColor = [UIColor clearColor];

    if ([cellModel isKindOfClass:[YXProjectModel class]])
    {
        YXProjectModel *projectModel = (YXProjectModel *)cellModel;
        
        self.nameLabel.text = projectModel.projectName;
        
        [self.nameLabel sizeToFit];
        self.singlePriceLabel.hidden = NO;
        self.cardPriceLabel.hidden = NO;

        if (projectModel.isYearCard == 1)
        {
            
            self.yearCardLabel.hidden = NO;
            self.yearCardLabel.frame = CGRectMake(self.nameLabel.right + 15, 22, 50, 20);
            self.yearCardLabel.text = @"年卡";
            [self.yearCardLabel sizeToFit];
            self.yearCardLabel.layer.cornerRadius = 3;

            self.yearCardLabel.layer.masksToBounds = YES;
            self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价 ¥%@",projectModel.marketPrice];
            self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价 ¥%@",projectModel.vipPrice];
            

        }
        else
        {
            self.singlePriceLabel.text = [NSString stringWithFormat:@"单次 ¥%@",projectModel.singlePrice];
            self.cardPriceLabel.text = [NSString stringWithFormat:@"办卡 ¥%@/%d次",projectModel.cardPrice,projectModel.count];
        }
        
        
        
    }
    if ([cellModel isKindOfClass:[YXProductModel class]])
    {
        self.singlePriceLabel.hidden = NO;
        self.cardPriceLabel.hidden = NO;

        YXProductModel *projectModel = (YXProductModel *)cellModel;
        self.nameLabel.text = projectModel.productName;

        self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价 ¥%@",projectModel.marketPrice];
        self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价 ¥%@",projectModel.vipPrice];

    }
    if ([cellModel isKindOfClass:[YXMealCardModel class]])
    {
        self.singlePriceLabel.hidden = NO;
        self.cardPriceLabel.hidden = NO;

        YXMealCardModel *projectModel = (YXMealCardModel *)cellModel;

        self.nameLabel.text = projectModel.mealCardName;
        
        self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价 ¥%@",projectModel.marketPrice];
        self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价 ¥%@",projectModel.vipPrice];

        
    }
    if ([cellModel isKindOfClass:[YXChargeCardModel class]])
    {
        self.nameLabel.y = 30;
        self.singlePriceLabel.y = self.nameLabel.bottom + 20;
        self.singlePriceLabel.hidden = NO;
        YXChargeCardModel *projectModel = (YXChargeCardModel *)cellModel;
        self.nameLabel.text = projectModel.chargeCardName;
        
        self.singlePriceLabel.textColor = kVipColor;
        self.singlePriceLabel.text = [NSString stringWithFormat:@"充值 ¥%@",projectModel.chargeMoney];

        
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
