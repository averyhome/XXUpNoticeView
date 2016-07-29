//
//  XXCarouselView.m
//  XXUpNoticeViewDemo
//
//  Created by 朱小亮 on 16/7/29.
//  Copyright © 2016年 zhusven. All rights reserved.
//

#import "XXCarouselView.h"

@interface XXCarouselView()<UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic)UICollectionView *collectionView;

@property (strong,nonatomic)NSTimer *timer;

@property (strong,nonatomic)NSMutableArray *dataSource;



@end

@implementation XXCarouselView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self need];
}

- (id)init{
    if (self == [super init]) {
        [self need];
    }
    return self;
}

- (NSMutableArray *)items{
    if (!_items) {
        _items = [[NSMutableArray alloc] initWithObjects:@"hello",@"world",@"zxl",@"大帅哥",@"哈哈哈哈😄",@"点赞的都是大帅哥",@"😄",nil];
    }
    return _items;
}


- (void)need{
  
    self.dataSource = [NSMutableArray arrayWithObjects:self.items[0],self.items[1], nil];
    
    [[self collectionView] setBackgroundColor:[UIColor clearColor]];
    [self timer];
}

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollAD:) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)scrollAD:(id)sender{
    

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];

    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateData) userInfo:nil repeats:NO];
    
}

- (void)updateData{
    id  obj = [self.dataSource lastObject];
    NSInteger index = [self.items indexOfObject:obj];
    id result;
    if (index==(self.items.count-1) ){
        result = [self.items firstObject];
    }else{
        result = [self.items objectAtIndex:index+1];
    }
    
    [self.dataSource removeObjectAtIndex:0];
    [self.dataSource addObject:result];
    
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
   [self.collectionView scrollToItemAtIndexPath:indexPath0 atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}



- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        CGRect frame = self.frame ;
        frame.origin.x = 0;
        frame.origin.y = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollEnabled = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self addSubview:_collectionView];
        
        
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _layout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataSource.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.frame];
    label.text = self.dataSource[indexPath.row];
    [cell.contentView addSubview:label];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.frame.size;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    id  obj = [self.dataSource objectAtIndex:indexPath.row];
    NSInteger index = [self.items indexOfObject:obj];
    
    NSLog(@"index = %d",index);
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}


@end
