//
//  YXSelectProjectTableViewCell.m
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXSelectProjectTableViewCell.h"

@interface YXSelectProjectTableViewCell ()

@property (nonatomic, strong) UIImageView *selectImageView;

@end


@implementation YXSelectProjectTableViewCell

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
    
    self.selectImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.selectImageView.image = [UIImage imageNamed:@"cellSelected"];
    self.selectImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.selectImageView.backgroundColor = [UIColor clearColor];
    self.selectImageView.hidden = YES;
    [self addSubview:self.selectImageView];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.selectImageView.frame = CGRectMake(CGRectGetWidth(self.frame)-30, (CGRectGetHeight(self.frame)-10)/2, 12, 10);
    
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    
    if (isSelected)
    {
        self.selectImageView.hidden = NO;
    }
    else
    {
        self.selectImageView.hidden = YES;
    }
}

@end
