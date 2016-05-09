//
//  TZMainContentView.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/7.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZMainContentView.h"
#import "TZMainContentModel.h"
#import "TZMainContentCell.h"

static NSString *const kTZMainContentCellIdentifier = @"TZMainContentCell";

@interface TZMainContentView () < UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation TZMainContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUIWithFrame:frame];
    }
    return self;
}

- (void)initUIWithFrame:(CGRect)frame
{
    CGFloat interitemSpacing = 30.f;
    CGFloat leadWidth = 20.f;
    CGFloat itemWidth = frame.size.width - (interitemSpacing + leadWidth)*2;
    CGFloat itemHeight = frame.size.height;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = interitemSpacing;
    layout.minimumLineSpacing = interitemSpacing;
    layout.sectionInset = UIEdgeInsetsMake(0, interitemSpacing + leadWidth, 0, interitemSpacing + leadWidth);
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = kBackgroundColor;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    [self addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:kTZMainContentCellIdentifier bundle:nil] forCellWithReuseIdentifier:kTZMainContentCellIdentifier];

}

- (void)loadDataSource:(NSArray<TZMainContentModel *> *)dataSource
{
    if (!dataSource) {
        return;
    }
    _dataSource = dataSource;
    [_collectionView reloadData];
}



#pragma mark
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TZMainContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTZMainContentCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    TZMainContentModel *model = _dataSource[indexPath.item];
    TZMainContentCell *mainContentcell = (TZMainContentCell *)cell;
    mainContentcell.data = model;
}

#pragma mark
#pragma mark UICollectionViewDelegate


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //将要结束拖拽
    CGFloat threshold = 0.2;
    
    NSArray *visibleCells = [_collectionView visibleCells];
    NSArray *sortedArray = [self sortArray:visibleCells.copy];
    //情况1：慢速，滚动到离屏幕中心最近的一个cell
    if (ABS(velocity.x) < threshold) {
        CGFloat centerX = scrollView.contentOffset.x + scrollView.width*0.5;
        CGFloat min = MAXFLOAT;
        for (TZMainContentCell *cell in sortedArray) {
            CGFloat distance = cell.centerX - centerX;
            if (ABS(distance) < ABS(min)) {
                min = distance;
            }
        }
        //实现的效果类似于微信读书的首页
//        targetContentOffset->x = scrollView.contentOffset.x + min;
        //实现的效果类似于today的首页.velocity过大就会出错，所以速度阀值设置为较小值0.2
//        NSLog(@"慢速 %lf" ,scrollView.contentOffset.x + min);
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x + min, scrollView.contentOffset.y) animated:YES];
        return;
    }
    
    //情况2：快速，向左快速滑动：滚动到右边的cell；向右快速滑动：滚动到左边的cell
    if (velocity.x >= threshold) {
        //向左快速滑动
        TZMainContentCell *cell = sortedArray.lastObject;
        targetContentOffset->x = cell.centerX - scrollView.width*0.5;
//        NSLog(@"向左");
        return;
    }
    
    if (velocity.x <= -threshold) {
        //向右快速滑动
        TZMainContentCell *cell = sortedArray.firstObject;
        targetContentOffset->x = cell.centerX - scrollView.width*0.5;
//        NSLog(@"向右");
        return;
    }
}

- (NSArray *)sortArray:(NSArray *)array
{
    NSArray *resultArray = [array sortedArrayUsingComparator:^NSComparisonResult(TZMainContentCell *obj1, TZMainContentCell *obj2) {
        if (obj1.data.completedDays < obj2.data.completedDays) {
            return NSOrderedAscending;
        }else {
            return NSOrderedDescending;
        }
    }];
    return resultArray;
}


@end
