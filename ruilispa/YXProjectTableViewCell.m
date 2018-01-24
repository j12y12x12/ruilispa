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
        
        _iconImgView.contentMode = UIViewContentModeScaleToFill;
        
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
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)yearCardLabel
{
    if (!_yearCardLabel) {
        _yearCardLabel = [[UILabel alloc] init];
        _yearCardLabel.font = [UIFont systemFontOfSize:13];
        _yearCardLabel.textColor = [UIColor whiteColor];
        _yearCardLabel.textAlignment = NSTextAlignmentLeft;
        _yearCardLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_yearCardLabel];
    }
    return _yearCardLabel;
}


- (UILabel *)singlePriceLabel
{
    if (!_singlePriceLabel) {
        _singlePriceLabel = [[UILabel alloc] init];
        _singlePriceLabel.font = [UIFont systemFontOfSize:14];
        _singlePriceLabel.textColor = [UIColor blackColor];
        _singlePriceLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_singlePriceLabel];
    }
    return _nameLabel;
}


- (UILabel *)cardPriceLabel
{
    if (!_cardPriceLabel) {
        _cardPriceLabel = [[UILabel alloc] init];
        _cardPriceLabel.font = [UIFont systemFontOfSize:14];
        _cardPriceLabel.textColor = [UIColor blackColor];
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
    
    if ([cellModel isKindOfClass:[YXProjectModel class]])
    {
        
    }
    if ([cellModel isKindOfClass:[YXProductModel class]])
    {
        
    }    if ([cellModel isKindOfClass:[YXMealCardModel class]])
    {
        
    }    if ([cellModel isKindOfClass:[YXChargeCardModel class]])
    {
        
    }
    
}

@end
