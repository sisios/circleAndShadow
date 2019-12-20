//
//  ViewController.m
//  头像demo
//
//  Created by 未思语 on 2019/12/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MyCell.h"


#define kWidth 50
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *imgView;
    CALayer *shadowLayer;
    
}
@property (nonatomic, strong) UITableView *settingTableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self test1];
    
//    [self test2];
//    [self.view setNeedsLayout];
//    [self.view layoutIfNeeded];
    
    self.dataArr = @[@"1",@"2",@"3",@"4",@"5"];
    [self.view addSubview:self.settingTableView];
    
}
-(void)viewWillLayoutSubviews {
    shadowLayer.frame = imgView.frame;
}
-(void)test1 {
    imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    imgView.layer.cornerRadius = kWidth * 0.5;
    
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.height.mas_equalTo(kWidth);
        
    }];
    imgView.layer.shadowColor = [UIColor redColor].CGColor;
    imgView.layer.shadowOffset = CGSizeMake(0, 0);
    imgView.layer.shadowOpacity = 0.4;
}
-(void)test2 {
    imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    imgView.layer.cornerRadius = kWidth * 0.5;
    imgView.layer.masksToBounds = YES;
    [self.view addSubview:imgView];
    shadowLayer = [[CALayer alloc]init];
    shadowLayer.frame = imgView.frame;
    shadowLayer.backgroundColor = [UIColor redColor].CGColor;
    shadowLayer.cornerRadius = kWidth * 0.5;
    shadowLayer.shadowColor = [UIColor redColor].CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0, 0);
    shadowLayer.shadowOpacity = 0.4;
    
    [self.view.layer addSublayer:shadowLayer];
    //两种添加都可以
//    [self.view bringSubviewToFront:imgView];
     [self.view.layer insertSublayer:imgView.layer above:shadowLayer];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.height.mas_equalTo(kWidth);
        
    }];
   
   
    
     
}
-(UITableView *)settingTableView {
    if (!_settingTableView) {
        _settingTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _settingTableView.backgroundColor = [UIColor lightGrayColor];
        _settingTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _settingTableView.delegate = self;
        _settingTableView.dataSource = self;
        _settingTableView.estimatedRowHeight = 0;
        _settingTableView.estimatedSectionFooterHeight = 0;
        _settingTableView.estimatedSectionHeaderHeight = 0;
        _settingTableView.tableFooterView = [UIView new];
    }
    return _settingTableView;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        
    }
    
    [cell layoutIfNeeded];
    cell.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = self.dataArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
