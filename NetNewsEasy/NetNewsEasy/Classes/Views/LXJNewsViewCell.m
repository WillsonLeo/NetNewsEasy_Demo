//
//  LXJNewsViewCell.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJNewsViewCell.h"
#import "LXJNewsViewController.h"

@implementation LXJNewsViewCell{
    LXJNewsViewController *tableVC;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}
// 界面搭建
- (void)setupUI {
    tableVC = [[LXJNewsViewController alloc] initWithStyle:UITableViewStylePlain];
    tableVC.view.frame = self.bounds;
    // 设置每个 cell 的背景颜色
    tableVC.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    // 添加到父控件上面
    [self.contentView addSubview:tableVC.view];
}

- (void)setURLStr:(NSString *)URLStr{
    _URLStr = URLStr;
    
    // 赋值给tableVC
    tableVC.URLStr = URLStr;
}
@end
