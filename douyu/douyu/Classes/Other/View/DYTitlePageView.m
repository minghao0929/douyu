//
//  DYTitlePageView.m
//  douyu
//
//  Created by Minghao on 16/11/3.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import "DYTitlePageView.h"
#import "DYtagLabel.h"

@implementation DYTitlePageView

//+ (instancetype)titlePageViewWithTitles:(NSArray *)titles
//{
//    UIView *view = [[self alloc] init];
//    
//    NSUInteger count = titles.count;
//    
//    for (NSInteger i = 0; i < count; i++) {
//       
//        DYtagLabel *label = [[DYtagLabel alloc] init];
//       
//        label.text = titles[i];
//        label.textColor = [UIColor blackColor];
//        label.textAlignment = NSTextAlignmentCenter;
//        
//        label.backgroundColor = [UIColor whiteColor];
//        
//        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
//        
//        [view addSubview:label];
//        if (i == 0) { // 最前面的label
//             label.ratio = 1.0;
//        }
//
//    
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}
@end

/*
CGFloat w = 100;
CGFloat h = self.titleScrollView.bounds.size.height;

for (NSInteger i = 0; i < 7; i++) {
    JMHHomeLabel *label = [[JMHHomeLabel alloc] init];
    label.text = [self.childViewControllers[i] title];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(w * i, 0, w, h);
    label.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    label.tag = i;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
    
    [self.titleScrollView addSubview:label];
    if (i == 0) { // 最前面的label
        label.scale = 1.0;
    }
}
// 隐藏scrollview的拖动条
self.titleScrollView.showsHorizontalScrollIndicator = NO;
self.titleScrollView.contentSize = CGSizeMake(w * 7, 0);
self.contentScrollView.contentSize = CGSizeMake(7 * [UIScreen mainScreen].bounds.size.width, 0);
// scollview的 分页功能
 
 */
