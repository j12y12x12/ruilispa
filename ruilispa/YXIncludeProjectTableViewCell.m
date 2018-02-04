//
//  YXIncludeProjectTableViewCell.m
//  ruilispa
//
//  Created by jin on 2018/2/4.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXIncludeProjectTableViewCell.h"


@interface YXIncludeProjectTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *countLbel;

@property (nonatomic, strong) UIImageView *arrowImageView;


@end



@implementation YXIncludeProjectTableViewCell


- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:_arrowImageView];
    }
    return _arrowImageView;
}


- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        
        _iconImgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:_iconImgView];
    }
    return _iconImgView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)countLbel
{
    if (!_countLbel) {
        _countLbel = [[UILabel alloc] init];
        _countLbel.font = [UIFont systemFontOfSize:16];
        _countLbel.textColor = [UIColor blackColor];
        _countLbel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_countLbel];
    }
    return _countLbel;
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
    
}

- (void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    self.iconImgView.frame = CGRectMake(10, 10, 120, 100 - 20);
    self.backgroundColor = RGBACOLOR(250, 250, 250, 1);
    [[YXSQLManager shareManager] searchProjectWithName:dict[@"name"] callBackBlock:^(YXProjectModel *projectModel) {
        
        self.projectModel = projectModel;
        
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
        
        CGFloat nameH = 35;
        self.nameLabel.frame = CGRectMake(self.iconImgView.right + 10, (100 - nameH)/2, 150, nameH);
        self.nameLabel.text = projectModel.projectName;
        
        CGFloat arrowW = 20;
        self.arrowImageView.frame = CGRectMake(self.width - arrowW - 10, self.nameLabel.y+10, arrowW, arrowW);
        self.arrowImageView.image = [UIImage imageNamed:@"rightArrows"];
        
        CGFloat countW = 40;
        self.countLbel.frame = CGRectMake(self.arrowImageView.left - countW - 10, self.nameLabel.y+5, countW, 30);
        self.countLbel.text = [NSString stringWithFormat:@"%@次",dict[@"count"]];
        
        
    }];
    
    
}


@end
