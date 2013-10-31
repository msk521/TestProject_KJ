//
//  DZViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZViewController.h"

@interface DZViewController (){
	NSMutableDictionary *carDataDic;
	int currentIndex;
}
@end

@implementation DZViewController

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
	self.activityCon = [[DZActivityViewController alloc] init];
	[self.conView addSubview:self.activityCon.view];
	
	self.messageCon = [[DZMessageViewController alloc] init];
	[self.conView addSubview:self.messageCon.view];
	
	self.tribeCon = [[DZTribeViewController alloc] init];
	[self.conView addSubview:self.tribeCon.view];
	
	self.celebrityCon = [[DZCelebrityHallViewController alloc] init];
	self.celebrityCon.view.frame = self.tribeCon.view.frame;
	[self.conView addSubview:self.celebrityCon.view];
	
	self.wolvesCon = [[DZWolvesViewController alloc] init];
	[self.conView addSubview:self.wolvesCon.view];
	
	self.characterCon = [[DZCharacterViewController alloc] init];
	[self.conView addSubview:self.characterCon.view];
	
	self.vipCon = [[DZVIPViewController alloc] init];
	[self.conView addSubview:self.vipCon.view];
	
	self.homeCon = [[DZHomeViewController alloc] init];
	[self.conView addSubview:self.homeCon.view];
	
}

- (IBAction)segMentValueChanged:(id)sender {
	UIButton *seg = (UIButton *)sender;
	for (UIView *view in self.btnView.subviews) {
		if ([view isKindOfClass:[UIButton class]]) {
			UIButton *btn = (UIButton *)view;
			btn.selected = NO;
		}
	}

	seg.selected = YES;
	
	if (seg.tag == 100) {
		//首页
		[self.conView bringSubviewToFront:self.homeCon.view];
		
	}
	else if(seg.tag == 101){
		//vip俱乐部
		[self.conView bringSubviewToFront:self.vipCon.view];
		
	}else if(seg.tag == 102){
		//品格搭配
		[self.conView bringSubviewToFront:self.characterCon.view];
		
	}else if(seg.tag == 103){
		//狼族风采
		[self.conView bringSubviewToFront:self.wolvesCon.view];
		
	}else if(seg.tag == 104){
		//名士堂
		[self.conView bringSubviewToFront:self.celebrityCon.view];
		
	}else if(seg.tag == 105){
		//狼族部落图
		[self.conView bringSubviewToFront:self.tribeCon.view];
		
	}else if(seg.tag == 106){
		//留言板
		[self.conView bringSubviewToFront:self.messageCon.view];
	}else if(seg.tag == 107){
		//活动板块
		[self.conView bringSubviewToFront:self.activityCon.view];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fullScreen{
//	[[UIApplication sharedApplication]
//	 
//	 setStatusBarHidden:YES
//	 
//	 withAnimation:UIStatusBarAnimationNone];
//	self.wantsFullScreenLayout = YES;
//	CGRect rect =	CGRectMake(0, 0, 1024, self.view.frame.size.height);
//	self.view.frame = rect;
}

- (void)viewDidUnload {
	[self setConView:nil];
	[self setBtnView:nil];
	[super viewDidUnload];
}
@end
