//
//  LXJNewsDetailsViewCell.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJNewsDetailsViewCell.h"
#import <UIImageView+WebCache.h>
#import <UIImageView+WebCache.h>
#import "LXJPicInfoModel.h"

@interface LXJNewsDetailsViewCell ()

/**
新闻图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageViewImgsrc;

/**
 新闻标题
 */
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

/**
 新闻来源
 */
@property (weak, nonatomic) IBOutlet UILabel *labelSource;

/**
 回复数量
 */
@property (weak, nonatomic) IBOutlet UILabel *labelReplyCount;

/**
 更多的图片
 */
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *morePicImg;

@end


@implementation LXJNewsDetailsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //界面搭建
    [self setupUI];
}

// 界面搭建
- (void) setupUI{
    //  设置图片的填充模式 将超出部分进行剪裁
    self.imageViewImgsrc.contentMode = UIViewContentModeScaleAspectFill;
    self.imageViewImgsrc.clipsToBounds = YES;
    
    
}

// 重写模型的 set 方法
- (void)setNewsDetailsModel:(LXJNewsModel *)newsDetailsModel{
    _newsDetailsModel = newsDetailsModel;
    // 控件上显示对应的内容
    [self.imageViewImgsrc sd_setImageWithURL:[NSURL URLWithString:newsDetailsModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.labelTitle.text = newsDetailsModel.title;
    self.labelSource.text = newsDetailsModel.source;
    self.labelReplyCount.text = [NSString stringWithFormat:@"%zd",newsDetailsModel.replyCount];
    
    // 遍历morePicImg数组 给剩余两张图片进行图片内容显示
    [self.morePicImg enumerateObjectsUsingBlock:^(UIImageView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 根据下标获取对应的模型URL 路径
//        NSString *URLStr = [newsDetailsModel.imgextra[idx] objectForKey:@"imgsrc"];
        // 根据下标获取对应的 picinfo 模型
        LXJPicInfoModel *picInfo = newsDetailsModel.imgextra[idx];
        // 在对应的图片显示内容
        [obj sd_setImageWithURL:[NSURL URLWithString:picInfo.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
