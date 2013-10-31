//
//  DZVIPViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZVIPViewController.h"

@interface DZVIPViewController ()

@end

@implementation DZVIPViewController

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
	  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://vip.septwolves.com/"]]];
}

#pragma mark---UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
	NSLog(@"start");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
	NSLog(@"end");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
