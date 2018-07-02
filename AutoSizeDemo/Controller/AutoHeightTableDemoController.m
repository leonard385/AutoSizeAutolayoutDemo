//
//  AutoHeightTableDemoController.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/29.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoHeightTableDemoController.h"
#import "labelAutolayoutTableViewCell.h"
@interface AutoHeightTableDemoController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong)NSArray *titles;
@end

@implementation AutoHeightTableDemoController

- (UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [UITableView new];
        [_tableView registerClass:[labelAutolayoutTableViewCell class] forCellReuseIdentifier:@"labelAutolayoutTableViewCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 44.0f;
        _tableView.rowHeight = UITableViewAutomaticDimension;
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
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    labelAutolayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labelAutolayoutTableViewCell"];
    if(cell == nil){
        cell = [[labelAutolayoutTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"labelAutolayoutTableViewCell"];
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
