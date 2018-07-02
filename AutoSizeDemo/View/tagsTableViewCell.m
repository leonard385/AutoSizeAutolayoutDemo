//
//  tagsTableViewCell.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/27.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "tagsTableViewCell.h"
#import "TTGTextTagCollectionView.h"
#import "UIView+Extense.h"
@interface tagsTableViewCell()<TTGTextTagCollectionViewDelegate>
@property(nonatomic,strong)TTGTextTagCollectionView * textCollectionView;//标签页
@property(nonatomic,strong)TTGTextTagConfig *tagConfig;
@end

@implementation tagsTableViewCell

- (TTGTextTagCollectionView *)textCollectionView
{
    if (_textCollectionView == nil) {
        _textCollectionView = [[TTGTextTagCollectionView alloc]init];
        _textCollectionView.manualCalculateHeight = YES;
        _textCollectionView.enableTagSelection = YES;
        _textCollectionView.delegate = self;
    }
    return _textCollectionView;
}

- (TTGTextTagConfig *)tagConfig{
    if(_tagConfig == nil){
        TTGTextTagConfig *config = [TTGTextTagConfig new];
        config.tagTextFont = [UIFont systemFontOfSize:12.0f];
        config.tagCornerRadius = 12.0f;
        config.tagSelectedCornerRadius = 12.0f;
        config.tagTextColor = HEXCOLOR(0x666666);
        config.tagSelectedTextColor = HEXCOLOR(0x666666);
        config.tagBackgroundColor = HEXCOLOR(0xffffff);
        config.tagSelectedBackgroundColor = HEXCOLOR(0xffffff);
        config.tagBorderColor = HEXCOLOR(0xcccccc);
        config.tagSelectedBorderColor = HEXCOLOR(0xcccccc);
        config.tagBorderWidth = 0.5f;
        config.tagShadowOpacity = 0.0f;
        _tagConfig = config;
    }
    return _tagConfig;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews{
    [self.contentView addSubview:self.textCollectionView];
    [self.textCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).with.insets(UIEdgeInsetsMake(10.0f, 20.0f, 10.0f, 20.0f));
    }];
    
    __weak typeof(self) weakself = self;
    self.contentView.systemLayoutSizeFittingSizeInvoked = ^{
        __strong typeof(weakself) self = weakself;
        [self.textCollectionView layoutIfNeeded];
        [self.textCollectionView invalidateIntrinsicContentSize];
    };
}

- (void)setTags:(NSArray *)tags{
    _tags = tags;
    [_textCollectionView removeAllTags];
    [_textCollectionView addTags:tags withConfig:self.tagConfig];
    _textCollectionView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20.0f * 2.0f;
}

//开启IOS 8自动高度
//- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize{
//    [_textCollectionView layoutIfNeeded];
//    [_textCollectionView invalidateIntrinsicContentSize];
//    CGSize size = [super systemLayoutSizeFittingSize:targetSize];
//    return size;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
