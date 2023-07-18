//
//  ShareTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import "ShareTableViewCell.h"

@implementation ShareTableViewCell

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
    
    CGFloat red = 34.0 / 255.0;
    CGFloat green = 133.0 / 255.0;
    CGFloat blue = 193.0 / 255.0;
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn1.backgroundColor = [UIColor clearColor];
    _btn1.titleLabel.backgroundColor = [UIColor clearColor];
    _btn1.tag = 101;
    //设置点赞与取消点赞
    UIImage *t1 = [UIImage imageNamed:@"button_zan.png"];
    t1 = [t1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原彩显示
    [_btn1 setImage:t1 forState:UIControlStateNormal];
    [_btn1 setTitle:@"101" forState:UIControlStateNormal];
    [_btn1 setTintColor:newColor];
    _btn1.tag = 101;
//    [_btn1 addTarget:self action:@selector(GoodButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_btn1];

    self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn2.backgroundColor = [UIColor clearColor];
    UIImage *t2 = [UIImage imageNamed:@"button_guanzhu.png"];
    t2 = [t2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原彩显示
    [_btn2 setImage:t2 forState:UIControlStateNormal];
    [_btn2 setTitle:@"50" forState:UIControlStateNormal];
    _btn2.tag = 101;
//    [_btn2 addTarget:self action:@selector(ViewButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_btn2];

    self.btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn3.backgroundColor = [UIColor clearColor];
    UIImage *t3 = [UIImage imageNamed:@"button_share.png"];
    t3 = [t3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原彩显示
    [_btn3 setImage:t3 forState:UIControlStateNormal];
    [_btn3 setTitle:@"44" forState:UIControlStateNormal];
    _btn3.tag = 101;
//    [_btn3 addTarget:self action:@selector(ShareButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_btn3];

    return self;
}

- (void)layoutSubviews {
    CGFloat cellWidth = self.contentView.frame.size.width / 2;
    CGFloat cellHeight = self.contentView.frame.size.height;
    
    _pictureView.frame = CGRectMake(0, 0, cellWidth - 20, 150);
    _titleLabel.frame = CGRectMake(cellWidth, 10, cellWidth, 25);
    _labelFirst.frame = CGRectMake(cellWidth, 35, cellWidth, 15);
    _labelSecond.frame = CGRectMake(cellWidth, 50, cellWidth, 15);
    _labelThird.frame = CGRectMake(cellWidth, 65, cellWidth, 15);
    
//    设置字体大小
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    _labelFirst.font = [UIFont systemFontOfSize:14.0];
    _labelSecond.font = [UIFont systemFontOfSize:14.0];
    _labelThird.font = [UIFont systemFontOfSize:14.0];
    
    CGFloat red = 34.0 / 255.0;
    CGFloat green = 133.0 / 255.0;
    CGFloat blue = 193.0 / 255.0;
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    _btn1.frame = CGRectMake(cellWidth, cellHeight - 30, 60, 20);
//    _btn1.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    //只有用负才往对应方向移动
    _btn1.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -5, -10);
    _btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_btn1 setTintColor:newColor];
//    button.titleLabel.font = [UIFont systemFontOfSize:16.0]; // 设置字体大小为16
    
    _btn2.frame = CGRectMake(cellWidth + 60, cellHeight - 30, 60, 20);
//    _btn2.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    _btn2.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -5, -10);
    _btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_btn2 setTintColor:newColor];
    
    _btn3.frame = CGRectMake(cellWidth + 120, cellHeight - 30, 60, 20);
//    _btn3.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    _btn3.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -5, -5);
    _btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_btn3 setTintColor:newColor];
    
    if (_titleLabel.text.length > 10) {
        _titleLabel.numberOfLines = 2;
        _titleLabel.frame = CGRectMake(cellWidth, 10, cellWidth, 25 + 25);
        _labelFirst.frame = CGRectMake(cellWidth, 35 + 25, cellWidth, 15);
        _labelSecond.frame = CGRectMake(cellWidth, 50 + 25, cellWidth, 15);
        _labelThird.frame = CGRectMake(cellWidth, 65 + 25, cellWidth, 15);
        
    }

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)GoodButtonTapped:(UIButton *)btn {
    if (btn.tag == 101) {
        _btn1.tag++;
        [_btn1 setTitle:@"102" forState:UIControlStateNormal];
    } else {
        _btn1.tag--;
        [_btn1 setTitle:@"101" forState:UIControlStateNormal];
    }
    
}

- (void)ViewButtonTapped:(UIButton *)btn {
    if (btn.tag == 101) {
        btn.tag++;
        [btn setTitle:@"51" forState:UIControlStateNormal];
    } else {
        btn.tag--;
        [btn setTitle:@"50" forState:UIControlStateNormal];
    }
}

- (void)ShareButtonTapped:(UIButton *)btn {
    if (btn.tag == 101) {
        btn.tag++;
        [btn setTitle:@"45" forState:UIControlStateNormal];
    } else {
        btn.tag--;
        [btn setTitle:@"44" forState:UIControlStateNormal];
    }
}

@end
