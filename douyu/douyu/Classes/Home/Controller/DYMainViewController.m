//
//  DYMainViewController.m
//  douyu
//
//  Created by Minghao on 16/11/2.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import "DYMainViewController.h"
#import "DYtagLabel.h"
#import "DYMainCollectionViewController.h"

@interface DYMainViewController ()<UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIView *tagView;

@end

@implementation DYMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 加载navigationBar属性
    [self setupNavigationBar];
    
    // 加载tagview的title
    [self setupTagViewTitle];
    // 加载scrollview中的子控制器
    [self setupChildVc];

    // 设置中间scrollview的配置
    [self setupContentScrollView];
    
    // 展现第一个子控制器
    [self scrollViewDidEndScrollingAnimation:_contentScrollView];
    
    
}
- (void)setupNavigationBar
{

    // 1. 设置leftbarbutton
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"homeLogoIcon"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickLogoBtn) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    // 2. 设置rightbarbutton
    UIButton *historyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [historyBtn setImage:[UIImage imageNamed:@"viewHistoryIcon"] forState:UIControlStateNormal];
    [historyBtn addTarget:self action:@selector(clickHistoryBtn) forControlEvents:UIControlEventTouchUpInside];
    [historyBtn sizeToFit];
    
    UIButton *scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [scanBtn setImage:[UIImage imageNamed:@"scanIcon"] forState:UIControlStateNormal];
    [scanBtn addTarget:self action:@selector(clickScanBtn) forControlEvents:UIControlEventTouchUpInside];
    [scanBtn sizeToFit];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setImage:[UIImage imageNamed:@"searchBtnIcon"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(clickSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn sizeToFit];
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithCustomView:historyBtn];
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithCustomView:scanBtn];
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    UIBarButtonItem *spaceBtn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceBtn1.width = 40;
    UIBarButtonItem *spaceBtn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceBtn2.width = 40;
    self.navigationItem.rightBarButtonItems = @[btn3, spaceBtn1, btn2, spaceBtn2, btn1];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.view.transform = CGAffineTransformMakeTranslation(0, -44);
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}
- (void)setupTagViewTitle
{
    NSArray *titles = @[@"推荐", @"游戏", @"娱乐", @"手游", @"趣玩"];
    
    NSUInteger count = titles.count;
    
    CGFloat w = self.tagView.bounds.size.width / count;
    CGFloat h = self.tagView.bounds.size.height;
    
    for (NSInteger i = 0; i < count; i++) {
        
        DYtagLabel *label = [[DYtagLabel alloc] init];
        
        label.text = titles[i];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.backgroundColor = [UIColor whiteColor];
        
        label.frame = CGRectMake(i * w, 0, w, h);
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
        
        label.userInteractionEnabled = YES;
        [self.tagView addSubview:label];
        if (i == 0) { // 最前面的label
            label.ratio = 1.0;
            }
    }
    
}

- (void)setupContentScrollView
{
    self.contentScrollView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentScrollView.backgroundColor = [UIColor yellowColor];
    self.contentScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * self.tagView.subviews.count, 0);

    self.contentScrollView.pagingEnabled = YES;
}

- (void)setupChildVc
{
    DYMainCollectionViewController *recommendVc = [[DYMainCollectionViewController alloc]initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    [self addChildViewController:recommendVc];
//    recommendVc.type = DYMainTableViewTypeRecommend;
    
    
    DYMainCollectionViewController *gameVc = [[DYMainCollectionViewController alloc]initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    [self addChildViewController:gameVc];
//    gameVc.type = DYMainTableViewTypeGame;
    
    
    DYMainCollectionViewController *recreationVc = [[DYMainCollectionViewController alloc]initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    [self addChildViewController:recreationVc];
//    recreationVc.type = DYMainTableViewTypeRecreation;
    
    
    DYMainCollectionViewController *mobileGameVc = [[DYMainCollectionViewController alloc]initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    [self addChildViewController:mobileGameVc];
//    mobileGameVc.type = DYMainTableViewTypeMobileGame;
    
        
    DYMainCollectionViewController *amusingVc = [[DYMainCollectionViewController alloc]initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    [self addChildViewController:amusingVc];
//    amusingVc.type = DYMainTableViewTypeAmusing;
    
}
#pragma mark - 标签栏点击事件
- (void)labelClick:(UITapGestureRecognizer *)tap
{
    
    // 让底部的内容scrollView滚动到对应位置
    // 1.获取button的索引
    NSUInteger index = [self.tagView.subviews indexOfObject:tap.view];

    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = self.contentScrollView.bounds.size.width * index;
    
    [self.contentScrollView setContentOffset:offset animated:YES];
    
    self.view.transform = CGAffineTransformMakeTranslation(0, -44);
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}

#pragma mark - navigationBar 按钮点击事件
- (void)clickLogoBtn
{
    
}

- (void)clickHistoryBtn
{
    
}

- (void)clickScanBtn
{
    
}

- (void)clickSearchBtn
{
    
}
#pragma mark <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 一些临时变量
    
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 当前位置需要显示的控制器的索引
    NSUInteger index = offsetX / width;
    
    // 取出需要显示的控制器
    UIViewController *willShowVc = self.childViewControllers[index];
    
    // 如果当前位置的位置已经显示过了，就直接返回
    if ([willShowVc isViewLoaded]) return;

    willShowVc.view.frame = CGRectMake(offsetX, 0, width, height);
    
    [scrollView addSubview:willShowVc.view];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    CGFloat ratio = offset.x / [UIScreen mainScreen].bounds.size.width;
    
    if (ratio < 0 || ratio > self.tagView.subviews.count - 1) return;
    
    // 获取左边btn
    NSUInteger currentIndex = ratio;
    DYtagLabel *currentLabel = self.tagView.subviews[currentIndex];
    
    // 获取右边btn
    NSUInteger nextIndex = ratio + 1;
    DYtagLabel *nextLabel = (nextIndex == self.tagView.subviews.count) ? nil : self.tagView.subviews[nextIndex];
    
    // 右边btn比例
    nextLabel.ratio = ratio - currentIndex;
    // 左边btn比例
    currentLabel.ratio = 1 - nextLabel.ratio;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
   
@end

