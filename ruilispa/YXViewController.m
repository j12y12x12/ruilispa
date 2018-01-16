//
//  YXViewController.m
//  ruilispa
//
//  Created by jin on 2018/1/15.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import "YXViewController.h"

@interface YXViewController ()

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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
