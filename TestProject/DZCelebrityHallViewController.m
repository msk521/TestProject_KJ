//
//  DZCelebrityHallViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZCelebrityHallViewController.h"

@interface DZCelebrityHallViewController (){
	NSMutableArray *images;
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
//	CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
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
		NSError *error = nil;
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSArray *arr = [fileManager contentsOfDirectoryAtPath:imagesFloders error:&error];
		NSMutableArray *mArr = [[NSMutableArray alloc] init];
		for (int i = 0; i < arr.count;i++) {
			[mArr addObject:[NSString stringWithFormat:@"%d",i]];
			NSString *imagePath = [NSString stringWithFormat:@"%@/%@",imagesFloders,[arr objectAtIndex:i]];
			
			UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:imagePath]]];
			[images addObject:image];
		}

	}
	return self;
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
