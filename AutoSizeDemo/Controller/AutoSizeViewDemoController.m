//
//  AutoSizeViewDemoController.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/29.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoSizeViewDemoController.h"
#import "AutoSizeView.h"
@interface AutoSizeViewDemoController ()
@property (nonatomic,strong)AutoSizeView *sizeView;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSArray *titles;
@end

@implementation AutoSizeViewDemoController

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

- (AutoSizeView *)sizeView{
    if(_sizeView == nil){
        _sizeView = [AutoSizeView new];
        _sizeView.backgroundColor = [UIColor lightGrayColor];
    }
    return _sizeView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self dataInit];
    [self setUpSubviews];
    [self.timer fire];
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

- (void)setUpSubviews{
    [self.view addSubview:self.sizeView];
    [_sizeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(88.0f);
        make.left.mas_equalTo(self.view).with.offset(20.0f);
        make.right.mas_equalTo(self.view).with.offset(-20.0f);
    }];
}

- (void)changeContent{
    int length = arc4random() % self.titles.count;
    NSRange range;
    range.location = 0;
    range.length = length;
    self.sizeView.title = self.titles[length];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
