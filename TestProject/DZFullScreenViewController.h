//
//  DZFullScreenViewController.h
//  TestProject
//
//  Created by msk on 13-10-31.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
typedef void(^CloseBlcok) (int);
@interface DZFullScreenViewController : DZBaseViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (copy,nonatomic) NSString *imageURL;
@property (copy,nonatomic) CloseBlcok closeBlock;
@end
