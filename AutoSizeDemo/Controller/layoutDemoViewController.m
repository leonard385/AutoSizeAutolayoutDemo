//
//  layoutDemoViewController.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/28.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "layoutDemoViewController.h"
#import "labelFrameTableViewCell.h"
@interface layoutDemoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titles;
@end

@implementation layoutDemoViewController
- (UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[labelFrameTableViewCell class] forCellReuseIdentifier:@"labelFrameTableViewCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0.0f;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self dataInit];
    [self setUpSubviews];
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
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static labelFrameTableViewCell *cell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [tableView dequeueReusableCellWithIdentifier:@"labelFrameTableViewCell"];
    });
    cell.title = self.titles[indexPath.row];
    
    CGFloat contentViewWidth = CGRectGetWidth(self.tableView.bounds);
    CGRect cellBounds = cell.bounds;
    cellBounds.size.width = contentViewWidth;
    cell.bounds = cellBounds;
    
    CGFloat rightSystemViewsWidth = 0.0;
    for (UIView *view in tableView.subviews) {//索引
        if ([view isKindOfClass:NSClassFromString(@"UITableViewIndex")]) {
            rightSystemViewsWidth = CGRectGetWidth(view.frame);
            break;
        }
    }
    //辅助视图
    if (cell.accessoryView) {
        rightSystemViewsWidth += 16 + CGRectGetWidth(cell.accessoryView.frame);
    } else {
        static const CGFloat systemAccessoryWidths[] = {
            [UITableViewCellAccessoryNone] = 0,
            [UITableViewCellAccessoryDisclosureIndicator] = 34,
            [UITableViewCellAccessoryDetailDisclosureButton] = 68,
            [UITableViewCellAccessoryCheckmark] = 40,
            [UITableViewCellAccessoryDetailButton] = 48
        };
        rightSystemViewsWidth += systemAccessoryWidths[cell.accessoryType];
    }
    
    if ([UIScreen mainScreen].scale >= 3 && [UIScreen mainScreen].bounds.size.width >= 414) {
        rightSystemViewsWidth += 4;
    }
    
    contentViewWidth -= rightSystemViewsWidth;
    
    CGFloat fittingHeight = 0;
    fittingHeight = [cell sizeThatFits:CGSizeMake(contentViewWidth, 0)].height;
    
    // Still zero height after all above.
    if (fittingHeight == 0) {
        // Use default row height.
        fittingHeight = 44;
    }
    
    // Add 1px extra space for separator line if needed, simulating default UITableViewCell.
    if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        fittingHeight += 1.0 / [UIScreen mainScreen].scale;
    }
    
    return fittingHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    labelFrameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labelFrameTableViewCell"];
    if(cell == nil){
        cell = [[labelFrameTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"labelFrameTableViewCell"];
    }
    cell.title = self.titles[indexPath.row];
    return cell;
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
