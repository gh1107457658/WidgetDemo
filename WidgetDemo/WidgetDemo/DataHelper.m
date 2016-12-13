//
//  DataHelper.m
//  WidgetDemo
//
//  Created by chuanglong03 on 2016/12/12.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import "DataHelper.h"

@implementation DataHelper

#pragma mark - 存储数据
// NSUserDefaults
+ (void)saveDataByNSUserDefaultsWithNSArray:(NSArray *)dataAry {
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.chuanglong.widget"];
    [userDefaults setValue:dataAry forKey:@"MyNote"];
    [userDefaults synchronize];
}

// NSFileManager
+ (void)saveDataByNSFileManagerWithNSArray:(NSArray *)dataAry {
    NSURL *containerUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.chuanglong.widget"];
    containerUrl = [containerUrl URLByAppendingPathComponent:@"Library/Caches/MyNote"];
    [dataAry writeToURL:containerUrl atomically:YES];
}

#pragma mark - 获取数据
// NSUserDefaults
+ (NSArray *)readDataFromNSUserDefaults {
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.chuanglong.widget"];
    NSArray *myNoteAry = [userDefaults valueForKey:@"MyNote"];
    return myNoteAry;
}

// NSFileManager
+ (NSArray *)readDataFromNSFileManager {
    NSURL *containerUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.chuanglong.widget"];
    containerUrl = [containerUrl URLByAppendingPathComponent:@"Library/Caches/MyNote"];
    NSArray *myNoteAry = [NSArray arrayWithContentsOfURL:containerUrl];
    return myNoteAry;
}

@end
