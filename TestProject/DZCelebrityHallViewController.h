//
//  DZCelebrityHallViewController.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "LeavesViewController.h"
#import "DZLookPDFViewController.h"
#import "DZFullScreenViewController.h"

@interface DZCelebrityHallViewController : LeavesViewController
//@property (nonatomic,strong) DZLookPDFViewController *lookCon;
//*************放大过程中出现的缓慢动画*************
@property (strong,nonatomic) DZFullScreenViewController *fullScreen;
- (void) shakeToShow:(UIView*)aView scale:(int)scale;
@end
