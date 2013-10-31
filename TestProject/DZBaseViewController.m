//
//  DZBaseViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZBaseViewController ()

@end

@implementation DZBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
