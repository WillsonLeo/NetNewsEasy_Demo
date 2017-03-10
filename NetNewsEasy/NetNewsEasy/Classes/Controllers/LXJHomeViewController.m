//
//  LXJHomeViewController.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJHomeViewController.h"
#import "LXJChannelModel.h"

@interface LXJHomeViewController ()

/**
 频道view
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

/**
 新闻正文View
 */
@property (weak, nonatomic) IBOutlet UICollectionView *newsView;

/**
 频道数据
 */
@property (nonatomic, strong) NSArray *channelData;
@end

@implementation LXJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.channelData = [LXJChannelModel loadChannelData];
    NSLog(@"%@", self.channelData);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
