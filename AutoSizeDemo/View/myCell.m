//
//  myCell.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/15.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "myCell.h"
#import <Masonry/Masonry.h>

#import "AutoSizeCollectionView.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface myCell() <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UILabel *lableTitle;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@end
@implementation myCell

- (UILabel *)lableTitle{
    if(_lableTitle == nil){
        _lableTitle = [UILabel new];
        _lableTitle.font = [UIFont systemFontOfSize:18.0f];
        _lableTitle.textColor = [UIColor blackColor];
        _lableTitle.text = @"标题";
    }
    return _lableTitle;
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
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


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpSubviews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    static NSUInteger i = 0;
    NSLog(@"myCell layoutSubviews %ld times",i);
    i++;
}

- (void)setUpSubviews{
    self.contentView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.lableTitle];
    [self.contentView addSubview:self.collectionView];
    
    [_lableTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).with.offset(20.0f);
        make.right.mas_equalTo(self.contentView).with.offset(-20.0f);
        make.height.mas_equalTo(44.0f);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.lableTitle);
        make.top.mas_equalTo(self.lableTitle.mas_bottom);
        make.bottom.mas_equalTo(self.contentView).with.offset(-20.0f);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    return cell;
}

- (void)setCellNum:(NSUInteger)cellNum{
    _cellNum = cellNum;
    [self.collectionView reloadData];
}

//- (CGSize)intrinsicContentSize{
//    return UILayoutFittingExpandedSize;
//}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    CGFloat height = 44.0f + 20.0f + self.collectionView.contentSize.height + 20.0f;
    targetSize.height = height;
    return [super systemLayoutSizeFittingSize:targetSize withHorizontalFittingPriority:horizontalFittingPriority verticalFittingPriority:verticalFittingPriority];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
