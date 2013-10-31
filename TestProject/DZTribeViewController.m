//
//  DZTribeViewController.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZTribeViewController.h"

@interface DZTribeViewController (){
	MapViewController *_mapViewController;
	NSMutableDictionary *locationAndLocation;
}

@end

@implementation DZTribeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//31.908883,117.275848 31.94385,117.473602  31.939188,117.328033 31.789898,118.124542

-(NSMutableDictionary *)dicFromeFile:(NSString *)fileName{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
	
	NSError *error = nil;
	@try {
		NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingMutableLeaves error:&error];
		NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
		
		return mDic;
		
	}
	@catch (NSException *exception) {
    NSLog(@"error:%@",error);
	}
	@finally {
    
	}
}

- (IBAction)selectedCity:(id)sender {
	UIButton *btn = (UIButton *)sender;

	PopViewController *pop = [[PopViewController alloc] init];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pop];

	pop.pDelegate = self;
	
	NSMutableDictionary *dic = [self dicFromeFile:@"mapData"];
	NSArray *arr = [dic objectForKey:@"result"];
	NSMutableArray *mArr = [[NSMutableArray alloc] init];
	for (id dic in arr) {
		NSDictionary *dataDic = (NSDictionary *)dic;
		[mArr addObject:[[dataDic allKeys] lastObject]];
	}
	pop.tabDataArr = mArr;
	pop.moreDic = [self dicFromeFile:@"mapData"];
	pop.moreDicKey = @"result";
	pop.navigationItem.title = @"选择省份";
	
	UIPopoverController *popVC = [[UIPopoverController alloc] initWithContentViewController:nav];
	
	[popVC setPopoverContentSize:CGSizeMake(pop.view.frame.size.width, pop.view.frame.size.height) animated:YES];
	
	[popVC setDelegate:self];
	[popVC presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES ];
	self.popView = popVC;
}

-(void)LookMapLocation:(NSString *)location{
	NSString *str = [locationAndLocation objectForKey:location];
	NSArray *arr = [str componentsSeparatedByString:@","];
	NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:[arr objectAtIndex:0],@"latitude",[arr lastObject],@"longitude",nil];
	NSArray *array = [NSArray arrayWithObjects:dic1, nil];
	[_mapViewController resetAnnitations:array];
}

-(void)selectedData:(NSDictionary *)data keyValue:(NSString *)keyValue{
	if (data && data.count) {
		self.selectedName.text = [[data allKeys] lastObject];
		NSArray *arr = [[data allValues] lastObject];
    [_mapViewController resetAnnitations:arr];
//		NSMutableArray *mutable1 = [[NSMutableArray alloc] initWithObjects:@"庐阳区飞凤街",@"肥西县金鸣街",@"瑶海区胜利路",@"马鞍山市含山县环峰东路 ‎ ", nil];
//		NSMutableArray *mutableLoc = [[NSMutableArray alloc] initWithObjects:@"31.908883,117.275848",@"31.94385,117.473602",@"31.939188,117.328033",@"31.789898,118.124542", nil];
//		locationAndLocation = [NSMutableDictionary dictionaryWithObjects:mutableLoc forKeys:mutable1];
	}

	[self.popView dismissPopoverAnimated:YES];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	_mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
	_mapViewController.delegate = self;
	CGRect rect = _mapViewController.view.frame;
	rect.origin.y += 44;
	_mapViewController.view.frame = rect;
	[self.view addSubview:_mapViewController.view];
//	[self LookMapLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
	[self setSelectedName:nil];
	[super viewDidUnload];
}
@end
