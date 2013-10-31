//
//  DZHomeViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZHomeViewController.h"

@interface DZHomeViewController (){
	NSMutableDictionary *carDataDic;
	int currentIndex;
}

@end

@implementation DZHomeViewController

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
	NSArray *arr = [fileManager contentsOfDirectoryAtPath:imagesFlodersHome error:&error];
	NSMutableArray *mArr = [[NSMutableArray alloc] init];
	NSMutableArray *filePathArr = [[NSMutableArray alloc] init];
	for (int i = 0; i < arr.count;i++) {
			[mArr addObject:[NSString stringWithFormat:@"%d",i]];
			[filePathArr addObject:[NSString stringWithFormat:@"%@/%@",imagesFlodersHome,[arr objectAtIndex:i]]];
	}
	NSLog(@"arrcount:%d",filePathArr.count);
	carDataDic = [NSMutableDictionary dictionaryWithObjects:filePathArr forKeys:mArr];
	self.fullScreenScrollView = [[ScrollDemoView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) imgeCount:carDataDic.count];
	[self.fullScreenScrollView setDictionar:carDataDic];
	[self.fullScreenScrollView printDictionar];
	self.fullScreenScrollView.dxelegate = self;
	
	self.fullScreenScrollView.pagingEnabled = YES;
	self.fullScreenScrollView.showsHorizontalScrollIndicator = NO;
	self.fullScreenScrollView.tag = 100;
	[self.view addSubview:self.fullScreenScrollView];
	[self.view sendSubviewToBack:self.fullScreenScrollView];
}

#pragma mark --- ScrollDemoViewDelegate
-(void)scrollViewDidEndToScroll:(int)index{
	
	NSLog(@"index %d   currentIndex %d",index,currentIndex);
	
	if (index == currentIndex)
	{
		return;
	}
	currentIndex = index;
}


- (IBAction)scrollBtn:(id)sender {
	UIButton *btn = (UIButton *)sender;
	int tag = self.fullScreenScrollView.currentPage;
	
	if (btn.tag == 200) {
		//left
		if (tag == 0) {
			return;
		}else{
			tag--;
		}
	}else if(btn.tag == 201){
		//right
		if (self.fullScreenScrollView.currentPage ==  carDataDic.count-1) {
			return;
		}else{
			tag ++;
		}
	}

	 self.fullScreenScrollView.currentPage = tag;
	 self.fullScreenScrollView.checkDouble = NO;
	[self.fullScreenScrollView refreshPageViewAfterPaged:[NSNumber numberWithInt:tag - 1]];
	[UIView animateWithDuration:0.4F animations:^{
			[self.fullScreenScrollView.scrollView scrollRectToVisible:CGRectMake(tag * self.fullScreenScrollView.frame.size.width, 0, self.fullScreenScrollView.frame.size.width, self.fullScreenScrollView.frame.size.height) animated:YES];
	} completion:^(BOOL finished) {
		
	}];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
