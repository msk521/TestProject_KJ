//
//  DZLookPDFViewController.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
typedef void (^GoBack1)(UIView *view);
@interface DZLookPDFViewController : DZBaseViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,copy) GoBack1 goBack;
@end
