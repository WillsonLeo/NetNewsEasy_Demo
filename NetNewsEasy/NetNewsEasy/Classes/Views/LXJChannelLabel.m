//
//  LXJChannelLabel.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJChannelLabel.h"

@implementation LXJChannelLabel
// 重写属性的 set 方法
- (void)setScale:(CGFloat)scale{
    _scale = scale;
    
    // 设置颜色变化
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1.0];
    // 设置形变
    scale = 1 + scale * .5;
    self.transform = CGAffineTransformMakeScale(scale, scale);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
