//
//  YXSelectProjectViewController.m
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXSelectProjectViewController.h"
#import "YXSelectProjectTableViewCell.h"

@interface YXSelectProjectViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@property (nonatomic, strong) YXNavBarView *navBarView;
@end

@implementation YXSelectProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    [self getDataSource];
    
}


- (void)initUI
{
    self.view.backgroundColor = TABLEVIEW_COLOR;
    self.navBarView = [[YXNavBarView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64)];
    self.navBarView.title = @"选择类别";
    self.navBarView.leftBtnTitle = @"返回";
    
    WS
    self.navBarView.backBlock = ^(void){
        SS
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    [self.view addSubview:self.navBarView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    self.tableView.backgroundColor = TABLEVIEW_COLOR;
    [self.view addSubview:self.tableView];
    
}

- (void)getDataSource
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"project.plist" ofType:nil];
    
    NSMutableDictionary *projectDict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *keyArray = [projectDict allKeys];

    self.dataArray = [NSArray arrayWithArray:keyArray];
    
    if (self.oldProject.length > 0)
    {
        for (int i=0; i<keyArray.count; i++)
        {
            
            if ([self.oldProject isEqualToString:keyArray[i]])
            {
                self.selectedIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
                break;
            }
            
        }
    }
}



#pragma mark - UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.selectedIndexPath)
    {
        YXSelectProjectTableViewCell *cell = [tableView cellForRowAtIndexPath:self.selectedIndexPath];
        cell.isSelected = NO;
    }
    
    YXSelectProjectTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.isSelected = YES;
    self.selectedIndexPath = indexPath;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hasSelectProject:)])
    {
        NSString *projectStr = [self.dataArray objectAtIndex:self.selectedIndexPath.row];
        
        [self.delegate hasSelectProject:projectStr];

    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    
    NSString *rowData = [self.dataArray objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"LocationTableCell";
    YXSelectProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[YXSelectProjectTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:17];
        cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.textLabel.backgroundColor = [UIColor clearColor];
    }
    
    cell.textLabel.text = rowData;
    
    if ([self.selectedIndexPath isEqual:indexPath])
    {
        cell.isSelected = YES;
    }
    else
    {
        cell.isSelected = NO;
    }
    
    return cell;
}



@end
