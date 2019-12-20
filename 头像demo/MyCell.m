//
//  MyCell.m
//  头像demo
//
//  Created by 未思语 on 2019/12/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MyCell.h"
#import "Masonry.h"



#define kWidth 50
@interface MyCell ()
{
    CALayer *shadowLayer;
}
@end

@implementation MyCell
@synthesize imgView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawUI];
    }
    return self;
}
-(void)drawUI {
   imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
       imgView.layer.cornerRadius = kWidth * 0.5;
       imgView.layer.masksToBounds = YES;
       [self.contentView addSubview:imgView];
       shadowLayer = [[CALayer alloc]init];
       shadowLayer.frame = imgView.frame;
       shadowLayer.backgroundColor = [UIColor redColor].CGColor;
       shadowLayer.cornerRadius = kWidth * 0.5;
       shadowLayer.shadowColor = [UIColor redColor].CGColor;
       shadowLayer.shadowOffset = CGSizeMake(0, 0);
       shadowLayer.shadowOpacity = 0.4;
       
       [self.contentView.layer addSublayer:shadowLayer];
       //两种添加都可以
//       [self.view bringSubviewToFront:imgView];
    [self.contentView.layer insertSublayer:imgView.layer above:shadowLayer];
       [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.top.mas_equalTo(15);
           make.width.height.mas_equalTo(kWidth);
           
       }];
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.textColor = [UIColor redColor];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imgView.mas_right).offset(15);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    
}
-(void)layoutSubviews {
    [super layoutSubviews];
    shadowLayer.frame = imgView.frame;
}

@end
