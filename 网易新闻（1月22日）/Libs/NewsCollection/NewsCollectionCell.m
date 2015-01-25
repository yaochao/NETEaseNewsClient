//
//  NewsCollectionCell.m
//  06-网易新闻
//
//  Created by apple on 15/1/21.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "NewsCollectionCell.h"
#import "NewsTableViewController.h"

@interface NewsCollectionCell()
@property (nonatomic, strong) NewsTableViewController *newsVC;
@end

@implementation NewsCollectionCell

/**
 下一个目标，不同的页面显示不同的数据！
 */
- (void)awakeFromNib {
    NSLog(@"%s", __FUNCTION__);
    // 目标：将新闻表格视图，添加到Cell中
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    // 刚才的方式，视图控制器是局部变量，出了作用域就会被释放！
    // 对表格的所有处理的都是控制器！
    // 强引用属性可以保证视图控制器不会被销毁
    self.newsVC = sb.instantiateInitialViewController;
    [self addSubview:self.newsVC.view];
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    
    self.newsVC.urlString = urlString;
}

@end
