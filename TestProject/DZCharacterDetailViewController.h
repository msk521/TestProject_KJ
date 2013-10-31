//
//  DZCharacterDetailViewController.h
//  TestProject
//
//  Created by msk on 13-10-30.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

#import "DZBaseViewController.h"
typedef void (^GoBack)(UIView *view);
@interface DZCharacterDetailViewController : DZBaseViewController
@property (strong, nonatomic) IBOutlet UILabel *firstLab;
@property (nonatomic,copy) GoBack goBack;
@property (strong, nonatomic) IBOutlet UILabel *secondLab;
@property (strong, nonatomic) IBOutlet UILabel *thirdLab;
@property (strong, nonatomic) IBOutlet UILabel *fourthLab;
@property (strong, nonatomic) IBOutlet UILabel *typeLab;
@property (copy, nonatomic)  NSString *image1;
@property (copy, nonatomic)  NSString *image2;
@property (copy, nonatomic)  NSString *image3;
@property (copy, nonatomic)  NSString *image4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView4;
@property (strong, nonatomic) IBOutlet UILabel *fiveLab;
@property (strong, nonatomic) IBOutlet UITextView *sixTextView;
@end
