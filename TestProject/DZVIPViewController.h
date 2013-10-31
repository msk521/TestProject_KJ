//
//  DZVIPViewController.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZVIPViewController : DZBaseViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
