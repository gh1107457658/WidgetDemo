//
//  WidgetHeaderView.m
//  Widget
//
//  Created by chuanglong03 on 2016/11/17.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import "WidgetHeaderView.h"
#import "WidgetButton.h"

@interface WidgetHeaderView ()

@property (nonatomic, strong) NSArray *infoAry;

@end

@implementation WidgetHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWidgetButton];
    }
    return self;
}

#pragma mark - 设置 WidgetButton
- (void)setupWidgetButton {
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat magin = 10;
    CGFloat widgetBtnWidth = (width-5*magin)/4.0;
    CGFloat widgetBtnHeight = height-2*magin;
    for (NSInteger i = 0; i < 4; i++) {
        CGFloat widgetBtnX = magin+i*(widgetBtnWidth+magin);
        WidgetButton *widgetBtn = [[WidgetButton alloc] initWithFrame:CGRectMake(widgetBtnX, magin, widgetBtnWidth, widgetBtnHeight)];
        [widgetBtn setImage:[UIImage imageNamed:self.infoAry[i][@"imageName"]] forState:(UIControlStateNormal)];
        [widgetBtn setTitle:self.infoAry[i][@"title"] forState:(UIControlStateNormal)];
        [widgetBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [widgetBtn addTarget:self action:@selector(widgetBtnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
        widgetBtn.tag = 100+i;
        [self addSubview:widgetBtn];
    }
}

#pragma mark - 点击 WidgetButton
- (void)widgetBtnClicked:(WidgetButton *)widgetBtn {
    if ([self.delegate respondsToSelector:@selector(headerView:clickTag:)]) {
        [self.delegate headerView:self clickTag:widgetBtn.tag];
    }
}

#pragma mark - 懒加载
- (NSArray *)infoAry {
    if(_infoAry == nil) {
        _infoAry = [[NSArray alloc] initWithObjects:@{@"imageName":@"diagnosis_wg", @"title":@"诊疗中心"}, @{@"imageName":@"season_wg", @"title":@"时令养生"}, @{@"imageName":@"test_wg", @"title":@"体质测试"}, @{@"imageName":@"game_wg", @"title":@"游戏"}, nil];
    }
    return _infoAry;
}

@end
