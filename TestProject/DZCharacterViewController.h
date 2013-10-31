//
//  DZCharacterViewController.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZCharacterDetailViewController.h"

@interface DZCharacterViewController : DZBaseViewController
@property (strong, nonatomic) IBOutlet UIView *btnView;
@property (strong, nonatomic) IBOutlet UIView *maoziView;
@property (nonatomic ,strong) DZCharacterDetailViewController *lookCon;
@end
