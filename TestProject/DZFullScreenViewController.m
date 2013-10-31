//
//  DZFullScreenViewController.m
//  TestProject
//
//  Created by msk on 13-10-31.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZFullScreenViewController.h"

@interface DZFullScreenViewController ()

@end

@implementation DZFullScreenViewController
@synthesize imageURL;
@synthesize closeBlock;

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
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:self.imageURL]]];
	  self.imageView.image = image;
}

- (IBAction)closeSelf:(id)sender {
  self.closeBlock(0);
}

#pragma mark UIScrollView delegate methods

//实现图片的缩放

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
	
	NSLog(@"**************viewForZoomingInScrollView");
	
	return self.imageView;
	
}

//实现图片在缩放过程中居中

- (void)scrollViewDidZoom:(UIScrollView *)scrollView

{
	
	CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
	
	CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
	
	self.imageView.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setImageView:nil];
    [super viewDidUnload];
}
@end
