//
//  DZTribeViewController.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
#import "PopViewController.h"
#import "MapViewController.h"

@interface DZTribeViewController : DZBaseViewController<PopViewControllerDelegate,UIPopoverControllerDelegate,MapViewControllerDidSelectDelegate>{
	
}
@property (strong, nonatomic) IBOutlet UITextField *selectedName;
@property (strong,nonatomic) UIPopoverController *popView;
@end
