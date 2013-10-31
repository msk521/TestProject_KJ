//
//  PopViewController.h
//  BuickSaleTool
//
//  Created by apple on 13-5-14.
//  Copyright (c) 2013年 MobileReal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopViewControllerDelegate
//获得选择数据
-(void)selectedData:(NSDictionary *)data keyValue:(NSString *)keyValue;
@end

@interface PopViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,retain) IBOutlet UITableView *tabView;
@property (nonatomic ,retain) id<PopViewControllerDelegate>pDelegate;
@property (nonatomic ,retain)  NSMutableArray *tabDataArr;
@property (nonatomic ,assign) BOOL isMore;
@property (nonatomic ,retain) NSMutableDictionary *moreDic;
@property (nonatomic ,copy) NSString *moreDicKey;
@end
