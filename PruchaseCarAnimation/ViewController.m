//
//  ViewController.m
//  PruchaseCarAnimation
//
//  Created by zhenyong on 16/8/17.
//  Copyright © 2016年 com.demo. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "PurchaseCarAnimationTool.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
/// 图片
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private function
- (void)setUI
{
    if (_isList) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        tableView.delegate     = self;
        tableView.dataSource   = self;
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
        [tableView reloadData];
        [self.view addSubview:tableView];
    }
    else
    {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 80, 80)];
        [self.view addSubview:_imageView];
        [_imageView setImage:[UIImage imageNamed:@"watch"]];
        /// 添加购物车按钮
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 130, 42)];
        button.backgroundColor = [UIColor redColor];
        [button setTitle:@"加入购物车" forState:UIControlStateNormal];
        [self.view addSubview:button];
        /// 添加点击事件
        [button addTarget:self action:@selector(clickCar) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)clickCar
{
    [[PurchaseCarAnimationTool shareTool] startAnimationandView:_imageView
                                                           rect:_imageView.frame
                                                    finisnPoint:CGPointMake(ScreenWidth / 4 * 2.5, ScreenHeight - 49)
                                                    finishBlock:^(BOOL finish) {
                                                        UIView *tabbarBtn = self.tabBarController.tabBar.subviews[3];
                                                        [PurchaseCarAnimationTool shakeAnimation:tabbarBtn];
                                                    }];
}

#pragma mark -- Delegate and DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    /// 点击事件
    cell.clickCars = ^(UIImageView *imageView){
        CGRect rect = [tableView rectForRowAtIndexPath:indexPath];
        /// 获取当前cell 相对于self.view 当前的坐标
        rect.origin.y          = rect.origin.y - [tableView contentOffset].y;
        CGRect imageViewRect   = imageView.frame;
        imageViewRect.origin.y = rect.origin.y + imageViewRect.origin.y;
        //
        [[PurchaseCarAnimationTool shareTool] startAnimationandView:imageView
                                                               rect:imageViewRect
                                                        finisnPoint:CGPointMake(ScreenWidth / 4 * 2.5, ScreenHeight - 49)
                                                        finishBlock:^(BOOL finish) {
            UIView *tabbarBtn = self.tabBarController.tabBar.subviews[3];
            [PurchaseCarAnimationTool shakeAnimation:tabbarBtn];
        }];
    };
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 114;
}
@end
