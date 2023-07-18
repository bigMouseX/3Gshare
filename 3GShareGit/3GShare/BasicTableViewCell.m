//
//  BasicTableViewCell.m
//  ZARA
//
//  Created by 夏楠 on 2023/6/4.
//

#import "BasicTableViewCell.h"

@implementation BasicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"selfMessage"];
    if ([self.reuseIdentifier isEqualToString:@"selfMessage"]) {
        self.head = [[UIImageView alloc] init];
        [self.contentView addSubview:self.head];
        
        self.message1 = [[UILabel alloc] init];
        [self.contentView addSubview:self.message1];
        
        self.message2 = [[UILabel alloc] init];
        [self.contentView addSubview:self.message2];
    
//        self.headMessage = [[UILabel alloc] init];
        [self.contentView addSubview:self.headMessage];
        
//        self.btn1 = [[UIButton alloc] init];
//        [self.contentView addSubview:self.btn1];
//
//        self.btn2 = [[UIButton alloc] init];
//        [self.contentView addSubview:self.btn2];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return  self;
}

- (void)layoutSubviews {
    self.head.frame = CGRectMake(90, 5, 65, 65);
    self.message1.frame = CGRectMake(20, 10, 70, 60);
    self.message2.frame = CGRectMake(90, 10, UIScreen.mainScreen.bounds.size.width - 100, 60);
    self.headMessage.frame = CGRectMake(20, 10, 100, 80);
    self.selectedBackgroundView.frame = self.bounds;


    CGFloat cornerRadius = 10.0; // 设置圆角半径
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.head.bounds
                                               byRoundingCorners:UIRectCornerAllCorners
                                                     cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.head.layer.mask = shapeLayer;
    self.head.clipsToBounds = YES; // 确保视图剪裁到圆角边界
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
