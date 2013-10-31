//
//  DZCharacterViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZCharacterViewController.h"

@interface DZCharacterViewController (){
	int selectedTag;
	NSMutableArray *detailArr;
}

@end

@implementation DZCharacterViewController
/**
 帽子、配饰、上衣、下装、鞋子
 */
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
	
	detailArr = [[NSMutableArray alloc] init];
	NSArray *arr = [NSArray arrayWithObjects:@"毛衫款号：",@"111360202660-003",@"50%羊毛50%腈纶",@"套头毛衫/线衫(合体版)",@"这款毛衫穿着保暖、非常的舒适，羊毛+腈纶混纺质地轻盈、柔软。",@"block1_image1",@"block1_image2",@"block1_image3",@"block1_image4",@"茄克+毛衫+牛仔裤",@"整套搭配彰显了男人时尚休闲的穿衣风格，格子毛衫搭配牛仔裤、茄克，体现了随性、时尚感，。", nil];
	
	NSArray *arr1 = [NSArray arrayWithObjects:@"皮衣款号：",@"111370105032-001",@"绵羊皮 ",@"短版皮茄克(修身版)",@"修身版设计能够很好的体现和修饰身形，加上精准的剪裁，简约而时尚。",@"block2_image1",@"block2_image2",@"block2_image3",@"block2_image4",@"茄克+牛仔裤 ",@"穿着起来突显男人的时尚、帅气，斜拉链茄克与牛仔裤搭配，具有强烈的流行、时尚元素。", nil];
	
	NSArray *arr2 = [NSArray arrayWithObjects:@"大衣款号：",@"111370706281-002",@"60%羊毛35%聚酯纤维5%其他",@"大衣(合体版)",@"这款大衣立领与撞色拼接的设计融合了经典与时尚的元素，充分体现男士的休闲风格，。",@"block3_image1",@"block3_image2",@"block3_image3",@"block3_image4",@"风格+休闲裤 ",@"整套搭配突显您的稳重、成熟又不失时尚感，立领拼接大衣搭配青果领毛衫和休闲裤，非常休闲和时尚。。", nil];
	
	NSArray *arr3 = [NSArray arrayWithObjects:@"西裤款号：",@"111350304277-001",@"77%涤纶20%粘纤3%氨纶",@"中低腰无褶直筒西裤(合体版)",@"这款西裤穿着起来舒适不紧绷，彰显您男士的魅力，中低腰无褶直筒西裤恰到好处的剪裁，更加贴合身线。",@"block4_image1",@"block4_image2",@"block4_image3",@"block4_image4",@"修身单西+印花衬衫 ",@"整体搭配干练有型，修身单西搭配西裤、印花衬衫，时尚、得体，体现男士的优雅品味。", nil];
	
	NSArray *arr4 = [NSArray arrayWithObjects:@"衬衫款号：",@"111350501750-001",@"100%棉",@"商务衬衫(合体版)",@"这款衬衫穿着起来亲肤、舒适、健康，纯棉面料具有良好的吸湿透气性，手感柔软，是冬季衣橱必备单品之一。",@"block5_image1",@"block5_image2",@"block5_image3",@"block5_image4",@"黑色衬衫",@"整套搭配充分展示出男士干练、睿智、时尚的气息，单粒扣戗驳领套西搭配黑色衬衫，简洁、利落。", nil];
	
	NSArray *arr5 = [NSArray arrayWithObjects:@"毛衫款号：",@"111370202759-002",@"100%棉",@"套头毛衫/线衫(合体版)",@"这款毛衫采用了羊毛+锦纶+腈纶混纺，轻盈、柔软、耐磨性好，穿在身上舒适、易打理、不易褶皱，。",@"block6_image1",@"block6_image2",@"block6_image3",@"block6_image4",@"风衣+休闲裤",@"这样的搭配彰显您的时尚品味，舒适、轻盈的毛衫搭配时尚个性的休闲裤，随性、自然。", nil];
	  [detailArr addObject:arr];
		[detailArr addObject:arr1];
		[detailArr addObject:arr2];
		[detailArr addObject:arr3];
		[detailArr addObject:arr4];
		[detailArr addObject:arr5];
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

}

- (IBAction)selectedByBtn:(id)sender {
	UIButton *btn = (UIButton *)sender;
	int tag = btn.tag;
	NSArray *arr = [detailArr objectAtIndex:tag - 100];
		
		self.lookCon = [[DZCharacterDetailViewController alloc] init];
	self.lookCon.typeLab.text = [arr objectAtIndex:0];
	self.lookCon.firstLab.text = [arr objectAtIndex:1];
	self.lookCon.secondLab.text = [arr objectAtIndex:2];
	self.lookCon.thirdLab.text = [arr objectAtIndex:3];
	self.lookCon.fourthLab.text = [arr objectAtIndex:4];
	self.lookCon.image1 = [arr objectAtIndex:5];
	self.lookCon.image2 = [arr objectAtIndex:6];
	self.lookCon.image3 = [arr objectAtIndex:7];
	self.lookCon.image4 = [arr objectAtIndex:8];
	self.lookCon.fiveLab.text = [arr objectAtIndex:9];
	self.lookCon.sixTextView.text = [arr objectAtIndex:10];
	__weak DZCharacterViewController *mainView = self;
		self.lookCon.goBack = ^(UIView *view){
			[UIView animateWithDuration:0.3f animations:^{
				CGRect rect = mainView.lookCon.view.frame;
				rect.origin.x = mainView.lookCon.view.frame.size.width + mainView.btnView.frame.size.width;
				mainView.lookCon.view.frame = rect;
	
			} completion:^(BOOL finished) {
				[mainView.lookCon.view removeFromSuperview];
				mainView.lookCon = nil;
			}];
		};
	
		CGRect rect = self.lookCon.view.frame;
		rect.origin.x = self.lookCon.view.frame.size.width;
		self.lookCon.view.frame = rect;
		[self.view addSubview:self.lookCon.view];
	
		[UIView animateWithDuration:0.3f animations:^{
			CGRect rect = mainView.lookCon.view.frame;
			rect.origin.x = self.btnView.frame.size.width;
			mainView.lookCon.view.frame = rect;
		} completion:^(BOOL finished) {
			
		}];
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
	[self setBtnView:nil];
	[self setMaoziView:nil];
	[super viewDidUnload];
}
@end
