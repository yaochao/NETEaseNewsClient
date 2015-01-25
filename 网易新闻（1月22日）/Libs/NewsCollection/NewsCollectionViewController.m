//
//  NewsCollectionViewController.m
//  06-网易新闻
//
//  Created by apple on 15/1/21.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "NewsCollectionViewController.h"
#import "NewsCollectionCell.h"

@interface NewsCollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

/** url 的数组 */
@property (nonatomic, strong) NSArray *urlList;
@end

@implementation NewsCollectionViewController

- (NSArray *)urlList {
    if (_urlList == nil) {
        _urlList = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"NewsURLs.plist" withExtension:nil]];
    }
    return _urlList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 设置布局
    self.layout.itemSize = self.view.bounds.size;
    self.layout.minimumInteritemSpacing = 0.0;
    self.layout.minimumLineSpacing = 0.0;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // scrollView的属性
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.urlList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewsTableCell" forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) /255.0) green:((float)arc4random_uniform(256) /255.0) blue:((float)arc4random_uniform(256) /255.0) alpha:1.0];
    
    // 设置 URL
    cell.urlString = self.urlList[indexPath.item][@"urlString"];
    
    return cell;
}

@end
