//
//  SelectShareTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/15.
//

#import "SelectShareTableViewCell.h"

@implementation SelectShareTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"share"];
    
//    self.contentView.backgroundColor = [UIColor whiteColor];
    _pictureView = [[UIImageView alloc] init];
    [self.contentView addSubview:_pictureView];
    
    _labelFirst = [[UILabel alloc] init];
    [self.contentView addSubview:_labelFirst];
    
    _labelSecond = [[UILabel alloc] init];
    [self.contentView addSubview:_labelSecond];
    
    _labelThird = [[UILabel alloc] init];
    [self.contentView addSubview:_labelThird];
    
    _titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLabel];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn1.backgroundColor = [UIColor clearColor];
    UIImage *t1 = [UIImage imageNamed:@"button_zan.png"];
    t1 = [t1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原彩显示
    [_btn1 setImage:t1 forState:UIControlStateNormal];
    [_btn1 setTitle:@"101" forState:UIControlStateNormal];
    [self.contentView addSubview:_btn1];

    self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn2.backgroundColor = [UIColor clearColor];
    UIImage *t2 = [UIImage imageNamed:@"button_guanzhu.png"];
    t2 = [t2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原彩显示
    [_btn2 setImage:t2 forState:UIControlStateNormal];
    [_btn2 setTitle:@"50" forState:UIControlStateNormal];
    [self.contentView addSubview:_btn2];

    self.btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn3.backgroundColor = [UIColor clearColor];
    UIImage *t3 = [UIImage imageNamed:@"button_share.png"];
    t3 = [t3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原彩显示
    [_btn3 setImage:t3 forState:UIControlStateNormal];
    [_btn3 setTitle:@"44" forState:UIControlStateNormal];
    [self.contentView addSubview:_btn3];

    return self;
}

- (void)layoutSubviews {
    CGFloat cellWidth = self.contentView.frame.size.width / 2;
    CGFloat cellHeight = self.contentView.frame.size.height;
    
    _pictureView.frame = CGRectMake(5, 20, 70, 70);
    _titleLabel.frame = CGRectMake(100, 5 + 20, 40, 25);
    _labelFirst.frame = CGRectMake(cellWidth * 2 - 5 - 60, 5 + 20, 90, 20);
    _labelSecond.frame = CGRectMake(100, 35 + 20 + 5, cellWidth, 20);
    
//    设置字体大小
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    _labelFirst.font = [UIFont systemFontOfSize:14.0];
    _labelSecond.font = [UIFont systemFontOfSize:18.0];

    
    CGFloat red = 34.0 / 255.0;
    CGFloat green = 133.0 / 255.0;
    CGFloat blue = 193.0 / 255.0;
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    _btn1.frame = CGRectMake(cellWidth + 30, 65, 100, 10);
//    _btn1.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    //只有用负才往对应方向移动
    _btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_btn1 setTintColor:newColor];
//    button.titleLabel.font = [UIFont systemFontOfSize:16.0]; // 设置字体大小为16

    
    _btn2.frame = CGRectMake(cellWidth + 60 + 30, 65, 100, 10);
//    _btn2.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    _btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_btn2 setTintColor:newColor];
    
    _btn3.frame = CGRectMake(cellWidth + 120 + 30, 65, 100, 10);
//    _btn3.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    _btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_btn3 setTintColor:newColor];
    

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
