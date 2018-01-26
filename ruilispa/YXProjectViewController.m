//
//  YXProjectViewController.m
//  ruilispa
//
//  Created by 金伊贤 on 2018/1/26.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXProjectViewController.h"

@interface YXProjectViewController ()

@property (nonatomic, strong) YXProjectModel *projectModel;
@property (nonatomic, strong) YXProductModel *productModel;
@property (nonatomic, strong) YXMealCardModel *mealCardModel;
@property (nonatomic, strong) YXChargeCardModel *hargeCardModel;

@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *yearCardLabel;

@property (nonatomic, strong) UILabel *singlePriceLabel;

@property (nonatomic, strong) UILabel *cardPriceLabel;


@end

@implementation YXProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id model = self.model;
    if ([model isKindOfClass:[YXProjectModel class]])
    {
        YXProjectModel *projectModel = (YXProjectModel *)model;
        
        
    }
    if ([model isKindOfClass:[YXProductModel class]])
    {
        YXProductModel *projectModel = (YXProductModel *)model;
        
    }
    if ([model isKindOfClass:[YXMealCardModel class]])
    {
        YXMealCardModel *projectModel = (YXMealCardModel *)model;
        
    }
    if ([model isKindOfClass:[YXChargeCardModel class]])
    {
        YXChargeCardModel *projectModel = (YXChargeCardModel *)model;

        
    }

}


@end
