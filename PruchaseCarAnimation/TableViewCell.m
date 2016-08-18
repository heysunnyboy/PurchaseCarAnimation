//
//  TableViewCell.m
//  PruchaseCarAnimation
//
//  Created by zhenyong on 16/8/18.
//  Copyright © 2016年 com.demo. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addCar:(id)sender {
    if (_clickCars) {
        _clickCars(_goodImageView);
    }
}

@end
