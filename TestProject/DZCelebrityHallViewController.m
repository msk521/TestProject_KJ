//
//  DZCelebrityHallViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZCelebrityHallViewController.h"
#import "DZFullScreenViewController.h"
#import "DZAppDelegate.h"

@interface DZCelebrityHallViewController (){
	NSMutableArray *images;
	NSMutableArray *imagesPath;
	DZFullScreenViewController *fullScreen;
}

@end

@implementation DZCelebrityHallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark LeavesViewDataSource methods

- (NSUInteger) numberOfPagesInLeavesView:(LeavesView*)leavesView {
	return images.count;
}

- (void) renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
	
	UIImage *image = [images objectAtIndex:index];
	CGRect imageRect = CGRectMake(0, 0, 1024, 704);
	NSLog(@"imageRect:%f",imageRect.size.height);
	CGAffineTransform transform = aspectFit(imageRect,
																					CGContextGetClipBoundingBox(ctx));
	CGContextConcatCTM(ctx, transform);
	CGContextDrawImage(ctx, imageRect, [image CGImage]);
}

CGAffineTransform aspectFit(CGRect innerRect, CGRect outerRect) {
	CGFloat scaleFactor = MIN(outerRect.size.width/innerRect.size.width, outerRect.size.height/innerRect.size.height);
	CGAffineTransform scale = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
	CGRect scaledInnerRect = CGRectApplyAffineTransform(innerRect, scale);
	CGAffineTransform translation =
	CGAffineTransformMakeTranslation((outerRect.size.width - scaledInnerRect.size.width) / 2 - scaledInnerRect.origin.x,
																	 (outerRect.size.height - scaledInnerRect.size.height) / 2 - scaledInnerRect.origin.y);
	return CGAffineTransformConcat(scale, translation);
}

- (id)init {
	if (self = [super init]) {
		images = [[NSMutableArray alloc] init];
		imagesPath = [[NSMutableArray alloc] init];
		
		NSError *error = nil;
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSArray *arr = [fileManager contentsOfDirectoryAtPath:imagesFloders error:&error];
		NSMutableArray *mArr = [[NSMutableArray alloc] init];
		for (int i = 0; i < arr.count;i++) {
			[mArr addObject:[NSString stringWithFormat:@"%d",i]];
			NSString *imagePath = [NSString stringWithFormat:@"%@/%@",imagesFloders,[arr objectAtIndex:i]];
			[imagesPath addObject:imagePath];
			UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:imagePath]]];
			[images addObject:image];
		}
	}
	
	UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.frame = CGRectMake(928, 609, 96, 96);
	[btn setBackgroundImage:[UIImage imageNamed:@"zoomBig"] forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(jumpToFullScreen:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	return self;
}

-(void)jumpToFullScreen:(id)sender{
	NSString *imagePath = [imagesPath objectAtIndex:self.leavesView.currentPageIndex];
	fullScreen = [[DZFullScreenViewController alloc] init];
	DZAppDelegate *dzDelegate = [[UIApplication sharedApplication] delegate];
	fullScreen.imageURL = imagePath;
	[dzDelegate.viewController.view addSubview:fullScreen.view];
	[self shakeToShow:fullScreen.view];
}

//*************放大过程中出现的缓慢动画*************
- (void) shakeToShow:(UIView*)aView{
	CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	animation.duration = 0.5;
	
	NSMutableArray *values = [NSMutableArray array];
	[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
	//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
	//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
	[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
	animation.values = values;
	[aView.layer addAnimation:animation forKey:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
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
