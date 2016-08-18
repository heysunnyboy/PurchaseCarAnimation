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
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (strong , nonatomic)clickCars clickCars;
@end
