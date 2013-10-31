//
//  DZWolvesViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZWolvesViewController.h"
#import "DZAppDelegate.h"
@interface DZWolvesViewController (){
	int iosTag;
	NSMutableArray *filePathArr;
}
@end

@implementation DZWolvesViewController

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
	NSError *error = nil;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *arr = [fileManager contentsOfDirectoryAtPath:imagesFlodersVido error:&error];
	NSMutableArray *mArr = [[NSMutableArray alloc] init];
  filePathArr = [[NSMutableArray alloc] init];
	for (int i = 0; i < arr.count;i++) {
		[mArr addObject:[NSString stringWithFormat:@"%d",i]];
		[filePathArr addObject:[NSString stringWithFormat:@"%@/%@",imagesFlodersVido,[arr objectAtIndex:i]]];
	}

	iosTag = 0;
	if (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0) {
		iosTag = 1;
	}
    // Do any additional setup after loading the view from its nib.
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
	
	[self.moviePlayeraa.moviePlayer setFullscreen:YES animated:YES];

	self.moviePlayeraa.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self.moviePlayeraa.moviePlayer prepareToPlay];
	
	[delegate.viewController presentMoviePlayerViewControllerAnimated:self.moviePlayeraa];
	
	[self.moviePlayeraa.moviePlayer play];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
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

@end
