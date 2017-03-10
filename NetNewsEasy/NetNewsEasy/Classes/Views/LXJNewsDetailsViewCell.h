//
//  LXJNewsDetailsViewCell.h
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXJNewsModel.h"

@interface LXJNewsDetailsViewCell : UITableViewCell

/**
 每个新闻单元格的模型
 */
@property (nonatomic, strong) LXJNewsModel *newsDetailsModel;
@end
