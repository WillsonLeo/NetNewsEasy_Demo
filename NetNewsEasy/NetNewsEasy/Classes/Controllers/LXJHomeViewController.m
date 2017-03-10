//
//  LXJHomeViewController.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJHomeViewController.h"
#import "LXJChannelModel.h"
#import "LXJChannelLabel.h"
#import "LXJNewsViewFlowLayout.h"
#import "LXJNewsViewCell.h"
#import "LXJSessionManager.h"

@interface LXJHomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

/**
 频道view
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

/**
 新闻正文View
 */
@property (weak, nonatomic) IBOutlet UICollectionView *newsView;


@property (weak, nonatomic) IBOutlet LXJNewsViewFlowLayout *newsViewFlowLayout;

/**
 频道数据
 */
@property (nonatomic, strong) NSArray<LXJChannelModel*> *channelData;

@end

//新闻界面的UICollectionViewCell 的重用 ID
static NSString *newsViewCellID = @"newsViewCellID";

@implementation LXJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取频道数据并进行展示
    [self loadChannelDataAndDisplay];
    
    // 界面搭建
    [self setupUI];
    
}

// 界面搭建
- (void) setupUI{
    // 如果在导航控制器的下面有滚动视图 内容将=自动往下偏移64,因此需要关闭
    self.automaticallyAdjustsScrollViewInsets = NO;

    // 关闭channelView的水平垂直指示器
    self.channelView.showsVerticalScrollIndicator = NO;
    self.channelView.showsHorizontalScrollIndicator = NO;
    
    // 设置newsView的数据源和代理对象
    self.newsView.dataSource = self;
    self.newsView.delegate = self;
    
    //关闭弹簧
    self.newsView.bounces = NO;
    // 打开分页
    self.newsView.pagingEnabled = YES;
    // 关闭水平垂直指示器
    self.newsView.showsHorizontalScrollIndicator = NO;
    self.newsView.showsVerticalScrollIndicator = NO;
    // 打开预加载[还是有些不懂]
    self.newsView.prefetchingEnabled = YES;
}

// MARK:2. 实现UICollectionView的数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channelData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LXJNewsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:newsViewCellID forIndexPath:indexPath];
    
    LXJChannelModel *channelModel = self.channelData[indexPath.item];
    NSString *htmlStr = [NSString stringWithFormat:@"%@/0-20.html",channelModel.tid];
    [[LXJSessionManager sharedManager] requestDataWithURLStr:htmlStr RequestType:GET Parameters:nil success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    return cell;
}

// MARK:1. 获取频道数据并进行展示
- (void) loadChannelDataAndDisplay{
    // 对频道数据进行初始化
    self.channelData = [LXJChannelModel loadChannelData];
    
    // 设置 channelLabel 的宽高
    CGFloat channelLabelWidth = [UIScreen mainScreen].bounds.size.width / 5.0;
    CGFloat channelLabelHeight = self.channelView.bounds.size.height;
    
    // 遍历数据组
    [self.channelData enumerateObjectsUsingBlock:^(LXJChannelModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 创建channelLabel
        LXJChannelLabel *channelLabel = [[LXJChannelLabel alloc] initWithFrame: CGRectMake(idx * channelLabelWidth, 0, channelLabelWidth, channelLabelHeight)];
        // 显示内容
        channelLabel.text = self.channelData[idx].tname;
        // 设置文字大小
        channelLabel.font = [UIFont systemFontOfSize:15];
        // 设置文字居中方式
        channelLabel.textAlignment = NSTextAlignmentCenter;
        // 添加到channelView上
        [self.channelView addSubview:channelLabel];
    }];
    // 设置channelView的滚动范围
    self.channelView.contentSize = CGSizeMake(channelLabelWidth * self.channelData.count, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
