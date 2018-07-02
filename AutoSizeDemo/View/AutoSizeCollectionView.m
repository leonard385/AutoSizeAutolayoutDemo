//
//  MyCollectionView.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/14.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoSizeCollectionView.h"

@implementation AutoSizeCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews{
    [super layoutSubviews];
    if(!CGSizeEqualToSize(self.bounds.size, self.contentSize)){
        [self invalidateIntrinsicContentSize];
    }
}

- (CGSize)intrinsicContentSize{
    return self.contentSize;
}

@end
