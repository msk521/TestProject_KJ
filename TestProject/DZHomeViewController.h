//
//  DZHomeViewController.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
#import "ScrollDemoView.h"
@interface DZHomeViewController : DZBaseViewController<ScrollDemoViewDelegate>
@property (strong,nonatomic) ScrollDemoView *fullScreenScrollView;

@end
