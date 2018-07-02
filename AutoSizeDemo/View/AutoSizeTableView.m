//
//  MyTableView.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/15.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoSizeTableView.h"

@implementation AutoSizeTableView

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
        NSLog(@"width = %.1f,height = %.1f",self.contentSize.width,self.contentSize.height);
    }
    static NSUInteger num = 0;
    num ++;
    NSLog(@"MyTableView layoutSubviews %lu times",(unsigned long)num);
}

- (CGSize)intrinsicContentSize{
    return self.contentSize;
}


@end
