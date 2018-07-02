//
//  labelAutolayoutTableViewCell.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/27.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "labelAutolayoutTableViewCell.h"
#import <Masonry/Masonry.h>
@interface labelAutolayoutTableViewCell()
@property (nonatomic,strong)UILabel *labelTitle;
@end

@implementation labelAutolayoutTableViewCell

- (UILabel *)labelTitle{
    if(_labelTitle == nil){
        _labelTitle = [UILabel new];
        _labelTitle.numberOfLines = 0.0f;
        _labelTitle.backgroundColor = [UIColor grayColor];
        _labelTitle.textColor = [UIColor blackColor];
    }
    return _labelTitle;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpSubviews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setUpSubviews{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelTitle];
    
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).with.insets(UIEdgeInsetsMake(20.0f, 20.0f, 20.0f, 20.0f));
    }];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.labelTitle.text = title;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
