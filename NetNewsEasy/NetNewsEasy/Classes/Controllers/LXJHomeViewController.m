//
//  LXJHomeViewController.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJHomeViewController.h"

@interface LXJHomeViewController ()

/**
 频道view
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

/**
 新闻正文View
 */
@property (weak, nonatomic) IBOutlet UICollectionView *newsView;

@end

@implementation LXJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
