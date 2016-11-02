//
//  DYtagButton.m
//  douyu
//
//  Created by Minghao on 16/11/2.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import "DYtagButton.h"

#define DYtagBtnRed 1
#define DYtagBtnBlue 127 / 255
#define DYtagBtnGreen 0
@implementation DYtagButton

- (void)setRatio:(CGFloat)ratio
{
    _ratio = ratio;
    
    CGFloat red = 0 + (DYtagBtnRed - 0) * ratio;
    CGFloat blue = 0 + (DYtagBtnBlue - 0) * ratio;
    CGFloat green = 0 + (DYtagBtnGreen - 0) * ratio;
    
    self.titleLabel.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end
