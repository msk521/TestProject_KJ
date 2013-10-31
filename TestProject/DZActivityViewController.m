//
//  DZActivityViewController.m
//  TestProject
//
//  Created by msk on 13-10-30.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZActivityViewController.h"
#import "DZActivityImageViewController.h"

@interface DZActivityViewController (){
	int iosTag;
	DZActivityImageViewController *dzActivityImage;
	DZActivityImageViewController *dzActivityImage1;
	NSMutableArray *filePathArr;
}

@end

@implementation DZActivityViewController

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
	iosTag = 0;
	if (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0) {
		iosTag = 1;
	}
	
	NSError *error = nil;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *arr = [fileManager contentsOfDirectoryAtPath:imagesFlodersHD error:&error];
	NSMutableArray *mArr = [[NSMutableArray alloc] init];
  filePathArr = [[NSMutableArray alloc] init];
	for (int i = 0; i < arr.count;i++) {
		[mArr addObject:[NSString stringWithFormat:@"%d",i]];
		[filePathArr addObject:[NSString stringWithFormat:@"%@/%@",imagesFlodersHD,[arr objectAtIndex:i]]];
	}

	dzActivityImage = [[DZActivityImageViewController alloc] init:imagesFloders1];
	dzActivityImage.view.frame = self.vidoView.frame;
	[self.view addSubview:dzActivityImage.view];
	
	dzActivityImage1 = [[DZActivityImageViewController alloc] init:imagesFloders2];
	dzActivityImage1.view.frame = self.vidoView.frame;
	[self.view addSubview:dzActivityImage1.view];
	
	[self.view bringSubviewToFront:self.vidoView];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)typeSelected:(id)sender {
	UIButton *btn = (UIButton *)sender;
	//	200,228,225
	for (UIView *view in self.btnView.subviews) {
		if ([view isKindOfClass:[UIButton class]]) {
			UIButton *button = (UIButton *)view;
			[button setBackgroundColor:[UIColor colorWithRed:200 green:228 blue:225 alpha:1.0]];
		}
	}
	
	[btn setBackgroundColor:[UIColor lightGrayColor]];
	
	if (btn.tag == 100) {
		//视频
		[self.view bringSubviewToFront:self.vidoView];
	}else if (btn.tag == 101){
		//案例
		[self.view bringSubviewToFront:dzActivityImage.view];
	}else if (btn.tag == 102){
		//集锦
		[self.view bringSubviewToFront:dzActivityImage1.view];
	}
}


- (IBAction)play:(id)sender {
	//	[self playMovie:MOVE_URL];
	NSString *fileName;
	UIButton *btn = (UIButton *)sender;
	int index = btn.tag - 100;
	if (index < filePathArr.count) {
		fileName = [filePathArr objectAtIndex:index];
	}else{
		return;
	}
	
	NSURL *mediaFileUrl = [[NSURL alloc] initFileURLWithPath:fileName];
	self.moviePlayeraa = [[DZVWolveBaseViewController alloc] initWithContentURL:mediaFileUrl];
	DZAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVideoFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:[self.moviePlayeraa moviePlayer]];
	[self.moviePlayeraa.moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
	
	if (iosTag == 0) {
		//ios6.0以下
		self.moviePlayeraa.view.frame = delegate.viewController.view.frame;
		self.moviePlayeraa.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
	}
	
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
	[self.moviePlayeraa.moviePlayer setFullscreen:YES animated:YES];
	
	self.moviePlayeraa.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self.moviePlayeraa.moviePlayer prepareToPlay];
	
	[delegate.viewController presentMoviePlayerViewControllerAnimated:self.moviePlayeraa];
	
	[self.moviePlayeraa.moviePlayer play];
}

- (void) playVideoFinished:(NSNotification *)theNotification//当点击Done按键或者播放完毕时调用此函数
{
	MPMoviePlayerController *player = [theNotification object];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
	[player stop];
	if (iosTag == 0) {
		[player.view removeFromSuperview];
		player = nil;
		return;
	}
	
	[self.moviePlayeraa dismissMoviePlayerViewControllerAnimated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
	[self setBtnView:nil];
	[self setVidoView:nil];
	[super viewDidUnload];
}
@end
