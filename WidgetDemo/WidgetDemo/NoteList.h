//
//  NoteList.h
//  WidgetDemo
//
//  Created by chuanglong03 on 2016/12/12.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NoteList : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIViewController *vc;

@end
