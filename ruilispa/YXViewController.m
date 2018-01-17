//
//  YXViewController.m
//  ruilispa
//
//  Created by jin on 2018/1/15.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXViewController.h"
#import "JSDropDownMenu.h"

@interface YXViewController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate>

@property (strong, nonatomic) NSMutableArray *data1;
@property (strong, nonatomic) NSMutableArray *data2;
@property (strong, nonatomic) NSMutableArray *data3;

@property (assign, nonatomic) NSInteger currentData1Index;
@property (assign, nonatomic) NSInteger currentData2Index;
@property (assign, nonatomic) NSInteger currentData3Index;

@property (assign, nonatomic) NSInteger currentData1SelectedIndex;

@property (strong, nonatomic) JSDropDownMenu *menu;


@end

@implementation YXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *llll = [[UILabel alloc] init];
    
    llll.frame = CGRectMake(50, 120, 700, 120);
    
    llll.text = @"催乳大师";
    
    llll.font = [UIFont systemFontOfSize:28];
    
    llll.textColor = [UIColor orangeColor];
    
    [self.view addSubview:llll];
    
    
    // 指定默认选中
    _currentData1Index = 1;
    _currentData1SelectedIndex = 1;
    
    NSArray *food = @[@"全部美食", @"火锅", @"川菜", @"西餐", @"自助餐"];
    NSArray *travel = @[@"全部旅游", @"周边游", @"景点门票", @"国内游", @"境外游"];
    
    _data1 = [NSMutableArray arrayWithObjects:@{@"title":@"美食", @"data":food}, @{@"title":@"旅游", @"data":travel}, nil];
    _data2 = [NSMutableArray arrayWithObjects:@"智能排序", @"离我最近", @"评价最高", @"最新发布", @"人气最高", @"价格最低", @"价格最高", nil];
    _data3 = [NSMutableArray arrayWithObjects:@"不限人数", @"单人餐", @"双人餐", @"3~4人餐", nil];
    
    _menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 20) andHeight:45];
    _menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    _menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    _menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    _menu.dataSource = self;
    _menu.delegate = self;
    
    [self.view addSubview:_menu];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRotate) name:UIDeviceOrientationDidChangeNotification object:nil];


}



- (void)changeRotate
{
    [_menu resetMenuFramePortrait];
    
    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait
        || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown) {
        //竖屏
        
        NSLog(@"竖屏");
    }
    else if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft)
    {
        //横屏禁止侧滑
        
        NSLog(@"左横屏");
        
    }
    else if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
    {        
        NSLog(@"右横屏");
        
    }


}



- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 3;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    if (column==2) {
        
        return YES;
    }
    
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    if (column==0) {
        return YES;
    }
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    if (column==0) {
        return 0.3;
    }
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
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
            return [[menuDic objectForKey:@"data"] count];
        }
    } else if (column==1){
        
        return _data2.count;
        
    } else if (column==2){
        
        return _data3.count;
    }
    
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0: return [[_data1[self.currentData1Index] objectForKey:@"data"] objectAtIndex:self.currentData1SelectedIndex];
            break;
        case 1: return _data2[_currentData2Index];
            break;
        case 2: return _data3[_currentData3Index];
            break;
        default:
            return nil;
            break;
    }
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
        
        return _data2[indexPath.row];
        
    } else {
        
        return _data3[indexPath.row];
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column == 0) {
        
        if(indexPath.leftOrRight==0){
            
            _currentData1Index = indexPath.row;
            
            return;
        }
        
    } else if(indexPath.column == 1){
        
        _currentData2Index = indexPath.row;
        
    } else{
        
        _currentData3Index = indexPath.row;
    }
}



@end
