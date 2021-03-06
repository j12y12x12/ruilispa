//
//  YXViewController.m
//  ruilispa
//
//  Created by jin on 2018/1/15.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXViewController.h"
#import "JSDropDownMenu.h"
#import "YXAddProjectViewController.h"
#import "YXProjectTableViewCell.h"
#import "YXProjectViewController.h"

@interface YXViewController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) YXNavBarView *navBarView;

@property (strong, nonatomic) NSMutableArray *data1;
@property (strong, nonatomic) NSMutableArray *data2;
@property (strong, nonatomic) NSMutableArray *data3;
@property (strong, nonatomic) NSMutableArray *data4;

@property (assign, nonatomic) NSInteger currentData1Index;
@property (assign, nonatomic) NSInteger currentData2Index;
@property (assign, nonatomic) NSInteger currentData3Index;
@property (assign, nonatomic) NSInteger currentData4Index;

@property (assign, nonatomic) NSInteger currentData1SelectedIndex;

@property (strong, nonatomic) JSDropDownMenu *menu;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIView *myHeaderView;

@property (strong, nonatomic) UILabel *myHeaderLabel;


@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation YXViewController

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.hidden = YES;
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRotate) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    //添加项目屏蔽
//    UIButton *addPjtBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    addPjtBtn.frame = CGRectMake(200, 200, 200, 200);
//
//    [addPjtBtn addTarget:self action:@selector(addProject) forControlEvents:UIControlEventTouchUpInside];
//
//    addPjtBtn.backgroundColor = [UIColor yellowColor];
//
//    [self.view addSubview:addPjtBtn];
    
    [[YXSQLManager shareManager] searchAllChargeCardInfoWithBlock:^(NSArray *cardModelArray) {
        
    }];
    
    [self iniNavbarView];
    
    [self getDropMenuData];
    
    [self initTableView];
    
    [self loadStartData];

}

- (void)loadStartData
{
    _currentData1Index = 0;
    _currentData1SelectedIndex = 0;
    NSDictionary *menuDic = [_data1 objectAtIndex:_currentData1Index];
    NSString *title = [menuDic objectForKey:@"title"];
    NSString *data = [[menuDic objectForKey:@"data"] objectAtIndex:_currentData1SelectedIndex];
    
    
    NSString *titleStr = [NSString stringWithFormat:@"项目•%@•%@",title,data];
    self.myHeaderLabel.text = titleStr;
    
    BOOL isAll = NO;
    
    if ([data isEqualToString:@"全部"])
    {
        isAll = YES;
    }
    
    [[YXSQLManager shareManager] searchAllProjectWithProjectClass:title subClass:data isAll:isAll callBackBlock:^(NSMutableArray *projectArray) {
        
        [self.dataSource removeAllObjects];
        [self.dataSource addObjectsFromArray:projectArray];
        [self loadData];
        
    }];

}



- (void)initTableView
{
    UIView *myHearderView = [[UIView alloc] init];
    
    myHearderView.frame = CGRectMake(0, self.menu.bottom, SCREEN_WIDTH, 35);
    
    myHearderView.backgroundColor = TABLEVIEW_COLOR;
    
    self.myHeaderView = myHearderView;
    
    UILabel *hearderLabel = [[UILabel alloc] init];
    
    hearderLabel.frame = CGRectMake(25, 9, SCREEN_WIDTH - 20, 20);
    
    hearderLabel.font = [UIFont systemFontOfSize:13];
    
    hearderLabel.textColor = [UIColor grayColor];
    
    self.myHeaderLabel = hearderLabel;
    
    [self.myHeaderView addSubview:hearderLabel];
    [self.view addSubview:self.myHeaderView];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,self.myHeaderView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-self.myHeaderView.bottom) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = TABLEVIEW_COLOR;
    
    
}





- (void)iniNavbarView
{
    self.navBarView = [[YXNavBarView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64)];
    
    [self.navBarView setMyNavBarWithTitle:@"价目表" leftBtnTitle:nil leftBtnImgName:nil rightBtnTitle:nil rightBtnImgName:nil];
    [self.view addSubview:self.navBarView];
    
    self.navBarView.backBlock = ^(void){
        
    };
    
    self.navBarView.rightTapBlock = ^{
        
    };
    
}



- (NSMutableArray *)getProjectDataWithPlist:(NSString *)plist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plist ofType:nil];
    
    NSMutableDictionary *projectDict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObject:@"面部"];
    [sortArray addObject:@"眼部"];
    [sortArray addObject:@"胸部"];
    [sortArray addObject:@"颈部护理"];
    [sortArray addObject:@"减肥"];
    [sortArray addObject:@"养生"];
    [sortArray addObject:@"SPA"];

    
    NSMutableArray *projectMenuArr = [NSMutableArray array];
    
    for (NSString *keyClass in sortArray)
    {
        NSMutableDictionary *menuDict = [NSMutableDictionary dictionary];
        
        menuDict[@"title"] = keyClass;
        
        NSArray *calssArray = [[projectDict objectForKey:keyClass] objectForKey:@"class"];
        
        NSMutableArray *allClassArray = [NSMutableArray array];
        
        [allClassArray addObject:@"全部"];
        
        [allClassArray addObjectsFromArray:calssArray];
        
        menuDict[@"data"] = allClassArray;
        
        [projectMenuArr addObject:menuDict];
        
    }
    
    return projectMenuArr;
}

- (NSMutableArray *)getProductDataWithPlist:(NSString *)plist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plist ofType:nil];
    
    NSMutableDictionary *projectDict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObject:@"产品"];
    [sortArray addObject:@"奥薇"];
    
    NSMutableArray *projectMenuArr = [NSMutableArray array];
    
    for (NSString *keyClass in sortArray)
    {
        NSMutableDictionary *menuDict = [NSMutableDictionary dictionary];
        
        menuDict[@"title"] = keyClass;
        
        NSArray *calssArray = [[projectDict objectForKey:keyClass] objectForKey:@"class"];
        
        NSMutableArray *allClassArray = [NSMutableArray array];
        
        [allClassArray addObject:@"全部"];
        
        [allClassArray addObjectsFromArray:calssArray];
        
        menuDict[@"data"] = allClassArray;
        
        [projectMenuArr addObject:menuDict];
        
    }
    
    return projectMenuArr;
}


- (void)getDropMenuData
{

    
    NSMutableArray *projectArr = [self getProjectDataWithPlist:@"project.plist" ];
    
    NSMutableArray *productArr = [self getProductDataWithPlist:@"product.plist"];

    
    // 指定默认选中
    _currentData1Index = 0;
    _currentData1SelectedIndex = 0;
    
    
    _data1 = [NSMutableArray arrayWithArray:projectArr];
    _data2 = [NSMutableArray arrayWithArray:productArr];
    
    
//    NSArray *food = @[@"全部美食", @"火锅", @"川菜", @"西餐", @"自助餐"];
//    NSArray *travel = @[@"全部旅游", @"周边游", @"景点门票", @"国内游", @"境外游"];
//
//    _data1 = [NSMutableArray arrayWithObjects:@{@"title":@"美食", @"data":food}, @{@"title":@"旅游", @"data":travel}, nil];
//    _data2 = [NSMutableArray arrayWithObjects:@"智能排序", @"离我最近", @"评价最高", @"最新发布", @"人气最高", @"价格最低", @"价格最高", nil];
    
    _data3 = [NSMutableArray arrayWithObjects:@"套卡",nil];
    _data4 = [NSMutableArray arrayWithObjects:@"充值卡",nil];

    _menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:45];
    _menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    _menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    _menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    _menu.dataSource = self;
    _menu.delegate = self;
    
    [self.view addSubview:_menu];


}

- (void)addProject
{
    
    YXAddProjectViewController * addVc = [[YXAddProjectViewController alloc] init];
    
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:addVc];

    [self presentViewController:navBar animated:YES completion:^{
        
    }];
}

//- (void)changeRotate
//{
//    [_menu resetMenuFramePortrait];
//
//    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait
//        || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown) {
//        //竖屏
//
//        NSLog(@"竖屏");
//    }
//    else if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft)
//    {
//        //横屏禁止侧滑
//
//        NSLog(@"左横屏");
//
//    }
//    else if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
//    {
//        NSLog(@"右横屏");
//
//    }
//
//
//}



- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 4;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
//    if (column==3) {
//
//        return YES;
//    }
    
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    if (column==0 || column==1)
    {
        return YES;
    }
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    if (column==0 || column==1)
    {
        return 0.3;
    }
    
    return 0;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0)
    {
        
        return _currentData1Index;
        
    }
    if (column==1) {
        
        return _currentData2Index;
    }
    
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
        if (leftOrRight==0) {
            
            return _data1.count;
        } else{
            
            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
            
            NSArray *arr = [menuDic objectForKey:@"data"];
            return arr.count;
        }
    } else if (column==1){
        
        if (leftOrRight==0) {
            
            return _data2.count;
        } else{
            
            NSDictionary *menuDic = [_data2 objectAtIndex:leftRow];
            
            NSArray *arr = [menuDic objectForKey:@"data"];
            return arr.count;
        }

//        return _data2.count;
        
    } else if (column==2){
        
        return _data3.count;
    }
    else if (column==3){
        
        return _data4.count;
    }
    
    
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    if (column == 0)
    {
        return @"项目";
    }
    if (column == 1)
    {
        return @"产品";
    }

    
    switch (column) {
        case 0: return [[_data1[self.currentData1Index] objectForKey:@"data"] objectAtIndex:self.currentData1SelectedIndex];
            break;
        case 1: return [[_data2[self.currentData1Index] objectForKey:@"data"] objectAtIndex:self.currentData1SelectedIndex];
            break;
        case 2: return _data3[_currentData3Index];
            break;
        case 3: return _data4[_currentData4Index];
            break;

        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumnAtIndexPath:(JSIndexPath *)indexPath
{
    if (indexPath.column == 0)
    {
        return @"项目";
    }
    if (indexPath.column == 1)
    {
        return @"产品";
    }
    if (indexPath.column == 2)
    {
        
        return _data3[indexPath.row];
    }
    if (indexPath.column == 3)
    {
        
        return _data4[indexPath.row];
    }
    
    return @"";
}


- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column==0) {
        if (indexPath.leftOrRight==0) {
            NSDictionary *menuDic = [_data1 objectAtIndex:indexPath.row];
            return [menuDic objectForKey:@"title"];
        } else{
            NSInteger leftRow = indexPath.leftRow;
            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
    } else if (indexPath.column==1) {
        
        if (indexPath.leftOrRight==0) {
            NSDictionary *menuDic = [_data2 objectAtIndex:indexPath.row];
            return [menuDic objectForKey:@"title"];
        } else{
            NSInteger leftRow = indexPath.leftRow;
            NSDictionary *menuDic = [_data2 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        }

//        return _data2[indexPath.row];
        
    }
    else if (indexPath.column==2)
    {
        
        return _data3[indexPath.row];
    }
    else
    {
        
        return _data4[indexPath.row];
    }

}

- (void)menu:(JSDropDownMenu *)menu didSelectMenuAtColumn:(NSInteger)index
{
    if (index == 2)
    {
        //套卡
        self.myHeaderLabel.text = @"套卡";
        
        [[YXSQLManager shareManager] searchAllMealCardInfoWithBlock:^(NSArray *cardModelArray) {
            
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:cardModelArray];

            [self loadData];
        }];
    }
    if (index == 3)
    {
        //充值卡
        self.myHeaderLabel.text = @"充值卡";
        
        [[YXSQLManager shareManager] searchAllChargeCardInfoWithBlock:^(NSArray *cardModelArray) {
          
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:cardModelArray];
            [self loadData];

        }];


    }
}

- (void)loadData
{
    [self.tableView reloadData];
}
- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    
    if (indexPath.column == 0) {
        
        NSDictionary *menuDic = [_data1 objectAtIndex:indexPath.leftRow];
        NSString *title = [menuDic objectForKey:@"title"];
        NSString *data = [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];

        NSString *titleStr = [NSString stringWithFormat:@"项目•%@•%@",title,data];
        self.myHeaderLabel.text = titleStr;
        
//        if(indexPath.leftOrRight==0)
//        {
//
//            _currentData1Index = indexPath.row;
//        }
        _currentData1Index = indexPath.leftRow;
        BOOL isAll = NO;
        
        if ([data isEqualToString:@"全部"])
        {
            isAll = YES;
        }
        
        [[YXSQLManager shareManager] searchAllProjectWithProjectClass:title subClass:data isAll:isAll callBackBlock:^(NSMutableArray *projectArray) {
            
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:projectArray];
            [self loadData];

        }];
        
        
        
    } else if(indexPath.column == 1){
        
        NSDictionary *menuDic = [_data2 objectAtIndex:indexPath.leftRow];
        NSString *title = [menuDic objectForKey:@"title"];
        NSString *data = [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        
        NSString *titleStr = [NSString stringWithFormat:@"产品•%@•%@",title,data];
        self.myHeaderLabel.text = titleStr;


//        if(indexPath.leftOrRight==0){
//
//            _currentData2Index = indexPath.row;
//
//        }
        
        _currentData2Index = indexPath.leftRow;

        BOOL isAll = NO;

        if ([data isEqualToString:@"全部"])
        {
            isAll = YES;
        }
        
        [[YXSQLManager shareManager] searchAllProductWithBrand:title subClass:data isAll:isAll callBackBlock:^(NSMutableArray *productArray) {
            
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:productArray];
            [self loadData];

        }];

//        _currentData2Index = indexPath.row;
        
    } else if(indexPath.column == 2)
    {
        
        _currentData3Index = indexPath.row;
    }
    else
    {
        _currentData4Index = indexPath.row;
    }
}




#pragma mark - UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YXProjectTableViewCell *cell = (YXProjectTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    YXProjectViewController *pjVC = [[YXProjectViewController alloc] init];
    
    pjVC.model = cell.cellModel;
    
    [self.navigationController pushViewController:pjVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 1;
}

#pragma mark - UITableViewDataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     id model = [self.dataSource objectAtIndex:indexPath.row];
//    NSDictionary *dataDict = [self.dataArray objectAtIndex:indexPath.row];
    
//    NSString *name = dataDict[@"name"];
    
    static NSString *CellIdentifier = @"ProjectTableCell";
     YXProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[YXProjectTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
//    cell.textLabel.text = @"test";
    
    cell.cellModel = model;
    
    return cell;
}



@end
