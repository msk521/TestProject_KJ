//
//  PopViewController.m
//  BuickSaleTool
//
//  Created by apple on 13-5-14.
//  Copyright (c) 2013年 MobileReal. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController (){
    //车船使用税 排量
    NSMutableArray *taxFeeDataArr;
}

@end

@implementation PopViewController
@synthesize tabView;
@synthesize pDelegate;
@synthesize tabDataArr;
@synthesize isMore;
@synthesize moreDic;
@synthesize moreDicKey;
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
		self.contentSizeForViewInPopover = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
}

#pragma mark---UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return tabDataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentify = @"indentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentify];
			if (!isMore) {
				[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
			}
    }
	
    cell.textLabel.text = [tabDataArr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if ([[tableView cellForRowAtIndexPath:indexPath] accessoryType] != UITableViewCellAccessoryDisclosureIndicator) {
		[self.pDelegate selectedData:[[moreDic objectForKey:moreDicKey] objectAtIndex:indexPath.row] keyValue:[self.tabDataArr objectAtIndex:indexPath.row]];

	}else{
		
    if (self.tabDataArr.count) {
			PopViewController *pop = [[PopViewController alloc] initWithNibName:@"PopViewController" bundle:nil];
			pop.pDelegate = self.pDelegate;
				NSArray *arr = [[[moreDic objectForKey:moreDicKey] objectAtIndex:indexPath.row] objectForKey:[self.tabDataArr objectAtIndex:indexPath.row]];
				NSMutableArray *mArr = [[NSMutableArray alloc] init];
				for (id dic in arr) {
					NSDictionary *dataDic = (NSDictionary *)dic;
					[mArr addObject:[[dataDic allKeys] lastObject]];
				}
			pop.tabDataArr = mArr;
			NSMutableDictionary *mDic = [[moreDic objectForKey:moreDicKey] objectAtIndex:indexPath.row];
			pop.moreDic = mDic;
			NSString *mDicStr = [self.tabDataArr objectAtIndex:indexPath.row];
			pop.moreDicKey = mDicStr;
			pop.isMore = YES;
//			self.moreDic = mDic;
			pop.navigationItem.title = @"选择市";
			if ([mDicStr rangeOfString:@"市"].location != NSNotFound) {
				pop.isMore = YES;
			}
			[self.navigationController pushViewController:pop animated:YES];
//			UIViewAnimationTransitionCurlDown
		}
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
