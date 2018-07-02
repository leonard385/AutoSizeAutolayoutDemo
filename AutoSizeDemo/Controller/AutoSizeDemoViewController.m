//
//  AutoSizeDemoViewController.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/13.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoSizeDemoViewController.h"
#import <Masonry/Masonry.h>
#import "headView.h"
@interface AutoSizeDemoViewController ()
@property (nonatomic,strong)NSArray *titles;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong)headView *head;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation AutoSizeDemoViewController
- (UIScrollView *)scrollView{
    if(_scrollView == nil){
        _scrollView = [UIScrollView new];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (UIView *)contentView{
    if(_contentView == nil){
        _contentView = [UIView new];
    }
    return _contentView;
}
- (headView *)head{
    if(_head == nil){
        _head = [headView new];
    }
    return _head;
}

- (NSTimer *)timer{
    if(_timer == nil){
        __weak typeof(self) weakself = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            __strong typeof(weakself) self = weakself;
            [self changeContent];
        }];
    }
    return _timer;
}


- (void)updateViewConstraints{
    [super updateViewConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.head];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self.scrollView);
        make.centerX.mas_equalTo(self.scrollView);
    }];
    
    [_head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).priorityHigh();
    }];
    
    [self.timer fire];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dataInit{
    self.titles = @[
                    @"Custom views typically have content that",
                    @"they display of which the layout system is unaware. Setting this property allows a custom view to communicate to the layout system what size it would like to be based on its content.",
                    @"view to communicate to the layout system what size it would like to be based on its content. This intrinsic size must be independent of the content frame, because there’s no way to dynamically communicate a changed width to the layout system based on a changed height, for example.",
                    @"view to communicate to the layout system",
                    @"Custom views typically have content that",
                    @"they display of which the layout system is unaware. Setting this property allows a custom view to communicate to the layout system what size it would like to be based on its content.",
                    @"view to communicate to the layout system what size it would like to be based on its content. This intrinsic size must be independent of the content frame, because there’s no way to dynamically communicate a changed width to the layout system based on a changed height, for example.",
                    @"view to communicate to the layout system",
                    @"Custom views typically have content that",
                    @"they display of which the layout system is unaware. Setting this property allows a custom view to communicate to the layout system what size it would like to be based on its content.",
                    @"view to communicate to the layout system what size it would like to be based on its content. This intrinsic size must be independent of the content frame, because there’s no way to dynamically communicate a changed width to the layout system based on a changed height, for example.",
                    @"view to communicate to the layout system",
                    ];
}

- (void)changeContent{
    int length = arc4random() % self.titles.count;
    NSRange range;
    range.location = 0;
    range.length = length;
    NSArray *tmpTitles = [self.titles subarrayWithRange:range];
    self.head.titles = tmpTitles;
    self.head.content = self.titles[length];
    self.head.describes = tmpTitles;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
