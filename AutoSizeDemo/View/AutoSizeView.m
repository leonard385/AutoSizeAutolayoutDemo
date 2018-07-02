//
//  AutoSizeView.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/29.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoSizeView.h"
@interface AutoSizeView()
@property (nonatomic,strong)UILabel *labelTitle;
@end
@implementation AutoSizeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UILabel *)labelTitle{
    if(_labelTitle == nil){
        _labelTitle = [UILabel new];
        _labelTitle.numberOfLines = 0.0f;
        _labelTitle.backgroundColor = [UIColor grayColor];
        _labelTitle.textColor = [UIColor blackColor];
    }
    return _labelTitle;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.labelTitle];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).with.insets(UIEdgeInsetsMake(20.0f, 20.0f, 20.0f, 20.0f));
    }];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.labelTitle.text = title;
}


@end
