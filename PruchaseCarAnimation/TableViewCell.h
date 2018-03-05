//
//  TableViewCell.h
//  PruchaseCarAnimation
//
//  Created by zhenyong on 16/8/18.
//  Copyright © 2016年 com.demo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^clickCars)(UIImageView *goodImage);
@interface TableViewCell : UITableViewCell
/// 图片
@property (nonatomic, weak) IBOutlet UIImageView *goodImageView;
/// 点击购物车回调
@property (nonatomic, strong)clickCars clickCars;
@end
