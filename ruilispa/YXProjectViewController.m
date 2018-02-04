//
//  YXProjectViewController.m
//  ruilispa
//
//  Created by 金伊贤 on 2018/1/26.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXProjectViewController.h"
#import "YXIncludeProjectTableViewCell.h"

#define kNameFont 22
#define klabelFont 20
#define kTextFont 18

@interface YXProjectViewController ()<UITableViewDataSource,UITableViewDelegate>

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

@property (strong, nonatomic) UITableView *mealTableView;

@property (strong, nonatomic) NSMutableArray *dataArray;
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
        
        _iconImgView.backgroundColor = TABLEVIEW_COLOR;
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
        _cardPriceLabel.textColor = kVipColor;
        _cardPriceLabel.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:_cardPriceLabel];
    }
    return _cardPriceLabel;
}

- (UILabel *)yearCardLabel
{
    if (!_yearCardLabel) {
        _yearCardLabel = [[UILabel alloc] init];
        _yearCardLabel.font = [UIFont systemFontOfSize:17];
        _yearCardLabel.textColor = [UIColor whiteColor];
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
        
        texView.layer.borderColor = RGBACOLOR(220, 220, 220, 1).CGColor;
        texView.layer.borderWidth = 1.0;
        texView.layer.cornerRadius = 5.0;
        texView.font = [UIFont systemFontOfSize:kTextFont];
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
            self.yearCardLabel.hidden = NO;
            self.yearCardLabel.frame = CGRectMake(self.nameLabel.right + 10, self.nameLabel.y + 4, 50, 25);
            self.yearCardLabel.text = @"年卡";
            self.yearCardLabel.backgroundColor = kVipColor;
            self.yearCardLabel.textColor = [UIColor whiteColor];
            self.yearCardLabel.layer.cornerRadius = 4;
            self.yearCardLabel.layer.masksToBounds = YES;
            [self.yearCardLabel sizeToFit];
            self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价：¥%@",projectModel.marketPrice];
            self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价：¥%@",projectModel.vipPrice];
            
            self.countLabel.text = [NSString stringWithFormat:@"单次耗卡金额：¥%@",projectModel.singleConsumePrice];
            
            self.expirLabel.frame = CGRectMake(self.nameLabel.x, self.countLabel.bottom + 10, SCREEN_WIDTH, 30);
            

            self.expirLabel.text = [NSString stringWithFormat:@"过期时间：%d个月",projectModel.expirCount];
            
            self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.expirLabel.bottom + 10, SCREEN_WIDTH, 30);
            
            self.introduceLabel.text = @"功能介绍：";
            
            self.introduceTextView.frame = CGRectMake(20, self.introduceLabel.bottom + 10, SCREEN_WIDTH - 40, 120);
            self.introduceTextView.text = projectModel.introduce;
        }
        else
        {
            self.singlePriceLabel.text = [NSString stringWithFormat:@"单次价：¥%@",projectModel.singlePrice];
            self.cardPriceLabel.text = [NSString stringWithFormat:@"办卡价：¥%@",projectModel.cardPrice];
            
            self.countLabel.text = [NSString stringWithFormat:@"包含次数：%d次",projectModel.count];
            
            self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.countLabel.bottom + 10, SCREEN_WIDTH, 30);
            
            self.introduceLabel.text = @"功能介绍：";
            
            self.introduceTextView.frame = CGRectMake(20, self.introduceLabel.bottom + 10, SCREEN_WIDTH - 40, 120);
            self.introduceTextView.text = projectModel.introduce;

        }
        
        CGFloat height = [self heightForString:self.introduceTextView andWidth:self.introduceTextView.width];
        
        if (height > 120)
        {
            self.introduceTextView.height = height;
        }

        
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.introduceTextView.bottom + 50);

        
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
        
        self.howlongLabel.text = [NSString stringWithFormat:@"分类：%@",projectModel.subClass];

        self.expirLabel.frame = CGRectMake(self.nameLabel.x, self.nameLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.expirLabel.text = [NSString stringWithFormat:@"适用部位：%@",projectModel.usePart];
        
        self.singlePriceLabel.frame = CGRectMake(self.nameLabel.x, self.expirLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.cardPriceLabel.frame = CGRectMake(self.nameLabel.x, self.singlePriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价：¥%@",projectModel.marketPrice];
        self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价：¥%@",projectModel.vipPrice];
        
        
        self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.cardPriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.introduceLabel.text = @"功能介绍：";
        
        self.introduceTextView.frame = CGRectMake(20, self.introduceLabel.bottom + 10, SCREEN_WIDTH - 40, 120);
        self.introduceTextView.text = projectModel.introduce;
        
        CGFloat height = [self heightForString:self.introduceTextView andWidth:self.introduceTextView.width];
        
        if (height > 120)
        {
            self.introduceTextView.height = height;
        }
        
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.introduceTextView.bottom + 50);


    }
    if ([model isKindOfClass:[YXMealCardModel class]])
    {
        YXMealCardModel *projectModel = (YXMealCardModel *)model;
        self.navBarView.title = projectModel.mealCardName;
        
        self.nameLabel.text = projectModel.mealCardName;
        
        self.singlePriceLabel.frame = CGRectMake(self.nameLabel.x, self.nameLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.cardPriceLabel.frame = CGRectMake(self.nameLabel.x, self.singlePriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.singlePriceLabel.text = [NSString stringWithFormat:@"市场价：¥%@",projectModel.marketPrice];
        self.cardPriceLabel.text = [NSString stringWithFormat:@"优惠价：¥%@",projectModel.vipPrice];
        
        self.expirLabel.frame = CGRectMake(self.nameLabel.x, self.cardPriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.expirLabel.text = @"过期时间：不限";
        
        self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.expirLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.introduceLabel.text = @"包含项目：";

        NSString *includePro = projectModel.includeProject;
        
        NSArray *proArr = [includePro componentsSeparatedByString:@","];
        
        
        NSMutableArray *mealDataArray = [NSMutableArray array];
        self.dataArray = mealDataArray;
        for (NSString *proStr in proArr)
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            
            NSArray *proArr2 = [proStr componentsSeparatedByString:@"="];
            
            dict[@"name"] = proArr2.firstObject;
            dict[@"count"] = proArr2.lastObject;
            
            [mealDataArray addObject:dict];
        }
        
        [self initTableView];
        
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.mealTableView.bottom + 50);

        


    }
    if ([model isKindOfClass:[YXChargeCardModel class]])
    {
        YXChargeCardModel *projectModel = (YXChargeCardModel *)model;
        self.navBarView.title = projectModel.chargeCardName;

        self.nameLabel.text = projectModel.chargeCardName;

        self.singlePriceLabel.frame = CGRectMake(self.nameLabel.x, self.nameLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        NSString *str111 = [NSString stringWithFormat:@"充值 ¥%@",projectModel.chargeMoney];
        
        self.singlePriceLabel.text = str111;
        self.singlePriceLabel.textColor = kVipColor;

        self.introduceLabel.frame = CGRectMake(self.nameLabel.x, self.singlePriceLabel.bottom + 10, SCREEN_WIDTH, 30);
        
        self.introduceLabel.text = @"功能介绍：";
        
        self.introduceTextView.frame = CGRectMake(20, self.introduceLabel.bottom + 10, SCREEN_WIDTH - 40, 120);
        self.introduceTextView.text = projectModel.introduce;

        CGFloat height = [self heightForString:self.introduceTextView andWidth:self.introduceTextView.width];
        
        if (height > 120)
        {
            self.introduceTextView.height = height;
        }

        
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.introduceTextView.bottom + 50);

    }


}

- (void)initTableView
{
    self.mealTableView = [[UITableView alloc] initWithFrame:CGRectMake(10,self.introduceLabel.bottom+10, SCREEN_WIDTH - 20, 100 * self.dataArray.count) style:UITableViewStylePlain];
    self.mealTableView.dataSource = self;
    self.mealTableView.delegate = self;
    [self.scrollView addSubview:self.mealTableView];
    self.mealTableView.backgroundColor = TABLEVIEW_COLOR;

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dataDict = [self.dataArray objectAtIndex:indexPath.row];
    //    NSDictionary *dataDict = [self.dataArray objectAtIndex:indexPath.row];
    
    NSString *name = dataDict[@"name"];
    
    static NSString *CellIdentifier = @"ProjectTableCell";
    YXIncludeProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[YXIncludeProjectTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    cell.dict = dataDict;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YXIncludeProjectTableViewCell *cell = (YXIncludeProjectTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    YXProjectViewController *pjVC = [[YXProjectViewController alloc] init];
    
    pjVC.model = cell.projectModel;
    
    [self.navigationController pushViewController:pjVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}


/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) heightForString:(UITextView *)textView andWidth:(float)width
{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

@end
