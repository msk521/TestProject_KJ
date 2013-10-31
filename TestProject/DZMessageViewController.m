//
//  DZMessageViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZMessageViewController.h"

@interface DZMessageViewController ()

@end

@implementation DZMessageViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)Internal:(id)sender {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入用户名密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
	alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
	[alert show];
}

- (IBAction)submitAnser:(id)sender {
	self.textView.text = @"";
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提交成功" message:@"感谢您的支持！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
	[alert show];
}

- (IBAction)closeSlef:(id)sender {
	[self.askView removeFromSuperview];
}
#pragma mark --UIAlertDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if (buttonIndex == 0) {
		[self.view addSubview:self.askView];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextView:nil];
	[self setAskView:nil];
    [super viewDidUnload];
}
@end
