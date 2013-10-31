//
//  DZViewController.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZHomeViewController.h"
#import "DZVIPViewController.h"
#import "DZCharacterViewController.h"
#import "DZWolvesViewController.h"
#import "DZCelebrityHallViewController.h"
#import "DZTribeViewController.h"
#import "DZMessageViewController.h"
#import "DZActivityViewController.h"

@interface DZViewController : DZBaseViewController{
	
}
@property (strong,nonatomic) DZHomeViewController *homeCon;
@property (strong,nonatomic) DZVIPViewController *vipCon;
@property (strong,nonatomic) DZCharacterViewController *characterCon;
@property (strong,nonatomic) DZWolvesViewController *wolvesCon;
@property (strong,nonatomic) DZCelebrityHallViewController *celebrityCon;
@property (strong,nonatomic) DZTribeViewController *tribeCon;
@property (strong,nonatomic) DZMessageViewController *messageCon;
@property (strong,nonatomic) DZActivityViewController *activityCon;
@property (strong, nonatomic) IBOutlet UIView *conView;
@property (strong, nonatomic) IBOutlet UIView *btnView;
-(void)fullScreen;
@end
