//
//  DZCharacterDetailViewController.m
//  TestProject
//
//  Created by msk on 13-10-30.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZCharacterDetailViewController.h"

@interface DZCharacterDetailViewController ()

@end

@implementation DZCharacterDetailViewController
@synthesize goBack;

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
	  self.imageView1.image = [UIImage imageNamed:self.image1];
		self.imageView2.image = [UIImage imageNamed:self.image2];
		self.imageView3.image = [UIImage imageNamed:self.image3];
		self.imageView4.image = [UIImage imageNamed:self.image4];
}

- (IBAction)goBack:(id)sender {
	self.goBack(self.view);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
	[self setFirstLab:nil];
	[self setSecondLab:nil];
	[self setThirdLab:nil];
	[self setFourthLab:nil];
	[self setFiveLab:nil];
	[self setSixTextView:nil];
	[self setImageView1:nil];
	[self setImageView2:nil];
	[self setImageView3:nil];
	[self setImageView4:nil];
	[self setTypeLab:nil];
	[super viewDidUnload];
}
@end
