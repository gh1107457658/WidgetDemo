//
//  NoteList.m
//  WidgetDemo
//
//  Created by chuanglong03 on 2016/12/12.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import "NoteList.h"
#import "DataHelper.h"

@interface NoteList ()

@property (nonatomic, strong) NSMutableArray *noteAry;

@end

@implementation NoteList

- (instancetype)init {
    self = [super init];
    if (self) {
        self.noteAry = [NSMutableArray array];
        [self loadData];
    }
    return self;
}

- (void)loadData {
    [self.noteAry removeAllObjects];
    // 获取数据
    // 1.NSUserDefaults
    NSArray *myNoteAry = [DataHelper readDataFromNSUserDefaults];
    // 2.NSFileManager
    //NSArray *myNoteAry = [DataHelper readDataFromNSFileManager];
    if (myNoteAry) {
        [self.noteAry addObjectsFromArray:myNoteAry];
    }
}

#pragma mark - UITableViewDelegate 和 UITableViewDataSource 方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self loadData];
    return self.noteAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"noteCell"];
    }
    cell.textLabel.text = self.noteAry[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.vc.extensionContext) {
        [self.vc.extensionContext openURL:[NSURL URLWithString:@"TodayExtension://home"] completionHandler:nil];
    }
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [tableView setEditing:NO animated:YES];
        NSString *note = self.noteAry[indexPath.row];
        NSMutableArray *myNoteAry = [NSMutableArray arrayWithArray:[[[NSUserDefaults alloc] initWithSuiteName:@"group.com.chuanglong.widget"] valueForKey:@"MyNote"]];
        [myNoteAry removeObject:note];
        [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.chuanglong.widget"] setValue:myNoteAry forKey:@"MyNote"];
        [self.noteAry removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    return @[delete];
}

@end
