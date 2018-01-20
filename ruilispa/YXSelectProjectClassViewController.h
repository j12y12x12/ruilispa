//
//  YXSelectProjectClassViewController.h
//  ruilispa
//
//  Created by jin on 2018/1/20.
//  Copyright © 2018年 ruili. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXSelectProjectClassViewControllerDelegate  <NSObject>

- (void)hasSelectProjectClass:(NSString *)projectClass;

@end
@interface YXSelectProjectClassViewController : UIViewController

@property (strong, nonatomic) NSString *selectProject;

@property (strong, nonatomic) NSString *oldProjectClass;

@property (nonatomic, weak) id<YXSelectProjectClassViewControllerDelegate> delegate;


@end
