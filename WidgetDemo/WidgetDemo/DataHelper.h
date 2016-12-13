//
//  DataHelper.h
//  WidgetDemo
//
//  Created by chuanglong03 on 2016/12/12.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHelper : NSObject

// 存储数据
// NSUserDefaults
+ (void)saveDataByNSUserDefaultsWithNSArray:(NSArray *)dataAry;
// NSFileManager
+ (void)saveDataByNSFileManagerWithNSArray:(NSArray *)dataAry;
// 获取数据
// NSUserDefaults
+ (NSArray *)readDataFromNSUserDefaults;
// NSFileManager
+ (NSArray *)readDataFromNSFileManager;

@end
