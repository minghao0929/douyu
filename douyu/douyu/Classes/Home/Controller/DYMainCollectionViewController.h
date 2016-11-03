//
//  DYMainCollectionViewController.h
//  douyu
//
//  Created by Minghao on 16/11/3.
//  Copyright © 2016年 Minghao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    DYMainTableViewTypeRecommend = 1,
    DYMainTableViewTypeGame = 10,
    DYMainTableViewTypeRecreation = 29,
    DYMainTableViewTypeMobileGame = 31,
    DYMainTableViewTypeAmusing = 41
    
} DYMainTableViewType;

@interface DYMainCollectionViewController : UICollectionViewController

@end
