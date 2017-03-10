//
//  LXJNewsViewFlowLayout.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJNewsViewFlowLayout.h"
#define NAVBAR_HEIGHT 64
#define CHANNELVIEW_HEIGHT 44


@implementation LXJNewsViewFlowLayout
- (void)prepareLayout{
    [super prepareLayout];
    
    // 设置每个 item 的大小
    self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - (NAVBAR_HEIGHT + CHANNELVIEW_HEIGHT));
    
    // 设置间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    //设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}
@end
