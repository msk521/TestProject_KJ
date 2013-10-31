//
//  DZProjectUtil.h
//  TestProject
//
//  Created by msk on 13-10-23.
//  Copyright (c) 2013年 AHDZ. All rights reserved.
//

//获取sandbox 里面document path
#define imageStorageDirPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//首页
#define imagesFlodersHome  [imageStorageDirPath stringByAppendingPathComponent:@"Images_HOME"]
//图片的保存path
#define imagesFloders  [imageStorageDirPath stringByAppendingPathComponent:@"Images"]
//活动板块的图path
#define imagesFloders1  [imageStorageDirPath stringByAppendingPathComponent:@"Images_HD"]
//活动板块的活动集锦Images_JJ
#define imagesFloders2  [imageStorageDirPath stringByAppendingPathComponent:@"Images_JJ"]
//狼族风采视频
#define imagesFlodersVido  [imageStorageDirPath stringByAppendingPathComponent:@"Images_Vido"]

//活动视频
#define imagesFlodersHD  [imageStorageDirPath stringByAppendingPathComponent:@"Images_HDVido"]