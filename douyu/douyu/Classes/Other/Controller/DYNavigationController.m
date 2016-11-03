//
//  DYNavigationController.m
//  douyu
//
//  Created by Minghao on 16/11/4.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import "DYNavigationController.h"

@interface DYNavigationController ()

@end

@implementation DYNavigationController
+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor colorWithRed:1 green:127 / 255.0 blue:0 alpha:1]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
