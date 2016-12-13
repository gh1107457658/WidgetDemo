//
//  WidgetButton.m
//  Widget
//
//  Created by chuanglong03 on 2016/11/17.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import "WidgetButton.h"

@implementation WidgetButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置图片的位置
    CGRect imageView_frame = self.imageView.frame;
    imageView_frame.size.height = self.imageView.bounds.size.width;
    imageView_frame.origin.x = (self.frame.size.width-self.imageView.bounds.size.width)/2.0;
    imageView_frame.origin.y = 10;
    self.imageView.frame = imageView_frame;
    // 设置 titleLabel 的位置
    CGRect titleLabel_frame = self.titleLabel.frame;
    titleLabel_frame.origin.x = 0;
    titleLabel_frame.origin.y = CGRectGetMaxY(self.imageView.frame)+5;
    titleLabel_frame.size.width = self.bounds.size.width;
    titleLabel_frame.size.height = self.frame.size.height-titleLabel_frame.origin.y;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.frame = titleLabel_frame;
}

@end
