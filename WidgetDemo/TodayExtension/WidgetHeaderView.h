//
//  WidgetHeaderView.h
//  Widget
//
//  Created by chuanglong03 on 2016/11/17.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WidgetHeaderView;

@protocol WidgetHeaderViewDelegate <NSObject>

@optional
- (void)headerView:(WidgetHeaderView *)headerView clickTag:(NSInteger)clickTag;

@end

@interface WidgetHeaderView : UIView

@property (nonatomic, assign) id<WidgetHeaderViewDelegate> delegate;

@end
