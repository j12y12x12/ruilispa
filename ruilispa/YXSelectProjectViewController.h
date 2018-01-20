//
//  YXSelectProjectViewController.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXSelectProjectViewControllerDelegate  <NSObject>

- (void)hasSelectProject:(NSString *)project;

@end


@interface YXSelectProjectViewController : UIViewController

@property (strong, nonatomic) NSString *oldProject;

@property (nonatomic, weak) id<YXSelectProjectViewControllerDelegate> delegate;

@end
