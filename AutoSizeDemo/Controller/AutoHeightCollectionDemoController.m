//
//  AutoHeightCollectionDemoController.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/29.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "AutoHeightCollectionDemoController.h"
#import "AutoSizeCollectionViewCell.h"
@interface AutoHeightCollectionDemoController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong)NSArray *titles;
@end

@implementation AutoHeightCollectionDemoController
- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[AutoSizeCollectionViewCell class] forCellWithReuseIdentifier:@"AutoSizeCollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumLineSpacing = 10.0f;
        _flowLayout.minimumInteritemSpacing = 10.0f;
        _flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    }
    return _flowLayout;
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
                    @"they display",
                    @"view to communicate",
                    @"view the layout system",
                    @"Custom views typically",
                    @"they",
                    @"view to",
                    @"communicate to the layout system",
                    @"Custom",
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
    [self.view addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AutoSizeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AutoSizeCollectionViewCell" forIndexPath:indexPath];
    cell.des = self.titles[indexPath.row];
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
