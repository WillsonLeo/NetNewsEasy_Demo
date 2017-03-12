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

/**
 频道数据
 */
@property (nonatomic, strong) NSMutableArray<LXJChannelLabel*> *channelLabelArr;

@end

//新闻界面的UICollectionViewCell 的重用 ID
static NSString *newsViewCellID = @"newsViewCellID";

@implementation LXJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 界面搭建
    [self setupUI];
    
    // 获取频道数据并进行展示
    [self loadChannelDataAndDisplay];
    
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
    
    // 实例化频道标签的数据组
    self.channelLabelArr = [NSMutableArray array];
}

// MARK:2. 实现UICollectionView的数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channelData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LXJNewsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:newsViewCellID forIndexPath:indexPath];
    
    // 请求网络数据
    LXJChannelModel *channelModel = self.channelData[indexPath.item];
    NSString *URLStr = [NSString stringWithFormat:@"%@/0-20.html",channelModel.tid];
    // 赋值给 cell 的 urlstr
    cell.URLStr = URLStr;
    
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
        
        // 打来 label 的用户交互
        channelLabel.userInteractionEnabled = YES;
        // 创建轻点手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        // 添加到 label 上
        [channelLabel addGestureRecognizer:tapGesture];
        // 设置 label 的 tag 值[说明:任何的 view 都有 tag 属性]
        channelLabel.tag = idx;
        
        // 将创建好的频道 label 添加到数组中进行保存起来
        [self.channelLabelArr addObject:channelLabel];
    }];
    // 设置channelView的滚动范围
    self.channelView.contentSize = CGSizeMake(channelLabelWidth * self.channelData.count, 0);
}

// 点击频道标签的时候在中央显示 label
- (void) tapAction:(UITapGestureRecognizer *)sender {
    // 获取当前点击的 label
    LXJChannelLabel *channelLabel = (LXJChannelLabel *)sender.view;
 
    [self makeCurrentChannelLabelInTheCenter:channelLabel];
    
    // 获取滚动视图的 indexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:channelLabel.tag inSection:0];
    // 使得下面的新闻界面随着点击的时候显示合适的界面
    [self.newsView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

// 使频道标签的居中显示
- (void) makeCurrentChannelLabelInTheCenter:(LXJChannelLabel *)channelLabel {
    // 获取当前 label 的  centerX 的值
    CGFloat channelLabelCenterX = channelLabel.center.x;
    // 计算频道标签的contentoffsetX
    CGFloat channelLabelContentOffsetX = channelLabelCenterX - self.view.bounds.size.width * .5;
    
    // 修复点击头尾 cell 的位置问题
    CGFloat channelLabelContentOffsetXMin = 0;
    CGFloat channelLabelContentOffsetXMax = self.channelView.contentSize.width - self.view.bounds.size.width;
    
    // 判断channelLabelContentOffsetX的值得范围
    if (channelLabelContentOffsetX < channelLabelContentOffsetXMin) {
        channelLabelContentOffsetX = channelLabelContentOffsetXMin;
    } else if (channelLabelContentOffsetX > channelLabelContentOffsetXMax){
        channelLabelContentOffsetX = channelLabelContentOffsetXMax;
    }

    // 使得当前频道标签滚动到指定位置
    [self.channelView setContentOffset:CGPointMake(channelLabelContentOffsetX, 0) animated:YES];
}

// 滑动下面的新闻界面,是对应的频道标签居中[时机:在滑动减速的时候执行]
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 根据偏移量计算下边
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
//    NSLog(@"当前是第 %zd 页", index);
    // 根据当前下标时标签偏移到中心的位处
    [self makeCurrentChannelLabelInTheCenter:[self.channelLabelArr objectAtIndex:index]];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
