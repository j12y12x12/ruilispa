//
//  SecondMenuView.m
//  LoveBB
//
//  Created by AngelLL on 15/10/22.
//  Copyright © 2015年 Daniel_Li. All rights reserved.
//

#import "JHCustomMenu.h"
#import "CustomMenuTableViewCell.h"

#define TopToView 10.0
#define LeftToView 10.0
#define CellLineEdgeInsets UIEdgeInsetsMake(0, 10, 0, 10)
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight        [UIScreen mainScreen].bounds.size.height
#define kDuration 0.2

//16进制颜色
#define HEX_COLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]

#define HEX_COLOR_ALPHA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:a]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]



@interface JHCustomMenu()
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat rowHeight;
@end
@implementation JHCustomMenu

- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        if (rowHeight <= 0) {
            rowHeight = 44;
        }
        self.backgroundColor = RGBACOLOR(0, 0, 0,0.1);
        self.alpha = 0;
        self.origin = origin;
        self.rowHeight = rowHeight;
        self.arrData = [dataArr copy];
        
        CGFloat tableViewX = origin.x + LeftToView;
        CGFloat tableViewY = origin.y + TopToView;
        CGFloat tableViewW = width;
        CGFloat tableViewH = rowHeight * dataArr.count - 1.5;

        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.layer.cornerRadius = 2;
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;

        _tableView.separatorColor = RGBACOLOR(220, 220, 220, 1);
        [_tableView registerClass:[CustomMenuTableViewCell class] forCellReuseIdentifier:@"JHCustomMenu"];
        
        [UIView animateWithDuration:kDuration animations:^{
            
            self.alpha = 1;
        }];
        

        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            
            [self.tableView setSeparatorInset:CellLineEdgeInsets];
            
        }
        
        if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            
            [self.tableView setLayoutMargins:CellLineEdgeInsets];
            
        }

    }
    return self;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JHCustomMenu"];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.itemLabel.textColor = [UIColor blackColor];
    cell.itemLabel.text = self.arrData[indexPath.row];
    if (self.arrImgName.count > indexPath.row) {
        cell.itemImgView.image = [UIImage imageNamed:self.arrImgName[indexPath.row]];
//        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = RGBACOLOR(239, 239, 239, 1);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(jhCustomMenu:didSelectRowAtIndexPath:WithIs3DTouch:)]){
        [self.delegate jhCustomMenu:tableView didSelectRowAtIndexPath:indexPath WithIs3DTouch:NO];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self dismissWithCompletion:nil];
     [self removeFromSuperview];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:CellLineEdgeInsets];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:CellLineEdgeInsets];
        
    }
    
}

- (void)dismissWithCompletion:(void (^)(JHCustomMenu *object))completion
{
    __weak __typeof(self) weakSelf = self;
    
    CGFloat originPointX = CGRectGetMaxX(self.tableView.frame) - 12;
    
    CGFloat originPointY = weakSelf.origin.y + 5;

    [UIView beginAnimations:@"imageViewSmall" context:nil];
    [UIView setAnimationDuration:kDuration];
    CGAffineTransform newTransform =  CGAffineTransformScale(self.tableView.transform, 0.1, 0.1);
    [self.tableView setTransform:newTransform];
    self.tableView.center = CGPointMake(originPointX, originPointY);
    [UIView commitAnimations];
    
    [UIView animateWithDuration:kDuration animations:^{
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
        if (completion) {
            completion(weakSelf);
        }
        if (weakSelf.dismiss) {
            weakSelf.dismiss();
        }
    }];


}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.tableView]) {
        [self dismissWithCompletion:nil];
    }
}

- (void)drawRect:(CGRect)rect

{
    if (self.isOfficialMenu)
    {
        CGContextRef
        context = UIGraphicsGetCurrentContext();
        
        //利用path进行绘制三角形
        
        CGContextBeginPath(context);//标记
        
        CGFloat originPointX = CGRectGetWidth(self.tableView.frame) /2 + self.tableView.frame.origin.x;
        
        CGFloat tableViewY = CGRectGetMaxY(self.tableView.frame);
        
        CGFloat originPointY = tableViewY + 8;
        
        CGContextMoveToPoint(context,
                             originPointX, originPointY);//设置起点
        
        CGContextAddLineToPoint(context,
                                originPointX - 8, tableViewY);
        
        CGContextAddLineToPoint(context,
                                originPointX + 8, tableViewY);
        
        
        CGContextClosePath(context);//路径结束标志，不写默认封闭
        
        [self.tableView.backgroundColor setFill]; //设置填充色
        
        [self.tableView.backgroundColor setStroke]; //设置边框颜色
        
        CGContextDrawPath(context,
                          kCGPathFillStroke);//绘制路径path
        
        return;
    }
    
    //拿到当前视图准备好的画板
    
    CGContextRef
    context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    
    CGFloat originPointX = CGRectGetMaxX(self.tableView.frame) - 16;
    
    CGFloat tableViewY = self.tableView.frame.origin.y;

    CGFloat originPointY = tableViewY - 8;
        
    CGContextMoveToPoint(context,
                         originPointX, originPointY);//设置起点
    
    CGContextAddLineToPoint(context,
                            originPointX - 8, tableViewY);
    
    CGContextAddLineToPoint(context,
                            originPointX + 8, tableViewY);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [self.tableView.backgroundColor setFill]; //设置填充色
    
    [self.tableView.backgroundColor setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
}

@end
