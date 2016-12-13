//
//  TodayViewController.m
//  TodayExtension
//
//  Created by chuanglong03 on 2016/12/9.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "WidgetHeaderView.h"
#import "NoteList.h"

#define kWidgetWidth ([UIScreen mainScreen].bounds.size.width-16)

@interface TodayViewController () <NCWidgetProviding, WidgetHeaderViewDelegate>

{
    NoteList *noteList;
}

@property (nonatomic, weak) WidgetHeaderView *headerView;
@property (nonatomic, weak) UITableView      *tableView;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeaderView];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    self.preferredContentSize = CGSizeMake(kWidgetWidth, 110);
}

#pragma mark - headerView
- (void)setupHeaderView {
    WidgetHeaderView *headerView = [[WidgetHeaderView alloc] initWithFrame:CGRectMake(0, 0, kWidgetWidth, 110)];
    headerView.delegate = self;
    [self.view addSubview:headerView];
    self.headerView = headerView;
}

#pragma mark - tableView
- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, kWidgetWidth, 200) style:(UITableViewStylePlain)];
    tableView.estimatedRowHeight = 50;
    noteList = [[NoteList alloc] init];
    noteList.vc = self;
    tableView.delegate = noteList;
    tableView.dataSource = noteList;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - WidgetHeaderViewDelegate 代理方法
- (void)headerView:(WidgetHeaderView *)headerView clickTag:(NSInteger)clickTag {
    NSString *urlStr = [NSString stringWithFormat:@"TodayExtension://%ld", clickTag-100];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
    }];
}

#pragma mark - NCWidgetProviding 代理方法
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // NCUpdateResultNewData  新的内容需要重新绘制视图
    // NCUpdateResultNoData   部件不需要更新
    // NCUpdateResultFailed   更新过程中发生错误
    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        self.preferredContentSize = CGSizeMake(maxSize.width, 310);
        [self.tableView reloadData];
    } else {
        self.preferredContentSize = CGSizeMake(maxSize.width, 110);
    }
}

@end
