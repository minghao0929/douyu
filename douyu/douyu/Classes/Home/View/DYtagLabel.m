//
//  DYtagLabel.m
//  douyu
//
//  Created by Minghao on 16/11/3.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import "DYtagLabel.h"

#define DYtagBtnRed 1
#define DYtagBtnGreen 127 / 255.0
#define DYtagBtnBlue 0

@implementation DYtagLabel

- (void)setRatio:(CGFloat)ratio
{
    _ratio = ratio;
    
    CGFloat red = 0 + (DYtagBtnRed - 0) * ratio;
    CGFloat blue = 0 + (DYtagBtnBlue - 0) * ratio;
    CGFloat green = 0 + (DYtagBtnGreen - 0) * ratio;
    
    self.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
}


@end
