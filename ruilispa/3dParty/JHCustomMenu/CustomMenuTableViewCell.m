//
//  CustomMenuTableViewCell.m
//  reliao
//
//  Created by 金伊贤 on 16/8/17.
//
//

#import "CustomMenuTableViewCell.h"

@implementation CustomMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        CGFloat iconX = 15;
        CGFloat iconY = 10;
        CGFloat iconW = 24;
        CGFloat iconH = iconW;
        
        
        UIImageView *itemImgView = [[UIImageView alloc] initWithFrame:CGRectMake(iconX, iconY, iconW, iconH)];
        self.itemImgView = itemImgView;
        
        [self.contentView addSubview:itemImgView];
        
        
        CGFloat nameLabelX = CGRectGetMaxX(itemImgView.frame) + 10;
        CGFloat nameLabelY = 10;
        CGFloat nameLabelW = SCREEN_WIDTH - iconW - 42;
        CGFloat nameLabelH = 25;
        
        UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH)];
        itemLabel.textAlignment = NSTextAlignmentLeft;
        itemLabel.textColor = [UIColor blackColor];
        itemLabel.font = [UIFont systemFontOfSize:16];
        self.itemLabel = itemLabel;
        [self.contentView addSubview:itemLabel];
        
    }
    return self;
    
}


@end
