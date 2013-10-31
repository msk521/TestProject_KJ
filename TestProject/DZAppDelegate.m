//
//  DZAppDelegate.m
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZAppDelegate.h"

@implementation DZAppDelegate
@synthesize isScrollView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

	NSFileManager *fileManager = [NSFileManager defaultManager];
  NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	
	NSString *fileFloderFirst = [filePath stringByAppendingPathComponent:@"Images_HOME"];
	//首页
	if (![fileManager fileExistsAtPath:fileFloderFirst]) {
		[fileManager createDirectoryAtPath:fileFloderFirst withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	NSString *viodFloder = [filePath stringByAppendingPathComponent:@"Images_Vido"];
	//狼族风采视频
	if (![fileManager fileExistsAtPath:viodFloder]) {
		[fileManager createDirectoryAtPath:viodFloder withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	NSString *fileFloder = [filePath stringByAppendingPathComponent:@"Images"];
	//名士堂
	if (![fileManager fileExistsAtPath:fileFloder]) {
	[fileManager createDirectoryAtPath:fileFloder withIntermediateDirectories:YES attributes:nil error:nil];		
	}
		
	NSString *fileFloder1 = [filePath stringByAppendingPathComponent:@"Images_HD"];
	//活动案例
	if (![fileManager fileExistsAtPath:fileFloder1]) {
		[fileManager createDirectoryAtPath:fileFloder1 withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	NSString *fileFloder2 = [filePath stringByAppendingPathComponent:@"Images_JJ"];
	//活动集锦
	if (![fileManager fileExistsAtPath:fileFloder2]) {
		[fileManager createDirectoryAtPath:fileFloder2 withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	NSString *fileHDFloder = [filePath stringByAppendingPathComponent:@"Images_HDVido"];
	//活动视频
	if (![fileManager fileExistsAtPath:fileHDFloder]) {
		[fileManager createDirectoryAtPath:fileHDFloder withIntermediateDirectories:YES attributes:nil error:nil];
	}
//Images_HDVido
	self.viewController = [[DZViewController alloc] initWithNibName:@"DZViewController" bundle:nil];
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.backgroundColor = [UIColor whiteColor];
		[self.window setRootViewController:self.viewController];
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
	
	return UIInterfaceOrientationMaskAll;
	
}
//#endif


- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
