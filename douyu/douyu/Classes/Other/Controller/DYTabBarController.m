//
//  DYTabBarController.m
//  douyu
//
//  Created by Minghao on 16/11/2.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import "DYTabBarController.h"
#import "DYMainViewController.h"
#import "DYLivingViewController.h"
#import "DYFocusViewController.h"
#import "DYMineViewController.h"

@interface DYTabBarController ()

@end

@implementation DYTabBarController

+ (void)initialize
{
    // 设置UITabBarItem的title属性
    NSMutableDictionary *selectedAttributes = [NSMutableDictionary dictionary];
    selectedAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupChilVC];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChilVC
{
    
    [self setupChildVC:[[DYMainViewController alloc] init] title:@"首页" image:@"tabHome" selectedImage:@"tabHomeHL"];

    [self setupChildVC:[[DYLivingViewController alloc] init] title:@"直播" image:@"tabLiving" selectedImage:@"tabLivingHL"];
   
    [self setupChildVC:[[DYFocusViewController alloc] init] title:@"关注" image:@"tabFocus" selectedImage:@"tabFocusHL"];
   
    [self setupChildVC:[[DYMineViewController alloc] initWithStyle:UITableViewStylePlain] title:@"我的" image:@"tabMine" selectedImage:@"tabMineHL"];
    
}
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    
    // 设置title
    vc.tabBarItem.title = title;
    
    // 设置image
    vc.tabBarItem.image = [UIImage imageNamed:image];
    
    //    // 图片渲染设置
    //    selectedImage = [selectedImage02 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    [self addChildViewController:vc];
}

@end
