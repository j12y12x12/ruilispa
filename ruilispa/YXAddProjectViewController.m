//
//  YXAddProjectViewController.m
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXAddProjectViewController.h"
#import "YXAddprojectTableViewCell.h"
#import "YXSelectProjectViewController.h"
#import "YXSelectProjectClassViewController.h"

@interface YXAddProjectViewController ()<UITableViewDelegate,UITableViewDataSource,YXSelectProjectViewControllerDelegate,YXSelectProjectClassViewControllerDelegate>

@property (strong, nonatomic) YXNavBarView *navBarView;

@property (strong, nonatomic) UITableView *tableView;



@property (strong, nonatomic) NSMutableArray *dataArray;

@property (assign, nonatomic) BOOL isSingleCard;

@end

@implementation YXAddProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self iniNavbarView];
    
    YXProjectModel *projectModel = [[YXProjectModel alloc] init];
    self.projectModel = projectModel;
    
    [self getDatasource];
    [self iniUI];
    
}

- (void)iniNavbarView
{
    self.navBarView = [[YXNavBarView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64)];
    
    [self.navBarView setMyNavBarWithTitle:@"添加项目" leftBtnTitle:@"返回" leftBtnImgName:@"barbuttonicon_back" rightBtnTitle:@"保存" rightBtnImgName:nil];
    [self.view addSubview:self.navBarView];
    
    [self.navBarView.rightBtn setTitleColor:kThemeColor forState:UIControlStateNormal];
    [self.navBarView.rightBtn setTitleColor:kThemeColorDisabled forState:UIControlStateDisabled];

    self.navBarView.rightBtn.enabled = NO;
    self.navBarView.rightBtn.x = self.navBarView.rightBtn.x - 40;
    self.navBarView.backBtn.x = self.navBarView.backBtn.x + 40;

    WS
    self.navBarView.backBlock = ^(void){
        SS
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    
    self.navBarView.rightTapBlock = ^{
        //对于公众号，好友标记表示是否关注该公众号
    };
    
}

- (void)getDatasource
{
    if (self.isSingleCard)
    {
        NSMutableArray *dataARray = [NSMutableArray array];
        [dataARray addObject:@{@"name":@"选择类别"}];
        [dataARray addObject:@{@"name":@"选择系列"}];
        [dataARray addObject:@{@"name":@"卡类别"}];
        [dataARray addObject:@{@"name":@"项目名称"}];
        [dataARray addObject:@{@"name":@"图片"}];
        [dataARray addObject:@{@"name":@"时长"}];
        [dataARray addObject:@{@"name":@"单次价格"}];
        [dataARray addObject:@{@"name":@"办卡价格"}];
        [dataARray addObject:@{@"name":@"包含次数"}];
        [dataARray addObject:@{@"name":@"功能介绍"}];
        self.dataArray = dataARray;
    }
    else
    {
        NSMutableArray *dataARray = [NSMutableArray array];
        [dataARray addObject:@{@"name":@"选择类别"}];
        [dataARray addObject:@{@"name":@"选择系列"}];
        [dataARray addObject:@{@"name":@"卡类别"}];
        [dataARray addObject:@{@"name":@"有效期"}];
        [dataARray addObject:@{@"name":@"项目名称"}];
        [dataARray addObject:@{@"name":@"图片"}];
        [dataARray addObject:@{@"name":@"时长"}];
        [dataARray addObject:@{@"name":@"市场价格"}];
        [dataARray addObject:@{@"name":@"优惠价格"}];
        [dataARray addObject:@{@"name":@"最多包含次数"}];
        [dataARray addObject:@{@"name":@"单次耗卡金额"}];
        [dataARray addObject:@{@"name":@"功能介绍"}];
        self.dataArray = dataARray;
    }
}


- (void)iniUI
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
    
}


#pragma mark - UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSDictionary *dataDict = [self.dataArray objectAtIndex:indexPath.row];
    
    NSString *name = dataDict[@"name"];
    
    if ([name isEqualToString:@"选择类别"])
    {
        YXSelectProjectViewController *selectProVC = [[YXSelectProjectViewController alloc] init];
        
        selectProVC.oldProject = self.projectModel.name;
        selectProVC.delegate = self;
        [self.navigationController pushViewController:selectProVC animated:YES];
        
    }
    if ([name isEqualToString:@"选择系列"])
    {
        if (self.projectModel.name.length == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"请先选择类别" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
            
            [alert show];
            
            return;
        }
        
        YXSelectProjectClassViewController *selectProClassVC = [[YXSelectProjectClassViewController alloc] init];
        
        selectProClassVC.selectProject = self.projectModel.name;
        selectProClassVC.oldProjectClass = self.projectModel.pjtClass;
        selectProClassVC.delegate = self;

        [self.navigationController pushViewController:selectProClassVC animated:YES];

    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dataDict = [self.dataArray objectAtIndex:indexPath.row];
    
    NSString *name = dataDict[@"name"];

    if ([name isEqualToString:@"图片"])
    {
        return 240;
    }
    if ([name isEqualToString:@"功能介绍"])
    {
        return 200;
    }
    if ([name isEqualToString:@"卡类别"] && self.isSingleCard == NO)
    {
        return 200;
    }


    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

#pragma mark - UITableViewDataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dataDict = [self.dataArray objectAtIndex:indexPath.row];
    
    NSString *name = dataDict[@"name"];
    
    static NSString *CellIdentifier = @"addProjectTableCell";
    YXAddprojectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[YXAddprojectTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:17];
        cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.textLabel.backgroundColor = [UIColor clearColor];
    }
    cell.addProVC = self;
    cell.cellName = name;
    
    return cell;
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - YXSelectProjectViewControllerDelegate
- (void)hasSelectProject:(NSString *)project
{
    self.projectModel.name = project;
    self.projectModel.pjtClass = nil;
    [self.tableView reloadData];
}

#pragma mark - YXSelectProjectClassViewControllerDelegate
- (void)hasSelectProjectClass:(NSString *)projectClass
{
    self.projectModel.pjtClass = projectClass;
    [self.tableView reloadData];

}
@end


