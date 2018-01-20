//
//  YXAddprojectTableViewCell.m
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXAddprojectTableViewCell.h"

#define kFont 13

@interface YXAddprojectTableViewCell ()<UITextFieldDelegate,UITextViewDelegate>

@property (strong, nonatomic) UITextField *expirDateTextField;

@property (strong, nonatomic) UITextField *nameTextField;
@property (strong, nonatomic) UITextField *howlongTextField;
@property (strong, nonatomic) UITextField *singlePriceTextField;
@property (strong, nonatomic) UITextField *cardPriceTextField;
@property (strong, nonatomic) UITextField *countTextField;

@property (strong, nonatomic) UITextField *consumeTextField;
@property (strong, nonatomic) UITextView *introduceTextView;

@property (strong, nonatomic) UIImageView *pjtImageView;

@property (strong, nonatomic) UILabel *cellNameLabel;

@property (strong, nonatomic) UILabel *classLabel;

@property (strong, nonatomic) UIImageView *arrowImgView;


@end

@implementation YXAddprojectTableViewCell

- (UIImageView *)arrowImgView
{
    if (!_arrowImgView) {
        _arrowImgView = [[UIImageView alloc] init];
        
        _arrowImgView.image = [UIImage imageNamed:@"rightArrows"];
        [self addSubview:_arrowImgView];

    }
    return _arrowImgView;
}

- (UILabel *)classLabel
{
    if (!_classLabel) {
        _classLabel = [[UILabel alloc] init];
        _classLabel.font = [UIFont systemFontOfSize:13];
        _classLabel.textColor = [UIColor grayColor];
        [self addSubview:_classLabel];

    }
    return _classLabel;
}
- (UILabel *)cellNameLabel
{
    if (!_cellNameLabel) {
        _cellNameLabel = [[UILabel alloc] init];
        _cellNameLabel.font = [UIFont systemFontOfSize:14];
        _cellNameLabel.textColor = [UIColor blackColor];
        [self addSubview:_cellNameLabel];

    }
    return _cellNameLabel;
}

- (UITextField *)expirDateTextField
{
    if (!_expirDateTextField) {
        
        _expirDateTextField = [[UITextField alloc] init];
        _expirDateTextField.font = [UIFont systemFontOfSize:kFont];
        _expirDateTextField.textColor = [UIColor grayColor];
        _expirDateTextField.delegate = self;
        [self addSubview:_expirDateTextField];

    }
    return _expirDateTextField;
}

- (UITextField *)nameTextField
{
    if (!_nameTextField) {
        
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.font = [UIFont systemFontOfSize:kFont];
        _nameTextField.textColor = [UIColor grayColor];
        _nameTextField.delegate = self;

        [self addSubview:_nameTextField];

    }
    return _nameTextField;
}
- (UITextField *)singlePriceTextField
{
    if (!_singlePriceTextField) {
        
        _singlePriceTextField = [[UITextField alloc] init];
        _singlePriceTextField.font = [UIFont systemFontOfSize:kFont];
        _singlePriceTextField.textColor = [UIColor grayColor];
        _singlePriceTextField.delegate = self;

        [self addSubview:_singlePriceTextField];

    }
    return _singlePriceTextField;
}

- (UITextField *)cardPriceTextField
{
    if (!_cardPriceTextField) {
        
        _cardPriceTextField = [[UITextField alloc] init];
        _cardPriceTextField.font = [UIFont systemFontOfSize:kFont];
        _cardPriceTextField.textColor = [UIColor grayColor];
        _cardPriceTextField.delegate = self;

        [self addSubview:_cardPriceTextField];

    }
    return _cardPriceTextField;
}
- (UITextField *)countTextField
{
    if (!_countTextField) {
        
        _countTextField = [[UITextField alloc] init];
        _countTextField.font = [UIFont systemFontOfSize:kFont];
        _countTextField.textColor = [UIColor grayColor];
        _countTextField.delegate = self;

        [self addSubview:_countTextField];

    }
    return _countTextField;
}
- (UITextField *)consumeTextField
{
    if (!_consumeTextField) {
        
        _consumeTextField = [[UITextField alloc] init];
        _consumeTextField.font = [UIFont systemFontOfSize:kFont];
        _consumeTextField.textColor = [UIColor grayColor];
        _consumeTextField.delegate = self;

        [self addSubview:_consumeTextField];

    }
    return _consumeTextField;
}
- (UITextView *)introduceTextView
{
    if (!_introduceTextView) {
        
        _introduceTextView = [[UITextView alloc] init];
        _introduceTextView.font = [UIFont systemFontOfSize:kFont];
        _introduceTextView.textColor = [UIColor blackColor];
        _introduceTextView.delegate = self;

        [self addSubview:_introduceTextView];

    }
    return _introduceTextView;
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
    [super layoutSubviews];
}

- (void)setCellName:(NSString *)cellName
{
    _cellName = cellName;
    
    self.cellNameLabel.frame = CGRectMake(10, 15, 200, 30);
    
    self.cellNameLabel.text = cellName;
    
    [self.cellNameLabel sizeToFit];
    self.arrowImgView.hidden = YES;
    self.pjtImageView.hidden = YES;
    self.expirDateTextField.hidden = YES;
    self.nameTextField.hidden = YES;
    self.howlongTextField.hidden = YES;
    self.singlePriceTextField.hidden = YES;
    self.cardPriceTextField.hidden = YES;
    self.countTextField.hidden = YES;
    self.consumeTextField.hidden = YES;
    self.introduceTextView.hidden = YES;
    self.classLabel.hidden = YES;
    self.consumeTextField.hidden = YES;


    
    if ([cellName isEqualToString:@"选择类别"])
    {
        self.classLabel.hidden = NO;
        self.arrowImgView.hidden = NO;
        self.classLabel.backgroundColor = [UIColor redColor];
        
        CGFloat arrowImgViewW = 20;
        CGFloat arrowImgViewH = 20;
        CGFloat arrowImgViewX = SCREEN_WIDTH - arrowImgViewW - 20;
        CGFloat arrowImgViewY = 15;

        self.arrowImgView.frame = CGRectMake(arrowImgViewX, arrowImgViewY, arrowImgViewW, arrowImgViewH);
        
        CGFloat classLabelX = self.cellNameLabel.right + 50;

        self.classLabel.frame = CGRectMake(classLabelX, 10, arrowImgViewX - classLabelX, 30);
        
    }
    else if ([cellName isEqualToString:@"选择系列"])
    {
        self.classLabel.hidden = NO;
        self.arrowImgView.hidden = NO;
        self.classLabel.backgroundColor = [UIColor redColor];
        
        CGFloat arrowImgViewW = 20;
        CGFloat arrowImgViewH = 20;
        CGFloat arrowImgViewX = SCREEN_WIDTH - arrowImgViewW - 20;
        CGFloat arrowImgViewY = 15;
        
        self.arrowImgView.frame = CGRectMake(arrowImgViewX, arrowImgViewY, arrowImgViewW, arrowImgViewH);
        
        CGFloat classLabelX = self.cellNameLabel.right + 50;
        
        self.classLabel.frame = CGRectMake(classLabelX, 10, arrowImgViewX - classLabelX, 30);
        
    }
    else if ([cellName isEqualToString:@"卡类别"])
    {
        UIButton *cardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cardBtn setTitle:@"" forState:UIControlStateNormal];
        
        cardBtn.frame = CGRectMake(self.cellNameLabel.right + 30, 8, 120, 30);
        
        [self addSubview:cardBtn];
    }
    else if ([cellName isEqualToString:@"项目名称"])
    {
        self.nameTextField.hidden = NO;
        CGFloat nameTextFieldX = self.cellNameLabel.right + 50;
        
        self.nameTextField.frame = CGRectMake(nameTextFieldX, 10, SCREEN_WIDTH - nameTextFieldX - 10, 30);
        
    }
    else if ([cellName isEqualToString:@"图片"])
    {
        self.pjtImageView.hidden = NO;
        CGFloat pjtImageViewW = 200;
        
        self.pjtImageView.frame = CGRectMake(SCREEN_WIDTH - pjtImageViewW - 10, 10, pjtImageViewW, pjtImageViewW);
        
    }
    else if ([cellName isEqualToString:@"时长"])
    {
        self.howlongTextField.hidden = NO;
        
        CGFloat howlongTextFieldX = self.cellNameLabel.right + 50;

        self.howlongTextField.frame = CGRectMake(howlongTextFieldX, 10, SCREEN_WIDTH - howlongTextFieldX - 10, 30);
        
    }
    else if ([cellName isEqualToString:@"单次价格"] || [cellName isEqualToString:@"市场价格"])
    {
        
    }
    else if ([cellName isEqualToString:@"办卡价格"] || [cellName isEqualToString:@"优惠价格"])
    {
        
    }
    else if ([cellName isEqualToString:@"包含次数"] || [cellName isEqualToString:@"最多包含次数"])
    {
        
    }
    else if ([cellName isEqualToString:@"功能介绍"])
    {
        
    }
    else if ([cellName isEqualToString:@"有效期"])
    {
        
    }
    else if ([cellName isEqualToString:@"单次耗卡金额"])
    {
        
    }
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.addProVC.projectModel.name = self.nameTextField.text;
    self.addProVC.projectModel.howlong = self.howlongTextField.text;
    self.addProVC.projectModel.singlePrice = self.singlePriceTextField.text;
    self.addProVC.projectModel.cardPrice = self.cardPriceTextField.text;
    self.addProVC.projectModel.count = [NSNumber numberWithInt:self.countTextField.text.intValue];
    self.addProVC.projectModel.introduce = self.introduceTextView.text;
    self.addProVC.projectModel.marketPrice = self.singlePriceTextField.text;
    self.addProVC.projectModel.vipPrice = self.cardPriceTextField.text;
    self.addProVC.projectModel.maxIncludeCount = [NSNumber numberWithInt:self.countTextField.text.intValue];

}

@end
