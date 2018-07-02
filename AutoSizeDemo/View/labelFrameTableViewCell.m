//
//  labelFrameTableViewCell.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/28.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "labelFrameTableViewCell.h"
@interface labelFrameTableViewCell()
@property (nonatomic,strong)UILabel *labelTitle;
@end
@implementation labelFrameTableViewCell

- (UILabel *)labelTitle{
    if(_labelTitle == nil){
        _labelTitle = [UILabel new];
        _labelTitle.numberOfLines = 0.0f;
        _labelTitle.backgroundColor = [UIColor grayColor];
        _labelTitle.textColor = [UIColor blackColor];
        _labelTitle.font = [UIFont systemFontOfSize:16.0f];
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

- (void)setUpSubviews{
    CGFloat screenWidth = [UIApplication sharedApplication].keyWindow.bounds.size.width;
    
    CGFloat lableX = 20.0f;
    CGFloat lableY = 10.0f;
    CGFloat lableW = screenWidth - lableX * 2.0f;
    CGFloat lableH = 21.0f;
    self.labelTitle.frame = CGRectMake(lableX, lableY, lableW, lableH);
    [self.contentView addSubview:self.labelTitle];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.labelTitle.text = title;
    
    CGRect frame = self.labelTitle.frame;
    frame.size.height = [self labelHeight:title];
    self.labelTitle.frame = frame;
}

- (CGFloat)labelHeight:(NSString *)title{
    CGFloat screenWidth = [UIApplication sharedApplication].keyWindow.bounds.size.width;
    CGFloat pandingX = 20.0f * 2.0f;
    CGSize textSize = [title boundingRectWithSize:CGSizeMake(screenWidth - pandingX, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:self.labelTitle.font}
                                                  context:nil].size;
    return textSize.height;
}

- (CGSize)sizeThatFits:(CGSize)size{
    CGSize targetSize =  [super sizeThatFits:size];
    targetSize.height = CGRectGetMaxY(self.labelTitle.frame) + 10.0f;
    return targetSize;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
