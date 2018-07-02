//
//  headView.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/14.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "headView.h"
#import <Masonry/Masonry.h>
#import "AutoSizeCollectionView.h"
#import "myCell.h"
#import "AutoSizeTableView.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface headView()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UILabel *labelTitle;
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) AutoSizeTableView *tableView;
@property (nonatomic,strong) AutoSizeCollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,copy) NSMutableArray *dataArray;
@end

@implementation headView

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
        _labelTitle.text = @"标题";
        _labelTitle.font = [UIFont systemFontOfSize:28.0f];
        _labelTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _labelTitle;
}

- (UITextView *)textView{
    if(_textView == nil){
        _textView = [UITextView new];
        _textView.backgroundColor = [UIColor redColor];
        _textView.font = [UIFont systemFontOfSize:16.0];
        _textView.textColor = [UIColor blackColor];
        _textView.scrollEnabled = NO;
    }
    return _textView;
}

- (AutoSizeTableView *)tableView{
    if(_tableView == nil){
        _tableView = [AutoSizeTableView new];
        [_tableView registerClass:[myCell class] forCellReuseIdentifier:@"myCell"];
        _tableView.backgroundColor = [UIColor blueColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 44.0f;
//        _tableView.rowHeight = 44.0f;
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}

- (AutoSizeCollectionView *)collectionView{
    if(_collectionView == nil){
        _collectionView = [[AutoSizeCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
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
        _flowLayout.itemSize = CGSizeMake(88.0f, 88.0f);
    }
    return _flowLayout;
}

- (NSMutableArray *)dataArray{
    if(_dataArray == nil){
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

- (void)setUpSubviews{
    self.backgroundColor = [UIColor grayColor];
    [self addSubview:self.labelTitle];
    [self addSubview:self.textView];
    [self addSubview:self.tableView];
    [self addSubview:self.collectionView];
    
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(20.0f);
        make.top.mas_equalTo(self).with.offset(0.0f);
        make.right.mas_equalTo(self).with.offset(-20.0f);
        make.height.mas_equalTo(44.0f);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labelTitle.mas_bottom);
        make.left.right.mas_equalTo(self.labelTitle);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textView.mas_bottom);
        make.left.right.mas_equalTo(self.textView);
        make.bottom.mas_equalTo(self).with.offset(-20.0f);
    }];
    
//    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.textView.mas_bottom);
//        make.left.right.mas_equalTo(self.textView);
//        make.bottom.mas_equalTo(self).with.offset(-20.0f);
//    }];
    self.tableView.tableFooterView = [UIView new];
}

//- (void)updateConstraints{
//    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(self.tableView.contentSize.height);
//    }];
//    [super updateConstraints];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(cell == nil){
        cell = [[myCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
//    NSString *title = self.dataArray[indexPath.row];
//    cell.textLabel.text = title;
    cell.cellNum = self.dataArray.count;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.describes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    return cell;
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.dataArray = [NSMutableArray arrayWithArray:titles];
    [self.tableView reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
        [self layoutIfNeeded];
    });
}

- (void)setContent:(NSString *)content{
    _content = content;
    [self.textView setText:content];
}

- (void)setDescribes:(NSArray *)describes{
    _describes = describes;
    [self.collectionView reloadData];
}

//- (CGSize)intrinsicContentSize{
//    return UILayoutFittingCompressedSize;
//}
//
//- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
//    return [super systemLayoutSizeFittingSize:targetSize withHorizontalFittingPriority:horizontalFittingPriority verticalFittingPriority:verticalFittingPriority];
//}

@end
