//
//  DYMainViewController.m
//  douyu
//
//  Created by Minghao on 16/11/2.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import "DYMainViewController.h"
#import "DYtagButton.h"
#import "DYMainTableViewController.h"

@interface DYMainViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *recommend;
@property (weak, nonatomic) IBOutlet UIButton *game;
@property (weak, nonatomic) IBOutlet UIButton *recreation;
@property (weak, nonatomic) IBOutlet UIButton *amusing;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIView *tagView;

@end

@implementation DYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVc];
    
    self.contentScrollView.delegate = self;
    self.contentScrollView.backgroundColor = [UIColor yellowColor];
    self.contentScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.tagView.subviews.count, 0);
    self.contentScrollView.pagingEnabled = YES;
    [self scrollViewDidEndScrollingAnimation:_contentScrollView];
    
}

- (void)setupChildVc
{
    DYMainTableViewController *recommendVc = [[DYMainTableViewController alloc]init];
    [self addChildViewController:recommendVc];
    recommendVc.type = DYMainTableViewTypeRecommend;
    
    
    DYMainTableViewController *gameVc = [[DYMainTableViewController alloc] init];
    [self addChildViewController:gameVc];
    gameVc.type = DYMainTableViewTypeGame;
    
    
    DYMainTableViewController *recreationVc = [[DYMainTableViewController alloc]init];
    [self addChildViewController:recreationVc];
    recreationVc.type = DYMainTableViewTypeRecreation;
    
    
    DYMainTableViewController *mobileGameVc = [[DYMainTableViewController alloc]init];
    [self addChildViewController:mobileGameVc];
    mobileGameVc.type = DYMainTableViewTypeMobileGame;
    
        
    DYMainTableViewController *amusingVc = [[DYMainTableViewController alloc]init];
    [self addChildViewController:amusingVc];
    amusingVc.type = DYMainTableViewTypeAmusing;
    
}
- (IBAction)tagBtnClick:(UIButton *)sender {
    
    
    // 让底部的内容scrollView滚动到对应位置
    // 1.获取button的索引
    NSUInteger index = [self.tagView.subviews indexOfObject:sender];
    NSLog(@"%ld",index);
    
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = self.contentScrollView.frame.size.width * index;
    [self.contentScrollView setContentOffset:offset animated:YES];
}

//    
//    self.recommend.selected = YES;
//    self.game.selected = NO;
//    self.recreation.selected = NO;
//    self.amusing.selected = NO;
//    
//    // 让底部的内容scrollView滚动到对应位置
//    CGPoint offset = self.contentScrollView.contentOffset;
//    offset.x = self.contentScrollView.frame.size.width * 0;
//    [self.contentScrollView setContentOffset:offset animated:YES];


#pragma mark <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 一些临时变量
    
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSLog(@"------%f",offsetX);
    
    // 当前位置需要显示的控制器的索引
    NSUInteger index = offsetX / width;

    // 取出需要显示的控制器
    UIViewController *willShowVc = self.childViewControllers[index];
    
    // 如果当前位置的位置已经显示过了，就直接返回
    if ([willShowVc isViewLoaded]) return;

    willShowVc.view.frame = CGRectMake(offsetX, 0, width, height);
    
    [scrollView addSubview:willShowVc.view];


//    // 取出需要显示的控制器
//    UIViewController *willShowVc = self.childViewControllers[index];
//    
//    // 如果当前位置的位置已经显示过了，就直接返回
//    if ([willShowVc isViewLoaded]) return;
//    // 如果当前位置的位置已经显示过了，就直接返回
//    willShowVc.view.frame = CGRectMake(offsetX, 0, width, height);
//    
//    [scrollView addSubview:willShowVc.view];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    CGFloat ratio = offset.x / [UIScreen mainScreen].bounds.size.width;
    
    if (ratio < 0 || ratio > self.tagView.subviews.count - 1) return;
    
    // 获取左边btn
    NSUInteger currentIndex = ratio;
    DYtagButton *currentBtn = self.tagView.subviews[currentIndex];
    
    // 获取右边btn
    NSUInteger nextIndex = ratio + 1;
    DYtagButton *nextBtn = (nextIndex == self.tagView.subviews.count) ? nil : self.tagView.subviews[nextIndex];
    
    // 右边btn比例
    nextBtn.ratio = ratio - currentIndex;
    // 左边btn比例
    currentBtn.ratio = 1 - nextBtn.ratio;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


 #pragma mark - 修改StatusBar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
