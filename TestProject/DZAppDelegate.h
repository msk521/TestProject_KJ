//
//  DZAppDelegate.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZViewController.h"

@interface DZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DZViewController *viewController;
@property (nonatomic, assign) BOOL isScrollView;
@end
