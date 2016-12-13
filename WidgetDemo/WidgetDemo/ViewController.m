//
//  ViewController.m
//  WidgetDemo
//
//  Created by chuanglong03 on 2016/11/30.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import "ViewController.h"
#import "NoteList.h"
#import "DataHelper.h"

@interface ViewController ()

{
    NoteList *noteList;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *noteAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 50;
    noteList = [[NoteList alloc] init];
    self.tableView.delegate = noteList;
    self.tableView.dataSource = noteList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)confirm:(UIButton *)sender {
    NSString *note = self.textField.text;
    // 获取数据
    // 1.NSUserDefaults
    NSArray *myNoteAry = [DataHelper readDataFromNSUserDefaults];
    // 2.NSFileManager
    //NSArray *myNoteAry = [DataHelper readDataFromNSFileManager];
    self.noteAry = [NSMutableArray arrayWithArray:myNoteAry];
    BOOL isNote = note != nil && ![note isEqualToString:@" "];
    if (isNote && ![self.noteAry containsObject:note]) {
        [self.noteAry addObject:note];
    }
    // 存储数据
    // 1.NSUserDefaults
    [DataHelper saveDataByNSUserDefaultsWithNSArray:self.noteAry];
    // 2.NSFileManager
    //[DataHelper saveDataByNSFileManagerWithNSArray:self.noteAry];
    [self.tableView reloadData];
}

@end
