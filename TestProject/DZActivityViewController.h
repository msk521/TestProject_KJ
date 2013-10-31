//
//  DZActivityViewController.h
//  TestProject
//
//  Created by msk on 13-10-30.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZVWolveBaseViewController.h"
#import <MediaPlayer/MPMoviePlayerController.h>
@interface DZActivityViewController : DZBaseViewController
@property (strong, nonatomic) IBOutlet UIView *btnView;
@property (strong, nonatomic) IBOutlet UIView *vidoView;
@property (nonatomic,strong) DZVWolveBaseViewController *moviePlayeraa;
@end
