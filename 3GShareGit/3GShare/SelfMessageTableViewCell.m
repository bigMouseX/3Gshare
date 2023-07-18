//
//  SelfMessageTableViewCell.m
//  ZARA
//
//  Created by 夏楠 on 2023/6/1.
//

#import "SelfMessageTableViewCell.h"

@implementation SelfMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"selfmessage"]) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        
        self.name = [[UILabel alloc] init];
        [self.contentView addSubview:self.name];
        
    }
    return self;
}

- (void)layoutSubviews {
    self.name.frame = CGRectMake(50, 0, 100, 60);
    self.icon.frame = CGRectMake(15, 20, 20, 20);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (void)drawRect:(CGRect)rect {
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rect);
//
////    //上分割线，
////    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:198/255.0 green:198/255.0 blue:198/255.0 alpha:1].CGColor);
////    CGContextStrokeRect(context, CGRectMake(0, 0, rect.size.width, 1));
//
//    //下分割线
//    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:198/255.0 green:198/255.0 blue:198/255.0 alpha:1].CGColor);
//    CGContextStrokeRect(context, CGRectMake(50, rect.size.height, rect.size.width, 1));
//
//}
@end
