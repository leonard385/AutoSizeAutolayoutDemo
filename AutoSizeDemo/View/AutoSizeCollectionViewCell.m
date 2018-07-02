//
//  AutoSizeCollectionViewCell.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/29.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoSizeCollectionViewCell.h"
@interface AutoSizeCollectionViewCell()
@property (nonatomic,strong)UILabel *labelContent;
@end

@implementation AutoSizeCollectionViewCell

- (UILabel *)labelContent{
    if(_labelContent == nil){
        _labelContent = [UILabel new];
        _labelContent.font = [UIFont systemFontOfSize:18.0f];
        _labelContent.textColor = [UIColor blackColor];
        _labelContent.numberOfLines = 0.0f;
    }
    return _labelContent;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews{
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.labelContent];
    _labelContent.preferredMaxLayoutWidth = 80.0f;
    [_labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).with.insets(UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f));
    }];
}

- (void)setDes:(NSString *)des{
    _des = des;
    self.labelContent.text = des;
}
@end
